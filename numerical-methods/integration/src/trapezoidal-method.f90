!=======================================================================
! Composite trapezoidal rule for numerical integration
!
! Computes the definite integral of a function over the interval [a,b]
! using the composite trapezoidal rule.
!
! The integration interval is divided into:
!
!              n = 2^m
!
! equally spaced subintervals of width:
!
!              h = (b-a)/n
!
! The integral is approximated as:
!
!                  n-1
!              h [ sum ( f(x_i) + (f(a)+f(b))/2 ) ]
!                 i=1
!
! The composite trapezoidal rule has a global truncation error of:
!
!              O(h^2)
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

subroutine trapezoidal_rule(a, b, m, val, fnc)

   implicit none

   double precision :: a, b
   double precision :: val
   double precision :: h

   integer :: m
   integer :: niter
   integer :: i

   double precision, external :: fnc


   ! Number of integration subintervals
   niter = 2**m

   ! Integration step
   h = (b-a)/dble(niter)


   ! Contribution from the interval endpoints
   val = 0.5d0*(fnc(a)+fnc(b))


   ! Interior points contribution
   do i = 1, niter-1

      val = val + fnc(a + dble(i)*h)

   end do


   ! Final integral value
   val = val*h


   return

end subroutine trapezoidal_rule