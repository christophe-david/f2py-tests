import demo
import numpy as np

from data_provider import DataProvider

if __name__ == "__main__":

    # Definition of data.
    # OpenMDAO inputs/outputs will have a similar structure
    data_provider = DataProvider()
    data_provider.data = {
        "data:scalar": 42.0,
        "data:array:fixed_size": np.array([1.0, 2.0, 3.0, 4.0, 5.0]),
        "data:array:variable_size": np.arange(20) * -10.0,
    }

    # Send data to Fortran
    demo.data_reader.get_python_data(
        data_provider.get_size, data_provider.get_array_value
    )

    # Do some processing
    demo.main.do_stuff()

    print("\n*** OK ***")
