# Computational Physics

Collection of numerical methods and computational algorithms implemented in **Fortran 90** as part of the *Computational Physics* course.

This repository aims to provide clear, well-documented implementations of numerical techniques commonly used in computational physics and scientific computing. The project is organized by topic, with each module containing source code, example programs, and documentation necessary to understand and reproduce the implemented algorithms.

---

## Repository contents

### Numerical Methods

Collection of classical algorithms for numerical computation.

Current topics:

* **Root Finding**

  * Bisection method
  * Newton-Raphson method
  * Numerical derivative

* **Numerical Integration**

  * Composite trapezoidal rule
  * Composite Simpson's rule
  * Monte Carlo integration
  * Multivariate Monte Carlo integration

* **Random Numbers**

  * Histogram construction
  * Acceptance-rejection method
  * Gaussian random number generation using the Box-Muller transform

* **Ordinary differential equations (ODEs)**

  * Euler
  * Improved Euler

Planned topics:

* Linear systems
* Partial differential equations (PDEs)

---

## Repository structure

```text
computational-physics/
│
├── numerical-methods/
│   ├── README.md
│   │
│   ├── root-finding/
│   │   ├── src/
│   │   ├── examples/
│   │   └── README.md
│   │
│   ├── integration/
│   │   ├── src/
│   │   ├── examples/
│   │   └── README.md
│   │
│   ├── random-numbers/
│   │   ├── src/
│   │   ├── examples/
│   │   └── README.md
│   │
│   ├── linear-systems/
│   │   ├── src/
│   │   ├── examples/
│   │   └── README.md
│   │
│   ├── ode-solvers/
│   │   ├── src/
│   │   ├── examples/
│   │   └── README.md
│   │
│   ├── pde-solvers/
│   └── ...
│
├── README.md
├── LICENSE
└── .gitignore
```

---

## Current progress

| Module                    | Status |
| ------------------------- | :----: |
| Numerical Methods         |   🚧   |
| ├── Root Finding          |    ✅   |
| ├── Numerical Integration |    ✅   |
| ├── Random Numbers        |    ✅   |
| ├── Linear Systems        |   🚧   |
| ├── Eigenvalue Problems   |   🚧   |
| ├── ODE Solvers           |   🚧   |
| ├── PDE Solvers           |   🚧   |
| ├── Fourier Analysis      |   🚧   |
| └── Optimization          |   🚧   |

---

## Language

* Fortran 90

---

## License

This project is distributed under the **MIT License**. See the `LICENSE` file for more information.

---

## Author

Carlos Martínez