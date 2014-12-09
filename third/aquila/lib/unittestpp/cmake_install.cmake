# Install script for directory: /home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/libUnitTest++.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/UnitTest++" TYPE FILE FILES
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TestMacros.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/Config.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/CurrentTest.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TestResults.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/MemoryOutStream.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/CompositeTestReporter.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/ExecuteTest.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TestList.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/ReportAssert.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TestReporterStdout.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TestDetails.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/HelperMacros.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TestSuite.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TestReporter.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/Checks.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/UnitTest++.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/CheckMacros.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/DeferredTestResult.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TestRunner.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/ReportAssertImpl.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/AssertException.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/DeferredTestReporter.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/UnitTestPP.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/ExceptionMacros.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TimeHelpers.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/TimeConstraint.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/XmlTestReporter.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/Test.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/UnitTest++/Posix" TYPE FILE FILES
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/Posix/TimeHelpers.h"
    "/home/elchaschab/devel/sndcut/third/aquila/lib/unittestpp/UnitTest++/Posix/SignalTranslator.h"
    )
endif()

