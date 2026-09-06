!=======================================================================
! Monte Carlo integration
!
! Estimates the average value of a function using a set of random
! samples.
!
! For uniformly distributed random points x_i in an interval, the
! integral is related to the sample mean by:
!
!                 N
!                ---
!                \   f(x_i)
!                 /
!                ---
!                i=1
!
!        <f> = -------------
!                   N
!
! The statistical uncertainty of the mean is estimated from the
! second moment:
!
!        standard_error = sqrt( (<f^2> - <f>^2) / N )
!
! Inputs:
!   n_samples      : Number of random samples
!   random_samples : Array containing the random sample points
!   function       : Function to evaluate
!
! Outputs:
!   estimate       : Monte Carlo estimate of the mean value
!   standard_error : Statistical uncertainty of the estimate
!
! Note:
!   If the integration interval has length L, the integral is:
!
!                    integral = L * estimate
!
!=======================================================================

subroutine monte_carlo(n_samples, random_samples, function, &
                       estimate, standard_error)

   implicit none

   integer, intent(in) :: n_samples

   double precision, intent(in) :: random_samples(n_samples)

   double precision, intent(out) :: estimate
   double precision, intent(out) :: standard_error

   double precision, external :: function

   double precision :: mean_square
   double precision :: function_value

   integer :: i


   estimate    = 0.d0
   mean_square = 0.d0


   do i = 1, n_samples

      function_value = function(random_samples(i))

      estimate    = estimate    + function_value
      mean_square = mean_square + function_value**2

   end do


   estimate    = estimate/dble(n_samples)
   mean_square = mean_square/dble(n_samples)


   standard_error = sqrt(max(0.d0, &
                     (mean_square-estimate**2)/dble(n_samples)))


   return

end subroutine monte_carlo
