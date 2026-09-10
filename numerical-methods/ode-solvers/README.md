# Ordinary Differential Equation Solvers

Implementation of classical numerical methods for solving ordinary differential equations (ODEs).

Ordinary differential equations are fundamental mathematical models in physics and engineering. When an analytical solution is unavailable or difficult to obtain, numerical methods can be used to approximate the evolution of the system from a set of initial conditions.

The methods implemented in this directory focus on second-order ordinary differential equations of the form:

```text
                  y'' = f(y)
```

which can be rewritten as the first-order system:

```text
                  y'  = dy

                  dy' = f(y)
```

The numerical algorithms calculate the values of `y` and its first derivative at a discrete set of points within the integration interval.

---

## Implemented methods

### Euler method

The standard Euler method is a first-order numerical method that advances the solution using the values of the function and its derivative at the current integration point.

For a step size `dt`, the method uses:

```text
                  y(i+1)  = y(i)  + dt * dy(i)

                  dy(i+1) = dy(i) + dt * f(y(i))
```

The integration interval `[a, b]` is divided into `N` equally spaced steps:

```text
                  dt = (b-a) / N
```

The method is simple and computationally inexpensive, but its accuracy is limited by its first-order convergence.

---

### Improved Euler method

The improved Euler method implemented here uses the first step calculated with the standard Euler method and subsequently applies a central two-step scheme:

```text
                  y(i+1)  = y(i-1)  + 2*dt*dy(i)

                  dy(i+1) = dy(i-1) + 2*dt*f(y(i))
```

The method requires two previous points, which is why the first integration step is obtained using the standard Euler method.

This approach provides improved accuracy compared with the standard Euler method for suitable problems.

---

## Project structure

```text
ode-solvers/
│
├── src/
│   ├── euler.f90
│   └── improved_euler.f90
│
├── examples/
│   ├── euler-example.f90
│   └── improved-euler-example.f90
│
├── README.md
```

---

## Running the examples

Compile an example together with the corresponding numerical method.

For the standard Euler method:

```bash
gfortran src/euler.f90 examples/euler-example.f90 -o euler_example
./euler_example
```

For the improved Euler method:

```bash
gfortran src/improved_euler.f90 examples/improved-euler-example.f90 -o improved_euler_example
./improved_euler_example
```

On Windows PowerShell, run the resulting executable with:

```powershell
.\euler_example.exe
```

or:

```powershell
.\improved_euler_example.exe
```

---

## Example problem

The example programs solve the harmonic oscillator equation:

```text
                  y'' = -y
```

with the initial conditions:

```text
                  y(0)  = 1
                  y'(0) = 0
```

The analytical solution is:

```text
                  y(x) = cos(x)
```

The numerical solution is evaluated over the interval:

```text
                  0 <= x <= 2*pi
```

and compared with the exact solution to calculate the absolute error.

---

## Language

* Fortran 90

---

## Author

Carlos Martínez