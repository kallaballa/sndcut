#include <string>
#include <iostream>
#include <vector>
#include <sndfile.hh>
#include <boost/program_options.hpp>
#include <boost/format.hpp>
#include <samplerate.h>
#define _USE_MATH_DEFINES
#include <cmath>
#include <limits>
#include "aquila/global.h"
#include "aquila/functions.h"
#include "aquila/transform/FftFactory.h"
#include "aquila/source/FramesCollection.h"
#include "aquila/tools/TextPlot.h"

namespace po = boost::program_options;

using std::string;
using std::cerr;
using std::endl;
using std::vector;

double MM_PER_PT = 0.3527777;
double MM_PER_INCH = 25.4;

struct LaserCutter {
  double dpi_ = 1200;
};

struct LP {
  double diameter;
  double innerMargin;
  double outMargin;
  double centerHoleDiameter;
  double rpm;
  double amplitudeMax;
  double spacing;
  double rate;
};

struct AudioFiltering {
  bool normalize;
  bool riaa;
};

class SVG {
private:
  std::ostream& ostream_;
  double strokeWidth_;

  void write_svg_start(double width, double height, double resolution) {
    using namespace boost;
    string version = "1.0";
    string dtd = "http://tbd/tbd.dtd";

    format svgtag(
        string("<svg xmlns:dc=\"http://purl.org/dc/elements/1.1/\" ") + "xmlns:cc=\"http://creativecommons.org/ns#\" "
            + "xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" " + "xmlns:svg=\"http://www.w3.org/2000/svg\" "
            + "xmlns:xlink=\"http://www.w3.org/1999/xlink\" " + "xmlns=\"http://www.w3.org/2000/svg\" " + "width=\"%f\" " + "height=\"%f\" "
            + "resolution=\"%f\" " + "version=\"1.1\" " + "viewbox=\"0 0 %f %f\" >");

    string metadata = string("<metadata id=\"ccmetadata\">") + "<rdf:RDF>" + "<cc:Work rdf:about=\"\">" + "<dc:format>image/svg+xml</dc:format>"
        + "<dc:type rdf:resource=\"http://purl.org/dc/dcmitype/StillImage\" />" + "<dc:title></dc:title>" + "</cc:Work>" + "</rdf:RDF>" + "</metadata>";

    ostream_ << "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>" << std::endl;
    ostream_ << "<!-- Created with sndcut -->" << std::endl;
    ostream_ << (svgtag % width % height % resolution % width % height) << std::endl;
    ostream_ << metadata << std::endl;

  }

  void write_svg_end() {
    ostream_ << "</svg>" << std::endl;
  }

public:
  SVG(std::ostream& ostream, double width, double height, double resolution, double strokeWidth) : ostream_(ostream), strokeWidth_(strokeWidth) {
    write_svg_start(width, height, resolution);
  }

  ~SVG() {
    write_svg_end();
  }

  void writeCircle(double cx, double cy, double r) {
    ostream_ << "<circle fill='none' stroke='#00ff00' stroke-width='" << strokeWidth_ << "' cx='" << cx << "' cy='" << cy << "' r='" << r << "'/>" << std::endl;
  }

  void startLayer() {
    ostream_ << "<g>" << std::endl;
  }

  void endLayer() {
    ostream_ << "</g>" << std::endl;
  }

  void startPath(const double& x, const double& y) {
    ostream_ << "<path fill='none' stroke='#0000ff' stroke-width='" << strokeWidth_ << "' " << "d='M" << x << "," << y << " L" << x << "," << y << " ";
  }

  void startPath(const double& previousX, const double& previousY, const double& x, const double& y) {
    ostream_ << "<path fill='none' stroke='#0000ff' stroke-width='" << strokeWidth_ << "' " << "d='M" << x << "," << y << " L" << x << "," << y << " ";
  }

  void endPath() {
    ostream_ << "'/>" << std::endl;
  }

  void writePoint(const double& x, const double& y) {
    ostream_ << x << "," << y << " ";
  }
};


double mix_channels(vector<double>& buffer) {
  double avg = 0;
  for(double& d: buffer) {
    avg += d;
  }
  avg /= buffer.size();

  return avg;
}

std::vector<double> read_fully(SndfileHandle& file, size_t channels) {
  std::vector<double> data;
  vector<double> buffer(channels);

  while (file.read(buffer.data(), channels) > 0) {
    data.push_back(mix_channels(buffer));
  }

  return data;
}

std::vector<double> resample(vector<double> data, double sourceSampleRate, double targetSampleRate) {
  double sourceRatio = targetSampleRate / sourceSampleRate;
  size_t sourceSize = data.size();
  size_t targetSize = (sourceSize * sourceRatio) + 1;
  float* f_source = new float[sourceSize];
  float* f_target = new float[targetSize];

  std::vector<double> d_target;

  for(size_t i = 0; i < data.size(); ++i) {
    f_source[i] = data[i];
  }

  SRC_DATA src_data;

  src_data.data_in = f_source;
  src_data.input_frames = sourceSize;
  src_data.data_out = f_target;
  src_data.output_frames = targetSize;
  src_data.src_ratio = sourceRatio;
  src_data.end_of_input = 1;

  src_simple(&src_data, SRC_SINC_BEST_QUALITY, 1);

  for(size_t i = 0; i < targetSize; ++i) {
    d_target.push_back(f_target[i]);
  }


  delete[] f_source;
  delete[] f_target;

  return d_target;
}

struct InverseRIAALookup {
  struct Entry {
    double hz;
    double energy;
  };

  //values taken from http://de.wikipedia.org/wiki/Schneidkennlinie
  Entry entries[4] = {
      {50, pow(10.0,17.0 / 20.0) / 10 * -1.0},
      {500, pow(10.0, 3.0 / 20.0) / 10 * -1.0},
      {1000, pow(10.0, 0.0 / 20.0) / 10},
      {2120, pow(10.0, 3.0 / 20.0) / 10}
  };
};

vector<double> inverse_RIAA_filter(vector<double>& source, size_t samplingRate) {
  using namespace Aquila;
  vector<double> target;
  InverseRIAALookup lookup;
  const std::size_t SIZE = 128;

  SignalSource in(source, samplingRate);
  FrequencyType sampleFreq = samplingRate;

  FramesCollection frames(in,SIZE);
  SpectrumType filterSpectrum(SIZE);
  double data[SIZE];

  for (auto frame : frames) {
   auto signalFFT = FftFactory::getFft(SIZE);
    SpectrumType signalSpectrum = signalFFT->fft(frame.toArray());
    for (std::size_t i = 0; i < SIZE; ++i) {
      filterSpectrum[i] = 1.0;

      for(size_t j = 0; j < 3; ++j) {
        size_t minBin = 0;
        double minEnergy = -1;
        size_t maxBin = (SIZE * lookup.entries[j].hz / sampleFreq);
        double maxEnergy = lookup.entries[j].energy;
        if(j >= 1) {
          minBin = (SIZE * lookup.entries[j - 1].hz / sampleFreq);
          minEnergy = lookup.entries[j - 1].energy;
        }

        if (i <= maxBin) {
          if(i == 0 || maxBin == 0)
            filterSpectrum[i] = 0.0;
          else
            filterSpectrum[i] = 1.0 + (minEnergy + (fabs(maxEnergy - minEnergy) * ((double)(i - minBin) / (double)(maxBin - minBin))));
          break;
        }
      }
    }
    /*
    //Plot the filter spectrum
    Aquila::TextPlot plt("Filter Spectrum:");
    plt.plotSpectrum(filterSpectrum);
     */

    // the following call does the multiplication of two spectra
    // (which is complementary to convolution in time domain)
    std::transform(std::begin(signalSpectrum), std::end(signalSpectrum), std::begin(filterSpectrum), std::begin(signalSpectrum),
        [&] (ComplexType x, ComplexType y) {
      return x * y;
    });

    signalFFT->ifft(signalSpectrum, data);
    for(size_t i = 0; i < SIZE; ++i) {
      target.push_back(data[i]);
    }
  }

  return target;
}

void normalize(std::vector<double>& data) {
  double min = std::numeric_limits<double>().max();
  double max = std::numeric_limits<double>().min();

  for (double& d : data) {
    min = std::min(min, d);
    max = std::max(max, d);
  }

  double delta = (max - min);
  double mid = min + (delta / 2);
  double scale = 2 / delta;

  for (double& d : data) {
    d = (d - mid) * scale;
  }
}

void run(SndfileHandle& file, LP& lp, SVG& svg, LaserCutter& lc, AudioFiltering& af) {
  size_t channels = file.channels();
  double sourceSampleRate = file.samplerate();;

  vector<double> data = read_fully(file, channels);
  if(lp.rate != 0 && lp.rate != sourceSampleRate) {
    std::cerr << "resampling from: " << sourceSampleRate << "hz to: " << lp.rate << "hz" << std::endl;
    data = resample(data, sourceSampleRate, lp.rate);
  } else {
    lp.rate = sourceSampleRate;
  }

  if(af.riaa)
    data = inverse_RIAA_filter(data, lp.rate);

  if(af.normalize)
    normalize(data);

  double a = 360.0 / (lp.rate * (60.0 / lp.rpm));
  double aRad = a * ((double) M_PI / 180.0);
  double r = 0;
  double theta = 0;
  double x = 0;
  double y = 0;
  double previousX;
  double previousY;

  long i = 0;

  double widthPT = lp.diameter / MM_PER_PT;
  double heightPT = widthPT;
  double lpRadiusPT = (lp.diameter / 2) / MM_PER_PT;
  r = lpRadiusPT;
  r = r - (lp.outMargin / MM_PER_PT);

  // Calculate starting point
  x = r * cos(theta) + lpRadiusPT;
  y = r * sin(theta) + lpRadiusPT;
  previousX = x;
  previousY = y;

  svg.writeCircle(lpRadiusPT, lpRadiusPT, lpRadiusPT);
  svg.writeCircle(lpRadiusPT, lpRadiusPT, (lp.centerHoleDiameter / MM_PER_PT) /2);
  svg.startLayer();

  // Starting draw groove
  svg.startPath(x,y);

  double amp = 0.0;
  double ampMax = lp.amplitudeMax / MM_PER_PT;

  for (double & sample : data) {
    if (r > lp.centerHoleDiameter + lp.innerMargin) {
      amp = sample * ampMax;

      x = (r + amp) * cos(theta) + lpRadiusPT;
      y = (r + amp) * sin(theta) + lpRadiusPT;

      // Check the distance between last point and new point for limitation of output dpi
      if (hypot(previousX - x, previousY - y) >= (((MM_PER_INCH / lc.dpi_) / MM_PER_PT))) {
        svg.writePoint(x,y);
        previousX = x;
        previousY = y;
      }
    } else {
      break;
    }

    // Separate <path> tag each 1000 points
    if (i >= 1000 && i % 1000 == 0) {
      svg.endPath();
      svg.startPath(previousX, previousY, x, y);
    }

    i++;
    theta -= aRad;
    r -= (ampMax + (lp.spacing / MM_PER_PT)) / (lp.rate * (60.0 / lp.rpm));
  }

  // Close groove path
  svg.endPath();
  svg.endLayer();

  //Draw run-out groove
  svg.startPath(x,y);

  for (double d = 0; d < M_PI * 4; d += M_PI * 2 / lc.dpi_) {
    x = (r) * cos(theta) + widthPT / 2;
    y = (r) * sin(theta) + heightPT / 2;
    svg.writePoint(x,y);
    theta -= M_PI * 2 / lc.dpi_;
    r -= 1.0 / lc.dpi_; // Descrease 1pt while this loop
  }
  for (double d = 0; d < M_PI * 2; d += M_PI * 2 / lc.dpi_) {
    x = (r) * cos(theta) + widthPT / 2;
    y = (r) * sin(theta) + heightPT / 2;
    svg.writePoint(x,y);
    theta -= M_PI * 2 / lc.dpi_;
  }

  svg.endPath();
}

int main(int argc, char** argv) {
  /*
   * All distance options are in millimeter.
   */
  string audioFile;

  double diameter = 150;
  double rpm = 78;
  double amplitudeMax = 0.15;
  double spacing = 0.7;
  double innerMargin = 100;
  double outerMargin = 5;
  double centerHoleDiameter = 7;
  double sampleRate = 8000;
  double svgPathStrokeWidth = 0.025;
  double dpi = 1200;
  bool riaaFilter = true;
  bool normalize = true;

  po::options_description genericDesc("Options");
  genericDesc.add_options()("diameter,d", po::value<double>(&diameter)->default_value(diameter),"The diameter of the record in mm")
      ("rate,r", po::value<double>(&sampleRate)->default_value(sampleRate), "The sampe rate in Hz of the resulting record. Automatic resampling will be done if it differs from the input file sample rate. Setting this parameter to zero will adopt the sample rate of the input file.")
      ("rpm,m", po::value<double>(&rpm)->default_value(rpm), "Target RPM of the record")
      ("amplitude,a", po::value<double>(&amplitudeMax)->default_value(amplitudeMax), "The maximum amplitude in mm")
      ("spacing,s", po::value<double>(&spacing)->default_value(spacing), "The space in between lines in mm")
      ("inner,i", po::value<double>(&innerMargin)->default_value(innerMargin), "The inner margin of the record in mm")
      ("outer,o", po::value<double>(&outerMargin)->default_value(outerMargin), "The outer margin of the record in mm")
      ("center,c", po::value<double>(&centerHoleDiameter)->default_value(centerHoleDiameter), "The center hole diameter in mm")
      ("stroke,t", po::value<double>(&svgPathStrokeWidth)->default_value(svgPathStrokeWidth), "The stroke width in the svg file in mm")
      ("dpi,p", po::value<double>(&dpi)->default_value(dpi), "The laser cutter DPI.")
      ("enable-normalize,n", po::value<bool>(&normalize)->default_value(dpi), "Enable audio normalization")
      ("enable-riaafilter,f", po::value<bool>(&riaaFilter)->default_value(dpi), "Enable inverse RIAA equalization")
      ("help,h", "Produce help message");

  po::options_description hidden("Hidden options");
  hidden.add_options()("audioFile", po::value<string>(&audioFile), "audioFile");

  po::options_description cmdline_options;
  cmdline_options.add(genericDesc).add(hidden);

  po::positional_options_description p;
  p.add("audioFile", -1);

  po::options_description visible;
  visible.add(genericDesc);

  po::variables_map vm;
  po::store(po::command_line_parser(argc, argv).options(cmdline_options).positional(p).run(), vm);
  po::notify(vm);

  if (vm.count("help") || audioFile.empty()) {
    std::cerr << "Usage: sndcut [options] <audioFile>\n";
    std::cerr << visible;
    return 0;
  }

  LP lp = { diameter, innerMargin, outerMargin, centerHoleDiameter, rpm, amplitudeMax, spacing, sampleRate };
  LaserCutter lc;
  lc.dpi_ = dpi;
  SVG svg(std::cout, diameter / MM_PER_PT, diameter/ MM_PER_PT, dpi, svgPathStrokeWidth/ MM_PER_PT);
  AudioFiltering af = { normalize, riaaFilter };
  SndfileHandle file = SndfileHandle(audioFile);

  run(file, lp, svg, lc, af);

  return 0;
}
