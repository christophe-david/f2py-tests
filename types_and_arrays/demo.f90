module demo
    use types
    use my_data

    implicit none


contains

    subroutine main()
        print *, py_data%scalar
        print *, py_data%fixed_size
        print *, py_data%variable_size

        print *, py_data%sum_all()
    end subroutine

end module demo
