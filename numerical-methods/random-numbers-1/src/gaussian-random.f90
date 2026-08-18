!=======================================================================
! Gaussian random number generation using the Box-Muller transform
!
! Generates random numbers following a Gaussian distribution with
! zero mean and standard deviation sigma.
!
! Two independent uniform random numbers U1 and U2 are transformed
! according to:
!
!              R     = sqrt(-2 ln(U1))
!              theta = 2 pi U2
!
! giving two independent standard Gaussian random numbers:
!
!              z1 = R cos(theta)
!              z2 = R sin(theta)
!
! The generated values are then scaled by sigma:
!
!              x = sigma * z
!
! Inputs:
!   ndat  : Number of Gaussian random values to generate
!   sigma : Standard deviation of the Gaussian distribution
!
! Outputs:
!   xgauss : Array containing the generated Gaussian random values
!
!=======================================================================

subroutine gaussian_random(ndat, sigma, xgauss)

   implicit none

   integer, intent(in) :: ndat

   double precision, intent(in) :: sigma

   double precision, intent(out) :: xgauss(ndat)

   double precision :: u1
   double precision :: u2
   double precision :: radius
   double precision :: theta
   double precision :: pi

   integer :: i
   integer :: iseed


   ! Mathematical constant pi
   pi = 4.d0*atan(1.d0)


   ! Seed for the random number generator
   iseed = 21358352

   call srand(iseed)


   ! Generate Gaussian values in pairs using Box-Muller
   do i = 1, ndat, 2

      ! Generate two independent uniform random numbers
      u1 = rand()
      u2 = rand()


      ! U1 must be strictly positive because log(0) is undefined
      if (u1 > 0.d0) then

         radius = sqrt(-2.d0*log(u1))
         theta  = 2.d0*pi*u2


         ! First Gaussian random number
         xgauss(i) = sigma*radius*cos(theta)


         ! Second Gaussian random number, if required
         if (i+1 <= ndat) then
            xgauss(i+1) = sigma*radius*sin(theta)
         end if

      end if

   end do


   return

end subroutine gaussian_random