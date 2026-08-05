!=======================================================================
! Example: Newton-Raphson method
!
! Demonstrates the use of the newton_raphson_method subroutine to compute
! a root of the nonlinear equation:
!
!               f(x) = x^2 - 2
!
! The exact positive root is:
!
!               sqrt(2) ≈ 1.414213562373095
!
! The initial guess is chosen close to the desired root in order to
! ensure rapid convergence of the Newton-Raphson algorithm.
!
!-----------------------------------------------------------------------
!
! In order to use this example, type the following commands in the terminal:
!
! $ gfortran src/newton_raphson_method.f90 examples/newton_raphson_example.f90 -o newton_raphson_example
! $ ./newton_raphson_example
!
!=======================================================================

program newton_raphson_example

   implicit none

   double precision :: x_initial
   double precision :: xroot
   double precision :: eps
   double precision :: t

   integer :: niter

   external :: test_function


   ! Initial guess
   x_initial = 1.d0

   ! Additional parameter (not used in this example)
   t = 0.d0

   ! Desired tolerance
   eps = 1.d-8


   ! Compute the root
   call newton_raphson_method(x_initial, t, eps, test_function, niter, xroot)


   ! Display results
   print *, "==========================================="
   print *, " Newton-Raphson Method Example"
   print *, "==========================================="
   print *, "Function          : f(x) = x^2 - 2"
   print *, "Expected root     : 1.414213562373095..."
   print *, "Computed root     :", xroot
   print *, "Iterations        :", niter
   print *, "Absolute error    :", abs(xroot - sqrt(2.d0))
   print *, "==========================================="

end program newton_raphson_example


!=======================================================================
! Test function
!
! Evaluates:
!
!               f(x) = x^2 - 2
!
! The first derivative is:
!
!               f'(x) = 2x
!
! Both the function value and its derivative are returned since they are
! required by the Newton-Raphson algorithm.
!
!=======================================================================

subroutine test_function(x, t, function_value, derivative_value)

   implicit none

   double precision :: x
   double precision :: t
   double precision :: function_value
   double precision :: derivative_value


   function_value = x**2 - 2.d0

   derivative_value = 2.d0*x


   return

end subroutine test_function