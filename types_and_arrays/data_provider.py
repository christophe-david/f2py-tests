from collections import UserDict

import numpy as np


class DataProvider(UserDict):
    """
    Class that will provide data to Fortran code.

    Methods `get_size` and `get_array_value` will be called back by Fortran.
    """

    def get_size(self, variable_name):
        """
        Returns size of specified data.

        Fortran will use it to size its array.
        """
        return np.size(self[variable_name])

    def get_array_value(self, variable_name, array: np.ndarray):
        """
        Fills `array` with value of specified variable.
        """
        array[:] = self[variable_name]
