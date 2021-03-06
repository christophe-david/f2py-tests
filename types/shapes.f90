module shapes
    implicit none
    private
    public rectangle

    type :: rectangle
        real :: length = 0.0
        real :: width = 0.0
    contains
        procedure :: area
    end type

contains

    real function area(self) result(res)
        class(rectangle), intent(in) :: self
        res = self%length * self%width
    end function

end module shapes