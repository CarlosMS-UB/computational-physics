# Numerical Methods

Collection of classical numerical algorithms implemented in **Fortran 90**.

This directory contains implementations of fundamental numerical methods frequently used in computational physics, scientific computing, and engineering applications. Each topic is organized into its own subdirectory and includes documented source code together with example programs.

---

## Available topics

### ✅ Root Finding

Algorithms for solving nonlinear equations.

Implemented methods:

- Bisection method
- Newton-Raphson method
- Numerical derivative

Directory:

```text
root-finding/
```

---

### ✅ Numerical Integration

Algorithms for approximating definite integrals of continuous functions.

Implemented methods:

- Composite trapezoidal rule
- Composite Simpson's rule

Directory:

```text
integration/
```

---

### 🚧 Coming soon

Additional numerical methods will be incorporated progressively, including:

- Interpolation
- Linear systems
- Eigenvalue problems
- Ordinary differential equations (ODEs)
- Partial differential equations (PDEs)
- Monte Carlo methods
- Fourier analysis
- Optimization algorithms

---

## Directory structure

```text
numerical-methods/
│
├── root-finding/
│   ├── src/
│   ├── examples/
│   └── README.md
│
├── integration/
│   ├── src/
│   ├── examples/
│   └── README.md
│
├── interpolation/
├── linear-systems/
├── ode-solvers/
├── pde-solvers/
└── ...
```

---

## Language

- Fortran 90

---

## Related repository

This directory is part of the **Computational Physics** repository.

---

## Author

Carlos Martínez