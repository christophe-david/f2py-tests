module demo
    use types
    use my_data

    implicit none


contains

    subroutine main()

        print *, py_data%sum_all()
    end subroutine

end module demo
