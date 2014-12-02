#include <string>
#include <iostream>
#include <vector>
#include <sndfile.hh>
#include <boost/program_options.hpp>
#include <boost/format.hpp>
#define _USE_MATH_DEFINES
#include <cmath>
#include <limits>
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
            + "xmlns:xlink=\"http://www.w3.org/1999/xlink\" " + "xmlns=\"http://www.w3.org/2000/svg\" " + "width=\"%fmm\" " + "height=\"%fmm\" "
            + "resolution=\"%f\" " + "version=\"1.1\" " + "viewbox=\"0mm 0mm %fmm %fmm\" >");

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

  void drawCircle(double cx, double cy, double r) {
    ostream_ << "<circle fill='none' stroke='#00ff00' stroke-width='" << strokeWidth_ << "mm' cx='" << cx << "mm' cy='" << cy << "mm' r='" << r << "mm'/>" << std::endl;
  }

  void startLayer() {
    ostream_ << "<g>" << std::endl;
  }

  void endLayer() {
    ostream_ << "</g>" << std::endl;
  }

  void startPath(const double& x, const double& y) {
    ostream_ << "<path fill='none' stroke='#0000ff' stroke-width='" << strokeWidth_ << "mm' " << "d='M" << x << "," << y << " L" << x << "," << y << " ";
  }

  void startPath(const double& previousX, const double& previousY, const double& x, const double& y) {
    ostream_ << "<path fill='none' stroke='#0000ff' stroke-width='" << strokeWidth_ << "mm' " << "d='M" << x << "," << y << " L" << x << "," << y << " ";
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
    assert(d >= -1);
    assert(d <= 1);
    min = std::min(min, d);
    max = std::max(max, d);
  }
}

void run(SndfileHandle& file, LP& lp, SVG& svg, LaserCutter& lc, double samplingRateOverride) {
  size_t channels = file.channels();
  size_t rate = file.samplerate();

  if(samplingRateOverride != 0)
    rate = samplingRateOverride;

  double a = 360.0 / (rate * (60.0 / lp.rpm));
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
  x = r * cos((float) theta) + lpRadiusPT;
  y = r * sin((float) theta) + lpRadiusPT;
  previousX = x;
  previousY = y;

  svg.drawCircle(lp.diameter/2, lp.diameter/2, lp.diameter/2);
  svg.drawCircle(lp.diameter/2, lp.diameter/2, lp.centerHoleDiameter/2);
  svg.startLayer();

  // Starting draw groove
  svg.startPath(x,y);

  vector<double> data = read_fully(file, channels);
  normalize(data);
  double amp = 0.0;
  double ampMax = lp.amplitudeMax / MM_PER_PT;

  for (double & sample : data) {
    if (r > lp.centerHoleDiameter + lp.innerMargin) {
      amp = sample * ampMax;

      x = (r + amp) * cos((float) theta) + lpRadiusPT;
      y = (r + amp) * sin((float) theta) + lpRadiusPT;

      // Check the distance between last point and new point for limitation of output dpi
      double dist = hypot(previousX - x, previousY - y);
      if (dist >= (((MM_PER_INCH / lc.dpi_) / MM_PER_PT))) {
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
    r -= (ampMax + (lp.spacing / MM_PER_PT)) / (rate * (60.0 / lp.rpm));
  }

  // Close groove path
  svg.endPath();
  svg.endLayer();

  //Draw run-out groove
  svg.startPath(x,y);

  for (double d = 0; d < M_PI * 4; d += M_PI * 2 / lc.dpi_) {
    x = (r) * cos((float) theta) + widthPT / 2;
    y = (r) * sin((float) theta) + heightPT / 2;
    svg.writePoint(x,y);
    theta -= M_PI * 2 / lc.dpi_;
    r -= 1.0 / lc.dpi_; // Descrease 1pt while this loop
  }
  for (double d = 0; d < M_PI * 2; d += M_PI * 2 / lc.dpi_) {
    x = (r) * cos((float) theta) + widthPT / 2;
    y = (r) * sin((float) theta) + heightPT / 2;
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
  double samplingRateOverride = 0; // zero means auto-detect

  double diameter = 300;
  double rpm = 45;
  double amplitudeMax = 0.15;
  double spacing = 0.7;
  double innerMargin = 100;
  double outerMargin = 5;
  double centerHoleDiameter = 7.24;

  double svgPathStrokeWidth = 0.025;

  double dpi = 1200;

  po::options_description genericDesc("Options");
  genericDesc.add_options()("diameter,d", po::value<double>(&diameter)->default_value(diameter),"The diameter of the record in mm")
      ("rate,r", po::value<double>(&samplingRateOverride)->default_value(samplingRateOverride), "Manual override for the sampling rate of the record in Hz. The default is auto-detection from the input file.")
      ("rpm,m", po::value<double>(&rpm)->default_value(rpm), "Target RPM of the record")
      ("amplitude,a", po::value<double>(&amplitudeMax)->default_value(amplitudeMax), "The maximum amplitude in mm")
      ("spacing,s", po::value<double>(&spacing)->default_value(spacing), "The space in between lines in mm")
      ("inner,i", po::value<double>(&innerMargin)->default_value(innerMargin), "The inner margin of the record in mm")
      ("outer,o", po::value<double>(&outerMargin)->default_value(outerMargin), "The outer margin of the record in mm")
      ("center,c", po::value<double>(&centerHoleDiameter)->default_value(centerHoleDiameter), "The center hole diameter in mm")
      ("stroke,t", po::value<double>(&svgPathStrokeWidth)->default_value(svgPathStrokeWidth), "The stroke width in the svg file in mm")
      ("dpi,p", po::value<double>(&dpi)->default_value(dpi), "The laser cutter DPI.")
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
    std::cerr << "Usage: sndcut [options] <AudioFile>\n";
    std::cerr << visible;
    return 0;
  }

  LP lp = { diameter, innerMargin, outerMargin, centerHoleDiameter, rpm, amplitudeMax, spacing };
  LaserCutter lc;
  lc.dpi_ = dpi;
  SVG svg(std::cout, diameter, diameter, dpi, svgPathStrokeWidth);
  SndfileHandle file = SndfileHandle(audioFile);

  run(file, lp, svg, lc, samplingRateOverride);
  return 0;
}
