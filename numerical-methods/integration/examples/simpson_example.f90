!=======================================================================
! Example: Composite Simpson's rule
!
! Demonstrates the use of the simpson_rule subroutine to compute the
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
!                   1
!               ∫ x² dx = 1/3
!                   0
!
!-----------------------------------------------------------------------
!
! In order to use this example, you should type in the terminal:
!
! $ gfortran src/simpson_rule.f90 examples/simpson_example.f90 -o simpson_example
! $ ./simpson_example
!
!=======================================================================

program simpson_example

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
   call simpson_rule(a, b, m, integral, test_function)


   ! Display results
   print *, "==========================================="
   print *, " Composite Simpson Rule Example"
   print *, "==========================================="
   print *, "Function          : f(x) = x^2"
   print *, "Integration range : [0,1]"
   print *, "Expected integral :", exact
   print *, "Computed integral :", integral
   print *, "Absolute error    :", abs(integral-exact)
   print *, "==========================================="

end program simpson_example


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