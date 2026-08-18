!=======================================================================
! Random number generation by the acceptance-rejection method
!
! Generates random numbers distributed according to a probability
! density function using the acceptance-rejection method.
!
! The probability density function must satisfy:
!
!              0 <= f(x) <= M
!
! over the interval:
!
!              a <= x <= b
!
! For each trial, two uniform random numbers are generated:
!
!   x1 : used to generate a candidate x in [a,b]
!   x2 : used to generate a height in [0,M]
!
! The candidate is accepted when:
!
!              f(x) >= M*x2
!
! Accepted values are stored in xnums.
!
! Inputs:
!   ndat : Number of random values to generate
!   fun  : Probability density function
!   a    : Lower bound of the sampling interval
!   b    : Upper bound of the sampling interval
!   M    : Upper bound of the probability density
!
! Outputs:
!   xnums : Array containing the generated random values
!
!=======================================================================

subroutine acceptance_rejection(ndat, xnums, fun, a, b, M)

   implicit none

   integer, intent(in) :: ndat

   double precision, intent(in)  :: a
   double precision, intent(in)  :: b
   double precision, intent(in)  :: M

   double precision, intent(out) :: xnums(ndat)

   double precision, external :: fun

   double precision :: x_candidate
   double precision :: y_candidate

   integer :: i
   integer :: iseed


   ! Seed for the random number generator
   iseed = 21358352

   call srand(iseed)


   ! Number of accepted samples
   i = 1


   ! Generate samples until ndat values have been accepted
   do while (i <= ndat)

      ! Generate a candidate point uniformly in [a,b]
      x_candidate = a + (b-a)*rand()

      ! Generate a point uniformly in [0,M]
      y_candidate = M*rand()


      ! Accept the candidate if it lies below the distribution
      if (fun(x_candidate) >= y_candidate) then

         xnums(i) = x_candidate

         i = i + 1

      end if

   end do


   return

end subroutine acceptance_rejection