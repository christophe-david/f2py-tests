module data_reader
    ! This module demonstrates the exchange of data between Fortran and Python
    ! Python should call get_python_data so it will store values in the
    ! py_data object from my_data
    use types
    use my_data

    implicit none

    private
    public get_python_data
contains

    subroutine get_python_data(get_python_size, get_python_array_value, get_python_scalar_value)
        ! This function will be called by Python.
        ! It populates the py_data object.
        external get_python_size
        integer :: get_python_size
        external get_python_array_value
        external get_python_scalar_value
        real :: get_python_scalar_value

        character(:), allocatable :: variable_name

        variable_name = "data:scalar"
        py_data%scalar = get_scalar_value(variable_name, get_python_scalar_value)
        variable_name = "data:array:fixed_size"
        py_data%fixed_size = get_array_value(variable_name, get_python_size, get_python_array_value)
        variable_name = "data:array:variable_size"
        py_data%variable_size = get_array_value(variable_name, get_python_size, get_python_array_value)
    end subroutine


    function get_array_value(variable_name, get_python_size, get_python_array_value) result(value)
        ! Uses provided Python functions to get value of the specified array variable.
        real, allocatable :: value (:)

        character(:), allocatable :: variable_name
        external get_python_size
        external get_python_value
        integer :: get_python_size

        integer :: n

        n = get_python_size(variable_name)
        allocate(value(n))
        call get_python_array_value(variable_name, value, n)

    end function

    function get_scalar_value(variable_name, get_python_scalar_value) result(value)
        ! Uses provided Python function to get value of the specified scalar variable.
        real :: value

        character(:), allocatable :: variable_name
        external get_python_scalar_value
        real :: get_python_scalar_value

        value = get_python_scalar_value(variable_name)

    end function

end module
