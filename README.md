# A Comparative Study of Time Integration Schemes for Groundwater Flow and Transport Using DQM

## Overview
This repository contains the MATLAB source codes developed for the research paper:
**"A Comparative Study of Time Integration Schemes for Groundwater Flow and Transport Using the Differential Quadrature Method of Lines"**

The study investigates the performance of the **Differential Quadrature Method (DQM)** combined with various time integration schemes (specifically MATLAB's adaptive **`ode45`**) for solving groundwater flow and contaminant transport problems.

## Repository Structure
The repository is organized into folders corresponding to the numerical applications presented in the manuscript.

### 📁 [`Application_3`](./Application_3)
**1D Advection-Dispersion Solver**
This directory contains the source codes for **Application 3**, which solves the one-dimensional advection-dispersion equation in a homogeneous aquifer.

**Files in this directory:**
* **`DQM_ODE45.m` (Main Script):** The primary execution file. It defines physical parameters, sets up the grid, calls the solver, and plots results.
* **`DQM_weights.m`:** Calculates DQM weighting coefficients ($A$ and $B$ matrices).
* **`func.m`:** Defines the system of ODEs and boundary conditions.
* **`lagrange_interp.m`:** Performs Lagrange interpolation for post-processing.

## Model Parameters (Application 3)
The simulation within the `Application_3` folder is configured with the following parameters:
* **Flow Velocity ($v_x$):** 0.01 m/s
* **Dispersion Coefficient ($D_x$):** 0.002 m²/s
* **Nodes ($N$):** 101 (Chebyshev-Gauss-Lobatto distribution)
* **Simulation Time:** 3000 s

## How to Run
1.  Clone or download this repository.
2.  Open MATLAB and navigate to the **`Application_3`** folder.
3.  Add the folder to your MATLAB path or change the Current Folder to `Application_3`.
4.  Run the **`DQM_ODE45.m`** script.
5.  The code will output error metrics (AAE, L2, Linf) and generate a comparison plot.

## Citation
If you utilize this code in your research, please cite the original paper:

> Poyraz, S., Bahar, E., & Gurarslan, G. (2026). A Comparative Study of Time Integration Schemes for Groundwater Flow and Transport Using the Differential Quadrature Method of Lines. *Environmental Earth Sciences*.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
