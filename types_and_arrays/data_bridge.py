from collections import UserDict

import numpy as np


class DataBridge(UserDict):
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

    def get_array_value(self, variable_name):
        """
        Fills `array` with value of specified variable.
        """
        print(f"[PYTHON][DataBridge] Sending variable {variable_name}: {self[variable_name]}")
        return self[variable_name]

    def set_array_value(self, variable_name, array: np.ndarray):
        """
        Gets value of specified variable from `array`.
        """
        # We have to copy the array because memory of input array may be released as soon
        # as Fortran module gets unused.
        self[variable_name] = np.array(array)
        print(f"[PYTHON][DataBridge] Received variable {variable_name}: {self[variable_name]}")
