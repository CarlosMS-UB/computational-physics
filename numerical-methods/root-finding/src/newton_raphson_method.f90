!=======================================================================
! Newton-Raphson method for root finding
!
! Finds a root of a differentiable function using the Newton-Raphson
! iterative algorithm.
!
! The method updates the approximation according to:
!
!              x(n+1) = x(n) - f(x(n))/f'(x(n))
!
! The algorithm requires:
!   - A suitable initial guess
!   - A non-zero derivative at each iteration
!
! Inputs:
!   x_initial : Initial approximation of the root
!   t         : Additional parameter required by the function evaluation
!               (can be ignored if not needed)
!   eps       : Desired convergence tolerance
!   fun       : External subroutine returning:
!                 function_value  -> f(x)
!                 derivative_value -> f'(x)
!
! Outputs:
!   niter     : Number of iterations performed
!   xroot     : Final approximation of the root
!
!=======================================================================

subroutine newton_raphson_method(x_initial, t, eps, fun, niter, xroot)

   implicit none

   double precision :: x_initial
   double precision :: x_current, x_new
   double precision :: xroot
   double precision :: eps, t

   double precision :: function_value
   double precision :: derivative_value

   integer :: niter
   integer, parameter :: max_iterations = 1000

   external :: fun


   ! Initial approximation
   x_current = x_initial

   niter = 0


   ! Newton-Raphson iteration
   do while (niter < max_iterations)

      niter = niter + 1


      ! Evaluate function and derivative at current point
      call fun(x_current, t, function_value, derivative_value)


      ! Avoid division by zero
      if (derivative_value == 0.d0) then
         exit
      end if


      ! Newton-Raphson update
      x_new = x_current - function_value / derivative_value


      ! Check convergence
      if (abs(x_new - x_current) < eps) then
         x_current = x_new
         exit
      end if


      ! Update current approximation
      x_current = x_new

   end do


   ! Return final root approximation
   xroot = x_current


   return

end subroutine newton_raphson_method