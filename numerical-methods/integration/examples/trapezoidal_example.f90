!=======================================================================
! Example: Composite trapezoidal rule
!
! Demonstrates the use of the trapezoidal_rule subroutine to compute the
! definite integral of:
!
!               f(x) = x^2
!
! over the interval:
!
!               [0,1]
!
! The exact value of the integral is:
!
!                1
!               ∫ x**2 dx = 1/3
!                0
!
!-----------------------------------------------------------------------
!
! In order to use this example, you should type in the terminal:
!
! $ gfortran src/trapezoidal_rule.f90 examples/trapezoidal_example.f90 -o trapezoidal_example
! $ ./trapezoidal_example
!
!=======================================================================

program trapezoidal_example

   implicit none

   double precision :: a, b
   double precision :: integral
   double precision :: exact

   integer :: m

   double precision, external :: test_function


   ! Integration interval
   a = 0.d0
   b = 1.d0

   ! Number of subintervals: n = 2^m
   m = 8

   exact = 1.d0/3.d0


   ! Compute the integral
   call trapezoidal_rule(a, b, m, integral, test_function)


   ! Display results
   print *, "==========================================="
   print *, " Composite Trapezoidal Rule Example"
   print *, "==========================================="
   print *, "Function          : f(x) = x^2"
   print *, "Integration range : [0,1]"
   print *, "Expected integral :", exact
   print *, "Computed integral :", integral
   print *, "Absolute error    :", abs(integral-exact)
   print *, "==========================================="

end program trapezoidal_example


!=======================================================================
! Test function
!
! Evaluates:
!
!               f(x) = x^2
!
!=======================================================================

double precision function test_function(x)

   implicit none

   double precision :: x

   test_function = x**2

   return

end function test_function