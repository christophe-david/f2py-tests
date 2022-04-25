module types
    ! Definition of derived types

    implicit none
    public bunch_of_arrays

    type :: bunch_of_arrays
        ! Dummy class to demonstrate Python data exchange for scalars and arrays.
        real :: scalar
        real :: fixed_size(5)
        real, allocatable :: variable_size(:)

    contains
        procedure :: sum_all
    end type

contains

    real function sum_all(self) result(res)
        class(bunch_of_arrays), intent(in) :: self
        ! Simple dummy method for just doing stuff with attributes
        ! Returns the sum of all stored terms.

        res = self%scalar + sum(self%fixed_size) + sum(self%variable_size)
    end function

end module
