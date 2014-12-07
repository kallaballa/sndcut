sndcut is a program the generates LP records from audio files - it generates an SVG file that you can laser cut.
it's implementation is inspired by https://github.com/mitsuhito/CuttingRecordGenerator

#Usage

Using sndcut is very simple. to generate a record you simply have to invoke it with an audio file (usually a wav file since mp3 is not supported. have a look [here](http://www.mega-nerd.com/libsndfile/#Features) for supported file types.

See the following examples for how to use sndcut for basic usage.

#Examples
In this repository included are two pregenerated examples. They both were generated from the same wav file (imperial.wav). Please note that sndcut does automatic resampling of the audio data (default: 8000hz)

Command line used to generated imperial_short.svg: 

    sndcut imperial.wav > imperial_short.svg

Command line used to generated imperial_long.svg:

    # a diameter of 300 millimeters
    sndcut -d300 imperial.wav > imperial_long.svg


#Packages
There are linux packages available for following distributions: 
- Fedora 20
- OpenSUSE (13.1, 13.2, Factory)
- Debian 7.0 
- Ubuntu (14.04, 14.10)

[Download](http://software.opensuse.org/download.html?project=home%3Aelchaschab&package=sndcut)
