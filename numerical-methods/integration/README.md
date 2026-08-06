# Numerical Integration Methods

Implementation of classical numerical algorithms for approximating definite integrals of continuous functions.

The objective of numerical integration is to approximate the value of:

```text
 b
⌠
⎮ f(x) dx
⌡
 a
```

when an analytical expression for the integral is unavailable or difficult to evaluate.

These algorithms are fundamental tools in computational physics, engineering, and numerical analysis for evaluating continuous quantities from discrete function values.

---

## Implemented methods

### Composite trapezoidal rule

A numerical integration method that approximates the function by straight-line segments over each subinterval.

The integration interval `[a, b]` is divided into:

```text
n = 2^m
```

equally spaced subintervals, and the integral is approximated by the sum of the corresponding trapezoidal areas.

The composite trapezoidal rule has a global truncation error of:

```text
O(h²)
```

where `h` is the subinterval width.

---

### Composite Simpson's rule

A higher-order numerical integration method that approximates the function with quadratic polynomials over pairs of adjacent subintervals.

The interval `[a, b]` is divided into:

```text
n = 2^m
```

equally spaced subintervals (with `n` even), and every pair of intervals is integrated using Simpson's rule.

The composite Simpson's rule has a global truncation error of:

```text
O(h⁴)
```

making it considerably more accurate than the trapezoidal rule for smooth functions.

---

## Project structure

```text
integration/
│
├── src/
│   ├── trapezoidal_rule.f90
│   └── simpson_rule.f90
│
├── examples/
│   ├── trapezoidal_example.f90
│   └── simpson_example.f90
│
├── README.md
└── .gitignore
```

---

## Running the examples

Compile an example together with the corresponding numerical method.

For example:

```bash
gfortran src/trapezoidal_rule.f90 examples/trapezoidal_example.f90 -o trapezoidal_example
./trapezoidal_example
```

The remaining examples can be compiled in the same way by replacing the corresponding source files.

---

## Language

* Fortran 90

---

## Author

Carlos Martínez
