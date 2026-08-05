!=======================================================================
! Bisection method for root finding
!
! Finds a root of a continuous function using the bisection algorithm.
!
! The method requires an initial interval [a,b] such that:
!
!              f(a) * f(b) < 0
!
! This condition guarantees that at least one root exists inside the
! interval according to the Intermediate Value Theorem.
!
! At each iteration, the interval is divided by computing the midpoint:
!
!              midpoint = (a+b)/2
!
! The subinterval containing the sign change is selected as the new search
! interval. The process is repeated until the required tolerance is reached.
!
! Inputs:
!   a      : Lower bound of the initial interval
!   b      : Upper bound of the initial interval
!   eps    : Desired tolerance
!   fun    : External subroutine returning:
!              function_value   -> f(x)
!              derivative_value  -> f'(x) (not used in this method)
!
! Outputs:
!   niter  : Number of iterations performed
!   xroot  : Approximated root of the function
!
!=======================================================================

subroutine bisection_method(a, b, eps, fun, niter, xroot)

   implicit none

   double precision :: a, b, midpoint
   double precision :: f_a, f_b, f_mid
   double precision :: eps, xroot
   double precision :: function_value, derivative_value

   integer :: niter, i

   external :: fun


   ! Compute the number of iterations required to achieve the desired
   ! tolerance according to the theoretical convergence of the method.
   niter = int(log((b-a)/eps)/log(2.d0)) + 1


   ! Bisection iterations
   do i = 1, niter

      ! Compute midpoint of the current interval
      midpoint = (a + b) / 2.d0


      ! Evaluate the function at the interval boundaries and midpoint
      call fun(a, function_value, derivative_value)
      f_a = function_value

      call fun(b, function_value, derivative_value)
      f_b = function_value

      call fun(midpoint, function_value, derivative_value)
      f_mid = function_value


      ! Select the subinterval containing the root
      if (f_a * f_mid < 0.d0) then

         b = midpoint

      else if (f_b * f_mid < 0.d0) then

         a = midpoint

      ! The midpoint is exactly the root
      else if (f_mid == 0.d0) then

         exit

      ! One of the interval boundaries is the root
      else if (f_b == 0.d0) then

         midpoint = b
         exit

      else if (f_a == 0.d0) then

         midpoint = a
         exit

      end if

   end do


   ! Return final root approximation
   xroot = midpoint


   return

end subroutine bisection_method