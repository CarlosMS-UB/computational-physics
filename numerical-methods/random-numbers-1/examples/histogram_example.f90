!=======================================================================
!
! Example: Histogram construction
!
! Demonstrates the use of the histogram subroutine to construct a
! normalized histogram from a set of uniformly distributed random
! numbers in the interval:
!
!                         [0,1]
!
! The expected probability density is:
!
!                         f(x) = 1
!
! for 0 <= x <= 1.
!
! The histogram is divided into a fixed number of equally spaced bins.
!
!-----------------------------------------------------------------------
!
! In order to use this example, you should type in the terminal:
!
! $ gfortran src/histogram.f90 examples/histogram_example.f90 -o histogram_example
! $ ./histogram_example
!
!=======================================================================

program histogram_example

   implicit none

   integer :: ndat
   integer :: nboxes
   integer :: i

   double precision, allocatable :: xdata(:)
   double precision, allocatable :: xhisto(:)
   double precision, allocatable :: histo(:)
   double precision, allocatable :: errhisto(:)


   ! Number of random data points
   ndat = 10000

   ! Number of histogram bins
   nboxes = 10


   ! Allocate arrays
   allocate(xdata(ndat))
   allocate(xhisto(nboxes))
   allocate(histo(nboxes))
   allocate(errhisto(nboxes))


   ! Generate uniformly distributed data in [0,1]
   call generate_uniform_data(ndat, xdata)


   ! Construct the histogram
   call histogram(ndat, xdata, nboxes, &
                  xhisto, histo, errhisto)


   ! Display results
   print *, "==========================================="
   print *, " Histogram Example"
   print *, "==========================================="
   print *, "Distribution       : Uniform [0,1]"
   print *, "Number of data     :", ndat
   print *, "Number of bins     :", nboxes
   print *
   print *, " Bin center        Density          Error"
   print *, "-------------------------------------------"

   do i = 1, nboxes

      print '(F10.5,3X,E14.6,3X,E14.6)', &
            xhisto(i), histo(i), errhisto(i)

   end do

   print *, "==========================================="


   ! Free allocated memory
   deallocate(xdata)
   deallocate(xhisto)
   deallocate(histo)
   deallocate(errhisto)


end program histogram_example


!=======================================================================
!
! Generate uniformly distributed random numbers
!
! Generates ndat random numbers uniformly distributed in [0,1].
!
!=======================================================================

subroutine generate_uniform_data(ndat, xdata)

   implicit none

   integer, intent(in) :: ndat

   double precision, intent(out) :: xdata(ndat)

   integer :: i
   integer :: iseed


   ! Seed for the random number generator
   iseed = 21358352

   call srand(iseed)


   ! Generate uniform random numbers
   do i = 1, ndat

      xdata(i) = rand()

   end do


   return

end subroutine generate_uniform_data