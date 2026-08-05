!=======================================================================
! Example: Bisection method
!
! Demonstrates the use of the bisection_method subroutine to compute a
! root of the nonlinear equation:
!
!               f(x) = x^2 - 2
!
! The exact positive root is:
!
!               sqrt(2) ≈ 1.414213562373095
!
! The search interval [1,2] satisfies:
!
!               f(1) < 0
!               f(2) > 0
!
! making it suitable for the bisection algorithm.
!
!-----------------------------------------------------------------------
!
! In order to use this example, you should type in the terminal the following:
! $ gfortran src/bisection_method.f90 examples/bisection_example.f90 -o bisection_example
! $ ./bisection_example
!
!=======================================================================

program bisection_example

   implicit none

   double precision :: a, b
   double precision :: eps
   double precision :: xroot
   integer :: niter

   external :: test_function


   ! Initial search interval
   a = 1.d0
   b = 2.d0

   ! Desired tolerance
   eps = 1.d-8


   ! Compute the root
   call bisection_method(a, b, eps, test_function, niter, xroot)


   ! Display results
   print *, "==========================================="
   print *, " Bisection Method Example"
   print *, "==========================================="
   print *, "Function          : f(x) = x^2 - 2"
   print *, "Expected root     : 1.414213562373095..."
   print *, "Computed root     :", xroot
   print *, "Iterations        :", niter
   print *, "Absolute error    :", abs(xroot - sqrt(2.d0))
   print *, "==========================================="

end program bisection_example


!=======================================================================
! Test function
!
! Evaluates:
!
!               f(x) = x^2 - 2
!
! The derivative is also returned to maintain compatibility with the
! interface used by the numerical methods library.
!
!=======================================================================

subroutine test_function(x, function_value, derivative_value)

   implicit none

   double precision :: x
   double precision :: function_value
   double precision :: derivative_value


   function_value = x**2 - 2.d0

   derivative_value = 2.d0*x


   return

end subroutine test_function