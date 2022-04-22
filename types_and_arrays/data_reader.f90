module data_reader
    use types
    use my_data

    implicit none

contains

    subroutine get_data(get_python_size, get_python_value)
        implicit none
        external get_python_size
        external get_python_value
        integer :: get_python_size

        character(:), allocatable :: variable_name

        variable_name = "data:scalar"
!        py_data%scalar = get_value(variable_name, get_python_size, get_python_value)
        variable_name = "data:array:fixed_size"
        py_data%fixed_size = get_value(variable_name, get_python_size, get_python_value)
        variable_name = "data:array:variable_size"
        py_data%variable_size = get_value(variable_name, get_python_size, get_python_value)

        print *, py_data%variable_size
    end subroutine


    function get_value(variable_name, get_python_size, get_python_value) result(value)
        real, allocatable :: value (:)
        character(:), allocatable :: variable_name
        external get_python_size
        external get_python_value
        integer :: get_python_size

        integer :: n

        n = get_python_size(variable_name)
        allocate(value(n))
        call get_python_value(variable_name, value, n)

    end function

end module data_reader
