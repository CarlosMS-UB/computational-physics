!=======================================================================
! Example: Multivariate Monte Carlo integration
!
! Estimates the integral of:
!
!              f(x,y,z) = x^2 + y^2 + z^2
!
! over the unit cube:
!
!              0 <= x,y,z <= 1
!
! The exact result is:
!
!              integral = 1
!
! The integral is estimated using uniformly distributed random
! points and the multivariate Monte Carlo method.
!
!=======================================================================

program monte_carlo_multivariate_example

   implicit none

   integer, parameter :: n_samples = 100000

   double precision, parameter :: lower_bound = 0.d0
   double precision, parameter :: upper_bound = 1.d0

   double precision, allocatable :: random_points(:)

   double precision :: estimate
   double precision :: standard_error
   double precision :: exact_value
   double precision :: absolute_error

   integer :: seed


   !---------------------------------------------------------------
   ! Exact value of the integral
   !---------------------------------------------------------------

   exact_value = 1.d0


   !---------------------------------------------------------------
   ! Allocate memory for the random coordinates
   !---------------------------------------------------------------

   allocate(random_points(3*n_samples))


   !---------------------------------------------------------------
   ! Generate uniformly distributed random points
   !---------------------------------------------------------------

   seed = 21358352
   call srand(seed)

   call generate_random_points(random_points, &
                               n_samples, &
                               lower_bound, &
                               upper_bound)


   !---------------------------------------------------------------
   ! Perform multivariate Monte Carlo calculation
   !---------------------------------------------------------------

   call monte_carlo_multivariate(n_samples, &
                                 random_points, &
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
   print *, "Multivariate Monte Carlo Integration"
   print *, "=============================================="
   print *
   print *, "Function: f(x,y,z) = x^2 + y^2 + z^2"
   print *, "Integration region: [0,1]^3"
   print *, "Number of samples:", n_samples
   print *
   print *, "Exact value:       ", exact_value
   print *, "Monte Carlo value: ", estimate
   print *, "Statistical error: ", standard_error
   print *, "Absolute error:    ", absolute_error
   print *, "=============================================="


   deallocate(random_points)


contains


   !===================================================================
   ! Generate uniformly distributed random points
   !
   ! Each point is stored as three consecutive coordinates:
   !
   !       x1, y1, z1, x2, y2, z2, ...
   !
   !===================================================================

   subroutine generate_random_points(points, sample_count, &
                                     minimum, maximum)

      implicit none

      integer, intent(in) :: sample_count

      double precision, intent(in) :: minimum
      double precision, intent(in) :: maximum

      double precision, intent(out) :: points(3*sample_count)

      integer :: i


      do i = 1, sample_count

         points(3*i-2) = minimum + &
                         (maximum-minimum)*rand()

         points(3*i-1) = minimum + &
                         (maximum-minimum)*rand()

         points(3*i) = minimum + &
                       (maximum-minimum)*rand()

      end do


      return

   end subroutine generate_random_points


   !===================================================================
   ! Integrand
   !
   !              f(x,y,z) = x^2 + y^2 + z^2
   !
   !===================================================================

   double precision function integrand(x, y, z)

      implicit none

      double precision, intent(in) :: x
      double precision, intent(in) :: y
      double precision, intent(in) :: z


      integrand = x**2 + y**2 + z**2


      return

   end function integrand


end program monte_carlo_multivariate_example