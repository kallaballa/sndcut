sndcut is a program the generates LP records from audio files - it generates either a SVG file for laser cutting or g-code for a 3-axis cnc mill.
Its implementation is inspired by https://github.com/mitsuhito/CuttingRecordGenerator but it does some additional things (e.g.: RIAA equalization) to improve sound quality of the records.

# Usage

Using sndcut is very simple. To generate a record you simply have to invoke it with an audio file (usually a wav or ogg file since **mp3 is not supported**. Have a look [here](http://www.mega-nerd.com/libsndfile/#Features) for supported file types.

The following examples will give you and idea of the basic usage. But you should be aware that you can tweak following parameters:

- The diameter of the record in mm
- The sampling rate in Hz of the resulting record. Automatic resampling will be done if it differs from the input file sampling rate. Setting this parameter to zero will adopt the sampling rate of the input file
- Target RPM of the record
- The maximum amplitude in mm
- The space in between lines in mm
- The inner margin of the record in mm
- The outer margin of the record in mm
- The center hole diameter in mm
- The stroke width in the svg file in mm
- The DPI of the laser cutter
- RIAA equalization
- Audio normalization
- **Tons of options for g-code generation**

See sndcut -h for advanced usage.

# Examples
In this repository included are 3 pregenerated examples. All were generated from the same wav file (imperial.wav). Please note that sndcut does automatic resampling of the audio data (default: 8000hz)

Command line used to generate imperial_short.svg for a laser cutter: 

    sndcut imperial.wav > imperial_short.svg

Command line used to generate imperial_long.svg for a laser cutter:

    # a diameter of 300 millimeters
    sndcut -d300 imperial.wav > imperial_long.svg

Command line used to generate imperial.nc.gz for a cnc mill:

    # a 2mm milling cutter, a cut rate of 100mm/s, a plunge rate of 100mm/s, a material depth of 4mm, a groove depth of 0.1mm, a save depth of 10mm, a depth increment of 1mm for cutting and a depth increment of 0.1mm for the groove.
    sndcut -r 44100 -p 10000 -g --gmc 2 --gcf 100 --gpf 100 --gmd 4 --ggd 0.1 --gsd 10 --gmi 1 --ggi 0.1 imperial.wav > imperial.nc
    gzip imperial.nc

# Laser Cutting
The material I used is 5mm acrylic. I used a Epilog Legend 36Ext (60W) with following settings:
- Green lines - Speed: 12%, Power: 100%
- Blue lines - Speed: 10%, Power: 3%

If you happen to own a Epilog Legend 36Ext laser cutter you can use the ".cut" files included in the examples folder. Those files have all settings done and are ready to laser with [Ctrl-Cut](http://github.com/Metalab/ctrl-cut)

#Packages
There are linux packages available for following distributions: 
- Fedora 20
- OpenSUSE (13.1, 13.2, Factory)
- Debian 7.0 
- Ubuntu (14.04, 14.10)
- Arch

[Download](http://software.opensuse.org/download.html?project=home%3Aelchaschab&package=sndcut)

[Download Arch Linux](https://aur.archlinux.org/packages/sndcut/)

#Build

You'll need to install the development version of following libraries:
- boost_program_options
- libsamplerate
- libsndfile
- cmake

After you installed the dependencies all you have to do is type

    ./build_deps.sh
    make

Aside from linux it has been reported to build on Mac OS X.
