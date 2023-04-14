# Shows how to create the signature file
python -m numpy.f2py ../01_quick/fib1.f -m fib2 -h fib1.pyf

# Generated signature file is modified ans saved into fib2.pyf

# Compilation
python -m numpy.f2py -c fib2.pyf ../01_quick/fib1.f
