REM A currently unsolved f2py bug makes that produced dll files need to be put in the same
REM folder as the .pyd file (https://github.com/numpy/numpy/issues/16416)

del lib*.dll
python -m numpy.f2py -c -m data_reader data_reader.pyf data_reader.f90
move data_reader\.libs\* .