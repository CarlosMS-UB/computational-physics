# Random Numbers

Collection of routines for generating and analyzing random numbers and probability distributions using **Fortran 90**.

This directory contains implementations developed as part of the *Computational Physics* course. The routines cover basic statistical analysis, random number generation from non-uniform distributions, and Gaussian random number generation.

---

## Implemented methods

### Histogram

The `histogram` subroutine constructs a normalized histogram from a set of data points.

The data range is divided into a specified number of equally spaced bins. For each bin, the routine computes:

* Bin center
* Normalized probability density
* Statistical uncertainty

The resulting histogram is normalized according to:

```text
sum(histo(i) * bin_width) = 1
```

Source:

```text
src/histogram.f90
```

---

### Acceptance-Rejection Method

The `acceptance_rejection` subroutine generates random numbers following a specified probability density using the **acceptance-rejection method**.

The probability density must satisfy:

```text
0 <= f(x) <= M
```

over the sampling interval `[a,b]`.

Candidate points are generated uniformly inside the rectangle defined by:

```text
a <= x <= b
0 <= y <= M
```

A candidate is accepted when:

```text
f(x) >= y
```

The accepted values follow the desired probability distribution.

Source:

```text
src/acceptance_rejection.f90
```

---

### Gaussian Random Numbers

The `gaussian_random` subroutine generates random numbers following a Gaussian distribution using the **Box-Muller transform**.

For a Gaussian distribution with zero mean and standard deviation `sigma`, two independent uniform random numbers are transformed according to:

```text
R     = sqrt(-2 ln(U1))
theta = 2 pi U2
```

giving two Gaussian random numbers:

```text
z1 = R cos(theta)
z2 = R sin(theta)
```

The generated values are then scaled by `sigma`.

Source:

```text
src/gaussian_random.f90
```

---

## Examples

Each implemented method has a corresponding example program demonstrating its use.

```text
examples/
├── histogram_example.f90
├── acceptance_rejection_example.f90
└── gaussian_random_example.f90
```

### Histogram example

Compile and run:

```bash
gfortran src/histogram.f90 examples/histogram_example.f90 -o histogram_example
./histogram_example
```

The program generates uniformly distributed random data in `[0,1]` and constructs a normalized histogram.

---

### Acceptance-rejection example

Compile and run:

```bash
gfortran src/acceptance_rejection.f90 examples/acceptance_rejection_example.f90 -o acceptance_rejection_example
./acceptance_rejection_example
```

The example generates random numbers following the probability density:

```text
f(x) = 2x
```

over `[0,1]`.

---

### Gaussian random number example

Compile and run:

```bash
gfortran src/gaussian_random.f90 examples/gaussian_random_example.f90 -o gaussian_random_example
./gaussian_random_example
```

The example generates Gaussian random numbers with:

```text
mean  = 0
sigma = 1
```

and calculates the sample mean and standard deviation.

---

## Directory structure

```text
random-numbers/
│
├── src/
│   ├── histogram.f90
│   ├── acceptance_rejection.f90
│   └── gaussian_random.f90
│
├── examples/
│   ├── histogram_example.f90
│   ├── acceptance_rejection_example.f90
│   └── gaussian_random_example.f90
│
└── README.md
```

---

## Language

* Fortran 90

---

## Related repository

This directory is part of the **Computational Physics** repository.

---

## Author

Carlos Martínez
