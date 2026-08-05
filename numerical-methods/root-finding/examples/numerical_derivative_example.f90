!=======================================================================
! Example: Numerical derivative
!
! Demonstrates the use of the numerical_derivative subroutine to compute
! the first derivative of the function:
!
!               f(x) = x^2
!
! The exact derivative is:
!
!               f'(x) = 2x
!
! The function is evaluated at equally spaced points, and the numerical
! derivative is compared with the analytical solution.
!
!-----------------------------------------------------------------------
!
! In order to use this example, type the following commands in the terminal:
!
! $ gfortran src/numerical_derivative.f90 examples/numerical_derivative_example.f90 -o numerical_derivative_example
! $ ./numerical_derivative_example
!
!=======================================================================

program numerical_derivative_example

   implicit none

   integer, parameter :: ndat = 11

   integer :: i

   double precision :: x(0:ndat-1)
   double precision :: fu(0:ndat-1)
   double precision :: dfu(0:ndat-1)
   double precision :: exact_derivative

   double precision :: x_min
   double precision :: x_max
   double precision :: h


   ! Define the interval
   x_min = 0.d0
   x_max = 10.d0

   ! Uniform step size
   h = (x_max - x_min) / (ndat - 1)


   ! Evaluate the function f(x) = x^2
   do i = 0, ndat-1

      x(i) = x_min + i*h

      fu(i) = x(i)**2

   end do


   ! Compute the numerical derivative
   call numerical_derivative(ndat, x, fu, dfu)


   ! Display results
   print *, "==============================================================="
   print *, " Numerical Derivative Example"
   print *, "==============================================================="
   print *, " Function: f(x) = x^2"
   print *, ""
   print *, "     x        Numerical        Exact          Absolute Error"
   print *, "---------------------------------------------------------------"

   do i = 0, ndat-1

      exact_derivative = 2.d0*x(i)

      write(*,'(F8.3,3X,F12.6,3X,F12.6,3X,E12.4)') &
           x(i), dfu(i), exact_derivative, &
           abs(dfu(i)-exact_derivative)

   end do

   print *, "==============================================================="

end program numerical_derivative_example