REM For pre-building pyf file (before modification):
REM   python -m numpy.f2py -m demo -h demo.pyf types.f90 my_data.f90 data_reader.f90 process.f90 demo.f90


REM A currently unsolved f2py bug makes that produced dll files need to be put in the same
REM folder as the .pyd file (https://github.com/numpy/numpy/issues/16416)
del lib*.dll *.o *.mod

python -m numpy.f2py -c -m demo demo.pyf types.f90 my_data.f90 data_reader.f90 demo.f90
move demo\.libs\* .