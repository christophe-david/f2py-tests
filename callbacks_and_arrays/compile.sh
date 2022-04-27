#!/usr/bin/env bash
python -m numpy.f2py -c -m data_reader data_reader.pyf data_reader.f90
