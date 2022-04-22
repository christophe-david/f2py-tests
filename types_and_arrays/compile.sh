# For pre-building pyf file (before modification):
#   python -m numpy.f2py -m demo -h demo.pyf types.f90 my_data.f90 data_reader.f90 process.f90 demo.f90


# A currently unsolved f2py bug makes that produced dll files need to be put in the same
# folder as the .pyd file (https://github.com/numpy/numpy/issues/16416)
rm -f *.o *.mod *.so

export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib" # fix for recent macOS from https://stackoverflow.com/a/65428700/16488238
#gfortran -c types.f90 my_data.f90 data_reader.f90 process.f90 demo.f90
python -m numpy.f2py -c -m demo demo.pyf types.f90 my_data.f90 data_reader.f90 process.f90 demo.f90
