module types
    ! Definition of derived types

    implicit none
    public BunchOfArrays

    type :: BunchOfArrays
        ! Dummy class to demonstrate Python data exchange for scalars and arrays.
        real :: scalar
        real :: fixed_size(5)
    end type

end module
