!=======================================================================
! Multivariate Monte Carlo integration
!
! Estimates the average value of a function of three variables using
! a set of uniformly distributed random points.
!
! Each random point is represented by three consecutive values in
! the input array:
!
!              random_points(3*i-2) : x-coordinate
!              random_points(3*i-1) : y-coordinate
!              random_points(3*i)   : z-coordinate
!
! For N random points, the sample mean is:
!
!                 N
!                ---
!                \   f(x_i,y_i,z_i)
!                 /
!                ---
!                i=1
!
!        <f> = ---------------------
!                       N
!
! The statistical uncertainty is estimated from the first and second
! moments:
!
!        standard_error = sqrt( (<f^2> - <f>^2) / N )
!
! Inputs:
!   n_samples      : Number of random points
!   random_points  : Array containing 3*n_samples coordinates
!   function       : Function of three variables to evaluate
!
! Outputs:
!   estimate       : Monte Carlo estimate of the mean value
!   standard_error : Statistical uncertainty of the estimate
!
! Note:
!   If the integration region has volume V, the integral is:
!
!                    integral = V * estimate
!
!=======================================================================

subroutine monte_carlo_multivariate(n_samples, random_points, function, &
                                    estimate, standard_error)

   implicit none

   integer, intent(in) :: n_samples

   double precision, intent(in) :: random_points(3*n_samples)

   double precision, intent(out) :: estimate
   double precision, intent(out) :: standard_error

   double precision, external :: function

   double precision :: x
   double precision :: y
   double precision :: z

   double precision :: function_value
   double precision :: mean_square

   integer :: i


   estimate    = 0.d0
   mean_square = 0.d0


   do i = 1, n_samples

      x = random_points(3*i-2)
      y = random_points(3*i-1)
      z = random_points(3*i)

      function_value = function(x, y, z)

      estimate    = estimate    + function_value
      mean_square = mean_square + function_value**2

   end do


   estimate    = estimate/dble(n_samples)
   mean_square = mean_square/dble(n_samples)


   standard_error = sqrt(max(0.d0, &
                     (mean_square-estimate**2)/dble(n_samples)))


   return

end subroutine monte_carlo_multivariate