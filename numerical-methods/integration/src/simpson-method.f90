!=======================================================================
! Composite Simpson's rule for numerical integration
!
! Computes the definite integral of a function over the interval [a,b]
! using the composite Simpson's rule.
!
! The interval is divided into:
!
!              n = 2^m
!
! equally spaced subintervals (always an even number), with width:
!
!              h = (b-a)/n
!
! Every pair of adjacent subintervals is approximated by a quadratic
! polynomial passing through three equally spaced points.
!
! The approximation for each pair is:
!
!          h
!          - [f(x0)+4f(x1)+f(x2)]
!          3
!
! The composite Simpson's rule has a global truncation error of:
!
!              O(h⁴)
!
! If the function evaluates to NaN at any of the three points of a
! Simpson panel, that panel is skipped.
!
! Inputs:
!   a      : Lower integration limit
!   b      : Upper integration limit
!   m      : Number of subdivisions exponent (n = 2^m)
!   fnc    : External function to integrate
!
! Outputs:
!   val    : Numerical approximation of the integral
!
!=======================================================================

subroutine simpson_rule(a, b, m, val, fnc)

   implicit none

   double precision :: a, b
   double precision :: val
   double precision :: h

   double precision :: x0
   double precision :: x1
   double precision :: x2

   integer :: m
   integer :: niter
   integer :: i

   double precision, external :: fnc


   ! Number of integration subintervals
   niter = 2**m

   ! Integration step
   h = (b-a)/dble(niter)

   val = 0.d0


   ! Simpson integration over pairs of intervals
   do i = 0, niter/2-1

      x0 = a + dble(2*i)*h
      x1 = x0 + h
      x2 = x0 + 2.d0*h


      ! Skip the current panel if any function evaluation is NaN
      if (fnc(x0) /= fnc(x0)) cycle
      if (fnc(x1) /= fnc(x1)) cycle
      if (fnc(x2) /= fnc(x2)) cycle


      val = val + (h/3.d0)*( &
            fnc(x0) + &
            4.d0*fnc(x1) + &
            fnc(x2) )

   end do


   return

end subroutine simpson_rule