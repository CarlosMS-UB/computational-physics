!=======================================================================
! Example: Improved Euler method
!
! Solves:
!
!                  y'' = -y
!
! with:
!
!                  y(0)  = 1
!                  y'(0) = 0
!
! The exact solution is y(x) = cos(x).
!
!=======================================================================

program improved_euler_example

   implicit none

   integer, parameter :: n_steps = 1000
   double precision, parameter :: pi = 3.141592653589793d0
   double precision, parameter :: initial_x = 0.d0
   double precision, parameter :: final_x = 2.d0*pi

   double precision :: y(0:n_steps), dy(0:n_steps)
   double precision :: numerical_value, exact_value, absolute_error

   y(0) = 1.d0
   dy(0) = 0.d0

   call improved_euler(n_steps, y, dy, equation, initial_x, final_x)

   numerical_value = y(n_steps)
   exact_value = cos(final_x)
   absolute_error = abs(numerical_value-exact_value)

   print *, "=============================================="
   print *, "Improved Euler Method"
   print *, "=============================================="
   print *
   print *, "Equation: y'' = -y"
   print *, "Initial conditions: y(0) = 1, y'(0) = 0"
   print *, "Interval: [0, 2*pi]"
   print *, "Number of steps:", n_steps
   print *
   print *, "Numerical value: ", numerical_value
   print *, "Exact value:     ", exact_value
   print *, "Absolute error:  ", absolute_error
   print *, "=============================================="

contains

   double precision function equation(value)

      implicit none

      double precision, intent(in) :: value

      equation = -value

      return

   end function equation

end program improved_euler_example
