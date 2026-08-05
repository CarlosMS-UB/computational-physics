# Root Finding Methods

Implementation of classical numerical algorithms for finding roots of nonlinear equations and approximating first-order derivatives.

The objective of root-finding methods is to determine the value of `x` that satisfies:

```text
f(x) = 0
```

These algorithms are fundamental tools in computational physics and numerical analysis, where analytical solutions are often unavailable.

---

## Implemented methods

### Bisection method

A robust bracketing algorithm based on the Intermediate Value Theorem.

The method requires an initial interval `[a, b]` such that:

```text
f(a) · f(b) < 0
```

The interval is repeatedly bisected until the desired tolerance is achieved.

---

### Newton-Raphson method

A fast iterative algorithm based on the first derivative of the function.

The approximation is updated according to:

```text
x(n+1) = x(n) - f(x(n)) / f'(x(n))
```

When the initial guess is sufficiently close to the root, the method exhibits quadratic convergence.

---

### Numerical derivative

Finite-difference approximation of the first derivative of a function sampled at equally spaced points.

The implementation uses:

- Forward differences at the first point.
- Central differences for interior points.
- Backward differences at the last point.

---

## Project structure

```text
root-finding/
│
├── src/
│   ├── bisection_method.f90
│   ├── newton_raphson_method.f90
│   └── numerical_derivative.f90
│
├── examples/
│   ├── bisection_example.f90
│   ├── newton_raphson_example.f90
│   └── numerical_derivative_example.f90
│
├── README.md
└── .gitignore
```

---

## Running the examples

Compile an example together with the corresponding numerical method.

For example:

```bash
gfortran src/bisection_method.f90 examples/bisection_example.f90 -o bisection_example
./bisection_example
```

The remaining examples can be compiled in the same way by replacing the corresponding source files.

---

## Language

- Fortran 90

---

## Author

Carlos Martínez