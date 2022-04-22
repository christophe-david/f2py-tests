module process
    use types
    use my_data

    implicit none


contains

    subroutine do_work()

        print *, py_data%sum_all()
    end subroutine

end module
