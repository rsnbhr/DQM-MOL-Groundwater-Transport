# 1D Advection-Dispersion Solver using DQM and ode45

## Overview
This repository contains the MATLAB source codes for solving the **one-dimensional advection-dispersion equation (ADE)** using the **Differential Quadrature Method (DQM)** for spatial discretization and MATLAB's **`ode45`** solver for temporal integration.

This implementation corresponds to **Application 3** presented in the research paper:
**"A Comparative Study of Time Integration Schemes for Groundwater Flow and Transport Using the Differential Quadrature Method of Lines"**

## Files Description
The repository consists of the following MATLAB scripts:

* **`DQM_ODE45.m` (Main Script):** The primary execution file. It defines the physical parameters, sets up the grid, calls the solver, computes the analytical solution, performs error analysis, and plots the results.
* **`DQM_weights.m`:** A function that calculates the weighting coefficients for the first and second-order derivatives based on the DQM formulation.
* **`func.m`:** Defines the system of Ordinary Differential Equations (ODEs) obtained from the spatial discretization of the ADE, including the boundary conditions.
* **`lagrange_interp.m`:** Performs Lagrange interpolation to map the DQM results onto a regular grid for comparison with analytical solutions.

## Model Parameters
The simulation is configured with the following parameters (as defined in `DQM_ODE45.m`):
* **Flow Velocity ($v_x$):** 0.01 m/s
* **Dispersion Coefficient ($D_x$):** 0.002 m²/s
* **Nodes ($N$):** 101 (Chebyshev-Gauss-Lobatto distribution)
* **Simulation Time:** 3000 s

## How to Run
1.  Ensure all `.m` files are in the same directory.
2.  Open MATLAB.
3.  Run the **`DQM_ODE45.m`** script.
4.  The code will output the error metrics (AAE, L2, Linf) in the Command Window and generate a plot comparing the numerical and analytical solutions.

## Citation
If you utilize this code in your research, please cite the original paper:

> Poyraz, S., Bahar, E., & Gurarslan, G. (2026). A Comparative Study of Time Integration Schemes for Groundwater Flow and Transport Using the Differential Quadrature Method of Lines. Environmental Earth Sciences.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
