module data_bridge
    ! This module demonstrates the exchange of data between Fortran and Python.
    ! Python should call get_python_data so it will store values in the
    ! dummy_structure object from dummy_data.
    use dummy_data
    use python_data_reader
    use python_data_writer
    implicit none

contains

    subroutine get_python_data(get_python_size, get_python_array_value)
        ! This function will be called by Python.
        ! It populates the dummy_structure object.

        type(py_data_reader) :: reader

        ! These two procedures are Python callback functions
        procedure(itf_get_python_size) :: get_python_size
        procedure(itf_get_python_array_value) :: get_python_array_value

        ! This object will allow to get data from Python. It is intialized with the 2 callback functions.
        reader = py_data_reader(get_python_size, get_python_array_value)

        ! Here we feed the dummy_structure fields with Python data.
        dummy_structure%scalar = reader%get_scalar_value("data:scalar")
        dummy_structure%fixed_size = reader%get_array_value("data:array:fixed_size")
        dummy_structure%variable_size = reader%get_array_value("data:array:variable_size")
    end subroutine

    subroutine set_python_data(set_python_array_value)
        ! This function will be called by Python.
        ! It sends value from the dummy_structure object.

        type(py_data_writer) :: writer

        ! Python callback function
        procedure(itf_set_python_array_value) :: set_python_array_value

        ! This object will allow to get data from Python. It is intialized with the 2 callback functions.
        writer = py_data_writer(set_python_array_value)

        ! Here we send data from dummy_structure to Python
        call writer%set_scalar_value("data:sum", dummy_structure%sum_all())
        call writer%set_array_value("data:result", dummy_structure%result)
    end subroutine

end module
