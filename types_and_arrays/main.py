import demo
import numpy as np

from data_provider import DataProvider

if __name__ == "__main__":
    data = DataProvider(
        {
            "data:scalar": 42.0,
            "data:array:fixed_size": np.array([1.0, 2.0, 3.0, 4.0, 5.0]),
            "data:array:variable_size": np.arange(20) * -10.0,
        }
    )

    demo.data_reader.get_data(data.get_size, data.get_value)
    demo.demo.main()
    print("\n*** OK ***")
