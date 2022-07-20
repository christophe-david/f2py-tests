import f_types
import numpy as np
x = f_types.Types.BunchOfArrays()

print(x.scalar)
print(x.fixed_size)
x.scalar = 1.0
x.fixed_size = np.arange(5)
print(x.scalar)
print(x.fixed_size)
