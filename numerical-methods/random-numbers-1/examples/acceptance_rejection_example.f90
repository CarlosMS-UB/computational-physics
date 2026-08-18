!=======================================================================
!
! Example: Acceptance-rejection method
!
! Demonstrates the use of the acceptance_rejection subroutine to
! generate random numbers following the probability density:
!
!                         f(x) = 2x
!
! over the interval:
!
!                         [0,1]
!
! The function is normalized because:
!
!                         1
!                         ∫ 2x dx = 1
!                         0
!
! The maximum value of the probability density is:
!
!                         M = 2
!
!-----------------------------------------------------------------------
!
! In order to use this example, you should type in the terminal:
!
! $ gfortran src/acceptance-rejection.f90 examples/acceptance_rejection_example.f90 -o acceptance_rejection_example
! $ ./acceptance_rejection_example
!
!=======================================================================

program acceptance_rejection_example

   implicit none

   integer :: ndat
   integer :: i

   double precision :: a
   double precision :: b
   double precision :: M

   double precision, allocatable :: xnums(:)

   double precision, external :: probability_density


   ! Number of random values to generate
   ndat = 10000

   ! Sampling interval
   a = 0.d0
   b = 1.d0

   ! Maximum value of the probability density
   M = 2.d0


   ! Allocate the output array
   allocate(xnums(ndat))


   ! Generate random numbers using acceptance-rejection
   call acceptance_rejection(ndat, xnums, &
                             probability_density, a, b, M)


   ! Display a selection of generated values
   print *, "==========================================="
   print *, " Acceptance-Rejection Example"
   print *, "==========================================="
   print *, "Probability density : f(x) = 2x"
   print *, "Sampling interval   : [0,1]"
   print *, "Maximum density     :", M
   print *, "Number of samples   :", ndat
   print *
   print *, "First generated values:"
   print *, "-------------------------------------------"

   do i = 1, min(10, ndat)

      print '(I5,3X,F12.8)', i, xnums(i)

   end do

   print *, "==========================================="


   ! Free allocated memory
   deallocate(xnums)


end program acceptance_rejection_example


!=======================================================================
!
! Probability density function
!
! Evaluates:
!
!                         f(x) = 2x
!
! for 0 <= x <= 1.
!
!=======================================================================

double precision function probability_density(x)

   implicit none

   double precision :: x


   probability_density = 2.d0*x


   return

end function probability_density