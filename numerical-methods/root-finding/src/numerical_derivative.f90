!=======================================================================
! Numerical derivative using finite differences
!
! Computes the first derivative of a function evaluated at discrete points.
!
! The derivative is approximated using:
!
! Forward difference:
!       f'(x) ≈ (f(x+h)-f(x))/h
!
! Central difference:
!       f'(x) ≈ (f(x+h)-f(x-h))/(2h)
!
! The first and last points are calculated using forward and backward
! differences, while central differences are used for the internal points.
!
! Inputs:
!   ndat : Number of data points
!   x    : Array containing the independent variable values
!   fu   : Array containing the function values f(x)
!
! Output:
!   dfu  : Array containing the approximated derivative values
!
!=======================================================================

subroutine numerical_derivative(ndat, x, fu, dfu)

   implicit none

   integer :: i, ndat
   double precision, dimension(0:ndat-1) :: x, fu, dfu
   double precision :: h

   ! Step size (assuming equally spaced points)
   h = x(2) - x(1)

   ! Forward difference at the first point
   dfu(0) = (fu(1) - fu(0)) / h

   ! Central difference for internal points
   do i = 1, ndat-2
      dfu(i) = (fu(i+1) - fu(i-1)) / (2.d0*h)
   end do

   ! Backward difference at the last point
   dfu(ndat-1) = (fu(ndat-1) - fu(ndat-2)) / h

   return

end subroutine numerical_derivative