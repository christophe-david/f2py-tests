module types
    implicit none
    private
    public bunch_of_arrays

    type :: bunch_of_arrays
        real :: scalar
        real :: fixed_size(5)
        real, allocatable :: variable_size(:)

    contains
        procedure :: sum_all
    end type

contains

    real function sum_all(self) result(res)
        class(bunch_of_arrays), intent(in) :: self
        integer :: i

        res = self%scalar + sum(self%fixed_size) + sum(self%variable_size)
    end function

end module
