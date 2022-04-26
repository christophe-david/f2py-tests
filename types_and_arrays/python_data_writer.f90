module python_data_writer
    ! This module is used to send data to Python.
    abstract interface
        ! Interface of Python function.
        subroutine itf_set_python_array_value(variable_name, value, n)
            character(*), intent(in) :: variable_name
            real, dimension(n), intent(in) :: value
            integer, intent(in) :: n
        end subroutine
    end interface

    type py_data_writer
        ! Class responsible for sending data to Python.
        ! This procedure pointers are expected to point to a Python function/method.
        procedure (itf_set_python_array_value), nopass, pointer :: set_python_array_value => null()
    contains
        procedure :: set_array_value
        procedure :: set_scalar_value
    end type

contains

    subroutine set_array_value(self, variable_name, value)
        class(py_data_writer), intent(in) :: self
        ! Returns value of the specified array variable.
        character(*) :: variable_name
        real, allocatable :: value (:)

        integer :: n

        n = size(value)
        call self%set_python_array_value(variable_name, value, n)
    end subroutine

    subroutine set_scalar_value(self, variable_name, value)
        class(py_data_writer), intent(in) :: self
        ! Returns value of the specified array variable.
        character(*) :: variable_name
        real :: value

        real :: value_as_array(1)

        value_as_array(1) = value
        call self%set_python_array_value(variable_name, value_as_array, 1)
    end subroutine

end module