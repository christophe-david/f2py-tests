module data_reader
    ! This module demonstrates the exchange of data between Fortran and Python
    ! Python should call get_python_data so it will store values in the
    ! py_data object from my_data
    use my_data
    use python_data
    implicit none

    private
    public get_python_data
contains

    subroutine get_python_data(get_python_size, get_python_array_value)
        ! This function will be called by Python.
        ! It populates the dummy_structure object.

        type(python_data_reader) :: reader

        ! These two procedures are Python callback functions
        procedure(itf_get_python_size) :: get_python_size
        procedure(itf_get_python_array_value) :: get_python_array_value

        ! This object will allow to get data from Python. It is intialized with the 2 callback functions.
        reader = python_data_reader(get_python_size, get_python_array_value)

        ! Here we feed the dummy_structure fields with Python data.
        dummy_structure%scalar = reader%get_scalar_value("data:scalar")
        dummy_structure%fixed_size = reader%get_array_value("data:array:fixed_size")
        dummy_structure%variable_size = reader%get_array_value("data:array:variable_size")
    end subroutine


end module
