REM Compilation script for Windows

REM For pre-building pyf file (before modification):
REM   python -m numpy.f2py -m demo -h demo.pyf python_data_reader.f90 python_data_writer.f90 data_bridge.f90 main.f90


REM A currently unsolved f2py bug makes that produced dll files need to be put in the same
REM folder as the .pyd file (https://github.com/numpy/numpy/issues/16416)
del lib*.dll *.o *.mod

python -m numpy.f2py -c -m demo demo.pyf types.f90 dummy_data.f90 python_data_reader.f90 python_data_writer.f90 data_bridge.f90 main.f90
move demo\.libs\* .