from collections import UserDict
import numpy as np


class DataProvider(UserDict):
    def get_size(self, identifier):
        return np.shape(self[identifier])

    def get_array_value(self, identifier, array: np.ndarray):
        array[:] = self[identifier][:]

    def get_scalar_value(self, identifier):
        return self[identifier]
