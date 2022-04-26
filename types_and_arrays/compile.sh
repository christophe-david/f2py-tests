#!/usr/bin/env bash
# Compilation script for Linux and macOS

# For pre-building pyf file (before modification):
#   python -m numpy.f2py -m demo -h demo.pyf python_data_reader.f90 python_data_writer.f90 data_bridge.f90 main.f90


rm -f *.o *.mod *.so

export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib" # fix for recent macOS from https://stackoverflow.com/a/65428700/16488238
python -m numpy.f2py -c -m demo demo.pyf types.f90 dummy_data.f90 python_data_reader.f90 python_data_writer.f90 data_bridge.f90 main.f90
