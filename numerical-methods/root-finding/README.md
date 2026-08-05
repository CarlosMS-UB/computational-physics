# Root Finding Methods

Implementation of numerical algorithms for finding roots of nonlinear equations.

The objective of root-finding methods is to determine the value of `x` that satisfies:

\[
f(x)=0
\]

These algorithms are fundamental tools in computational physics and numerical analysis, where analytical solutions are often unavailable.

---

## Implemented methods

### Bisection method

A robust bracketing method based on the Intermediate Value Theorem.

The method requires an initial interval `[a,b]` such that:

\[
f(a) \cdot f(b) < 0
\]

The interval is progressively reduced until the desired tolerance is achieved.

---

### Newton-Raphson method

A fast iterative method based on the derivative of the function.

The approximation is updated according to:

\[
x_{n+1}=x_n-\frac{f(x_n)}{f'(x_n)}
\]

The method provides rapid convergence when the initial guess is sufficiently close to the root.

---

### Numerical derivative

Finite difference approximation of the first derivative.

The implementation uses:

- Forward differences at the boundaries
- Central differences for internal points

---

## Project structure

```text
root-finding/
│
├── bisection_method.f90
├── newton_raphson_method.f90
├── numerical_derivative.f90
└── README.md
```

---

## Language and tools

- Fortran 90

---

## Author

Carlos Martínez