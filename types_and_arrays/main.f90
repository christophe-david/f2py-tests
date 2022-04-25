module main
    use types
    use my_data

    implicit none


contains

    subroutine do_stuff()
        print *, "Scalar value is: ", dummy_structure%scalar
        print *, "Fixed-size array is: ", dummy_structure%fixed_size
        print *, "Variable-size array is: ", dummy_structure%variable_size

        print *, "Sum of all terms:", dummy_structure%sum_all()
    end subroutine

end module
