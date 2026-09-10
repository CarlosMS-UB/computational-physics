!=======================================================================
! Improved Euler method for a second-order ordinary differential equation
!
! Solves:
!
!                  y'' = f(y)
!
! by rewriting it as:
!
!                  y'  = dy
!                  dy' = f(y)
!
! The first point is calculated with the standard Euler method. The
! remaining points are obtained with the central Euler scheme:
!
!                  y(i+1)  = y(i-1)  + 2*dt*dy(i)
!                  dy(i+1) = dy(i-1) + 2*dt*f(y(i))
!
! where:
!
!                  dt = (b-a) / N
!
! Inputs:
!   n_steps    : Number of integration steps
!   y(0)       : Initial value of y
!   dy(0)      : Initial value of y'
!   f          : Function defining the differential equation
!   a          : Initial value of the independent variable
!   b          : Final value of the independent variable
!
! Outputs:
!   y          : Numerical solution at each integration point
!   dy         : Numerical first derivative at each integration point
!
! Note:
!   The first step is obtained with standard Euler because the improved
!   scheme requires two previous points.
!
!=======================================================================

subroutine improved_euler(n_steps, y, dy, f, a, b)

   implicit none

   integer, intent(in) :: n_steps
   double precision, intent(in) :: a, b
   double precision, intent(inout) :: y(0:n_steps), dy(0:n_steps)
   double precision, external :: f

   double precision :: dt
   integer :: i

   dt = (b-a)/dble(n_steps)

   y(1) = y(0) + dt*dy(0)
   dy(1) = dy(0) + dt*f(y(0))

   do i = 1, n_steps-1
      y(i+1) = y(i-1) + 2.d0*dt*dy(i)
      dy(i+1) = dy(i-1) + 2.d0*dt*f(y(i))
   end do

   return

end subroutine improved_euler
