#!/usr/bin/env bash

rm .f2py_f2cmap *.pyd f90wrap*.f90 *.mod *.o *.dll

gfortran -c types.f90
f90wrap -m f_types types.f90
f2py -c -m _f_types types.o f90wrap_types.f90
mv _f_types/.libs/*.dll .

echo -- RUN ------------------------------------------
python main.py