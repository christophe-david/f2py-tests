# Generating C wrapper
python -m numpy.f2py ../01_quick/fib1.f -m fib2 --lower
rm -rf builddir
meson setup builddir
meson compile -C builddir
cd builddir
python -c "import numpy as np; import fib2; a = np.zeros(9); fib2.fib(a); print (a)"
