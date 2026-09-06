!=======================================================================
! Example: Monte Carlo integration
!
! Estimates the integral of:
!
!                    f(x) = x^2
!
! over the interval:
!
!                    0 <= x <= 1
!
! The exact result is:
!
!                    integral_0^1 x^2 dx = 1/3
!
! The integral is estimated using uniformly distributed random
! samples and the Monte Carlo method.
!
!=======================================================================

program monte_carlo_example

   implicit none

   integer, parameter :: n_samples = 100000

   double precision, parameter :: lower_bound = 0.d0
   double precision, parameter :: upper_bound = 1.d0

   double precision :: random_samples(n_samples)

   double precision :: estimate
   double precision :: standard_error
   double precision :: exact_value
   double precision :: absolute_error

   integer :: seed


   !---------------------------------------------------------------
   ! Exact value of the integral
   !---------------------------------------------------------------

   exact_value = 1.d0/3.d0


   !---------------------------------------------------------------
   ! Generate uniformly distributed random samples
   !---------------------------------------------------------------

   seed = 21358352
   call srand(seed)

   call generate_random_numbers(random_samples, &
                                n_samples, &
                                lower_bound, &
                                upper_bound)


   !---------------------------------------------------------------
   ! Perform Monte Carlo calculation
   !---------------------------------------------------------------

   call monte_carlo(n_samples, &
                    random_samples, &
                    integrand, &
                    estimate, &
                    standard_error)


   !---------------------------------------------------------------
   ! Calculate absolute error
   !---------------------------------------------------------------

   absolute_error = abs(estimate-exact_value)


   !---------------------------------------------------------------
   ! Display results
   !---------------------------------------------------------------

   print *, "=============================================="
   print *, "Monte Carlo Integration"
   print *, "=============================================="
   print *
   print *, "Function: f(x) = x^2"
   print *, "Integration interval: [0,1]"
   print *, "Number of samples:", n_samples
   print *
   print *, "Exact value:       ", exact_value
   print *, "Monte Carlo value: ", estimate
   print *, "Statistical error: ", standard_error
   print *, "Absolute error:    ", absolute_error
   print *, "=============================================="


contains


   !===================================================================
   ! Generate uniformly distributed random numbers
   !
   ! Generates sample_count random numbers uniformly distributed in:
   !
   !                    minimum <= x <= maximum
   !
   !===================================================================

   subroutine generate_random_numbers(samples, sample_count, &
                                      minimum, maximum)

      implicit none

      integer, intent(in) :: sample_count

      double precision, intent(in) :: minimum
      double precision, intent(in) :: maximum

      double precision, intent(out) :: samples(sample_count)

      integer :: i


      do i = 1, sample_count

         samples(i) = minimum + &
                      (maximum-minimum)*rand()

      end do


      return

   end subroutine generate_random_numbers


   !===================================================================
   ! Integrand
   !
   !                    f(x) = x^2
   !
   !===================================================================

   double precision function integrand(x)

      implicit none

      double precision, intent(in) :: x


      integrand = x**2


      return

   end function integrand


end program monte_carlo_example