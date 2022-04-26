import demo
import numpy as np

from data_bridge import DataBridge

if __name__ == "__main__":

    # Definition of data.
    # OpenMDAO inputs/outputs will have a similar structure
    data_bridge = DataBridge()
    data_bridge.data = {
        "data:scalar": 42.0,
        "data:array:fixed_size": np.array([1.0, 2.0, 3.0, 4.0, 5.0]),
        "data:array:variable_size": np.arange(20) * -10.0,
    }

    # Send data to Fortran
    demo.data_bridge.get_python_data(data_bridge.get_size, data_bridge.get_array_value)

    # If memory is shared, the first element of the fixed size array will be 500.
    # (Spoiler: it will not)
    data_bridge["data:array:fixed_size"][0] = 500.0

    # Do some processing
    demo.main.do_stuff()

    # Gets data to Fortran
    demo.data_bridge.set_python_data(data_bridge.set_array_value)
    print("-------------------------------------------")
    print("[PYTHON] returned sum is:", data_bridge.data["data:sum"])
    print("[PYTHON] computed value is:", data_bridge.data["data:result"])
