module types
    ! Definition of derived types

    implicit none
    public BunchOfArrays

    type :: BunchOfArrays
        ! Dummy class to demonstrate Python data exchange for scalars and arrays.
        real :: scalar
    end type

end module
