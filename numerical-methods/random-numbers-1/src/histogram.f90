!=======================================================================
! Histogram construction and normalization
!
! Constructs a histogram from a set of data points.
!
! The interval covered by the data is divided into:
!
!              nboxes
!
! equally spaced bins. For each bin, the routine computes:
!
!   xhisto   : center of the bin
!   histo    : normalized histogram density
!   errhisto : statistical uncertainty of the density
!
! The histogram is normalized such that:
!
!              sum(histo(i) * bin_width) = 1
!
! Inputs:
!   ndat     : Number of data points
!   xdata    : Array containing the data points
!   nboxes   : Number of histogram bins
!
! Outputs:
!   xhisto   : Center of each histogram bin
!   histo    : Normalized histogram density
!   errhisto : Statistical uncertainty of the density
!
!=======================================================================

subroutine histogram(ndat, xdata, nboxes, xhisto, histo, errhisto)

   implicit none

   integer, intent(in) :: ndat
   integer, intent(in) :: nboxes

   double precision, intent(in)  :: xdata(ndat)
   double precision, intent(out) :: xhisto(nboxes)
   double precision, intent(out) :: histo(nboxes)
   double precision, intent(out) :: errhisto(nboxes)

   double precision :: xmin
   double precision :: xmax
   double precision :: bin_width
   double precision :: probability
   integer :: i
   integer :: ibin


   ! Minimum and maximum values of the data set
   xmin = minval(xdata)
   xmax = maxval(xdata)


   ! Width of each histogram bin
   bin_width = (xmax-xmin)/dble(nboxes)


   ! Initialize histogram arrays
   xhisto  = 0.d0
   histo   = 0.d0
   errhisto = 0.d0


   ! Count the number of data points in each bin
   do i = 1, ndat

      ibin = int((xdata(i)-xmin)/bin_width) + 1

      ! Include the maximum value in the last bin
      if (ibin > nboxes) ibin = nboxes

      histo(ibin) = histo(ibin) + 1.d0

   end do


   ! Compute bin centers, normalized density and uncertainty
   do i = 1, nboxes

      probability = histo(i)/dble(ndat)

      xhisto(i) = xmin + (dble(i)-0.5d0)*bin_width

      histo(i) = probability/bin_width

      errhisto(i) = sqrt( &
           probability*(1.d0-probability) / dble(ndat) ) &
           / bin_width

   end do


   return

end subroutine histogram