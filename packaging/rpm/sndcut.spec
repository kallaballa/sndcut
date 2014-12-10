#
# spec file for package sndcut (Version 1.0)
#
# Copyright 2009 SUSE LINUX Products GmbH, Nuernberg, Germany.
# Copyright (C) 2009-2010 Amir Hassan <amir@viel-zu.org> and Marius Kintel <marius@kintel.net>
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# needsrootforbuild

Summary: Let's you generated LPs that you can laser cut from audio files.
Name: sndcut
Version: 1.0
Release: 1
License: GPLv2+
Group: Hardware/Other
URL: https://github.com/kallaballa/sndcut
Packager: Amir Hassan <amir@viel-zu.org>
%if %{defined suse_version}
BuildRequires: gcc-c++ boost-devel libsndfile-devel libsamplerate-devel pkg-config
PreReq: cmake
Requires: libboost_program_options1_54_0 libsndfile libsamplerate0
%else
BuildRequires: gcc-c++ boost-devel libsndfile-devel libsamplerate-devel pkg-config
PreReq: cmake
Requires: boost-program-options libsndfile libsamplerate
%endif
Source:       %{name}-%{version}.tar.bz2
BuildRoot:    %{_tmppath}/%{name}-%{version}-build

%description
sndcut is a program the generates LP records from audio files - it generates an SVG file that you can laser cut.
 
# extract source tar ball
%prep
%setup -q

%build
./build_deps.sh
make

%install
make DESTDIR="%{buildroot}" PREFIX="%{_prefix}" install 

%post
 exit 0

%clean
# clean up the hard disc after build
#rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc README.md LICENSE

%{_bindir}/sndcut

