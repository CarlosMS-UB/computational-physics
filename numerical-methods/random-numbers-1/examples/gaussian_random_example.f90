!=======================================================================
!
! Example: Gaussian random number generation
!
! Demonstrates the use of the gaussian_random subroutine to generate
! random numbers following a Gaussian distribution.
!
! The distribution used in this example has:
!
!                         mean     = 0
!                         sigma    = 1
!
! and is given by:
!
!                 1
!     f(x) = ------------- exp(-x^2/2)
!              sqrt(2 pi)
!
! The random numbers are generated using the Box-Muller transform.
!
!-----------------------------------------------------------------------
!
! In order to use this example, you should type in the terminal:
!
! $ gfortran src/gaussian-random.f90 examples/gaussian_random_example.f90 -o gaussian_random_example
! $ ./gaussian_random_example
!
!=======================================================================

program gaussian_random_example

   implicit none

   integer :: ndat
   integer :: i

   double precision :: sigma
   double precision :: mean
   double precision :: variance
   double precision :: standard_deviation

   double precision, allocatable :: xgauss(:)


   ! Number of Gaussian random values
   ndat = 10000

   ! Standard deviation
   sigma = 1.d0


   ! Allocate the output array
   allocate(xgauss(ndat))


   ! Generate Gaussian random numbers
   call gaussian_random(ndat, sigma, xgauss)


   ! Compute sample mean
   mean = 0.d0

   do i = 1, ndat

      mean = mean + xgauss(i)

   end do

   mean = mean/dble(ndat)


   ! Compute sample variance
   variance = 0.d0

   do i = 1, ndat

      variance = variance + (xgauss(i)-mean)**2

   end do

   variance = variance/dble(ndat)


   ! Standard deviation
   standard_deviation = sqrt(variance)


   ! Display results
   print *, "==========================================="
   print *, " Gaussian Random Number Example"
   print *, "==========================================="
   print *, "Distribution       : Gaussian"
   print *, "Mean               : 0"
   print *, "Expected sigma     :", sigma
   print *, "Number of samples  :", ndat
   print *, "Sample mean        :", mean
   print *, "Sample std. dev.   :", standard_deviation
   print *
   print *, "First generated values:"
   print *, "-------------------------------------------"

   do i = 1, min(10, ndat)

      print '(I5,3X,F12.8)', i, xgauss(i)

   end do

   print *, "==========================================="


   ! Free allocated memory
   deallocate(xgauss)


end program gaussian_random_example