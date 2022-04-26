module main
    use dummy_data
    implicit none
contains

    subroutine do_stuff()
        print *, "[FORTRAN] Scalar value is: ", dummy_structure%scalar
        print *, "[FORTRAN] Fixed-size array is: ", dummy_structure%fixed_size
        print *, "[FORTRAN] Variable-size array is: ", dummy_structure%variable_size

        print *, "[FORTRAN] Sum of all terms:", dummy_structure%sum_all()

        dummy_structure%result = 2 * dummy_structure%fixed_size
    end subroutine

end module
