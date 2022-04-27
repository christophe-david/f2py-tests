module python_data_reader
    ! This module is used to get data from Python.
    abstract interface
        ! Interfaces of Python functions.
        function itf_get_python_size(variable_name) result (n)
            character(*) :: variable_name
            integer :: n
        end function
        subroutine itf_get_python_array_value(variable_name, value, n)
            character(*), intent(in) :: variable_name
            real, dimension(n), intent(out) :: value
            integer, intent(in) :: n
        end subroutine
    end interface

    type py_data_reader
        ! Class responsible for getting data from Python.
        ! The two procedure pointers are expected to point to Python functions/methods.
        procedure (itf_get_python_size), nopass, pointer :: get_python_size => null()
        procedure (itf_get_python_array_value), nopass, pointer :: get_python_array_value => null()
    contains
        procedure :: get_array_value
        procedure :: get_scalar_value
    end type

contains

    function get_array_value(self, variable_name) result(value)
        class(py_data_reader), intent(in) :: self
        ! Returns value of the specified array variable.
        real, allocatable :: value (:)
        character(*) :: variable_name

        integer :: n

        n = self%get_python_size(variable_name)
        allocate(value(n))
        call self%get_python_array_value(variable_name, value, n)
        print *, "[FORTRAN][py_data_reader] Received array variable ", variable_name, ":", value

    end function

    function get_scalar_value(self, variable_name) result(value)
        class(py_data_reader) :: self
        ! Returns value of the specified scalar variable.
        real :: value
        character(*) :: variable_name

        real :: value_as_array(1)

        call self%get_python_array_value(variable_name, value_as_array, 1)
        value = value_as_array(1)
        print *, "[FORTRAN][py_data_reader] Received scalar variable ", variable_name, ":", value
   end function

end module