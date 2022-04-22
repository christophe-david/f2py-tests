module process
    use types
    use my_data

    implicit none


contains

    subroutine do_work()

        print *, py_data%scalar + sum(py_data%fixed_size) + sum(py_data%variable_size)
    end subroutine

end module
