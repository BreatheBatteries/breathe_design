# Changelog

## [1.8.1] - 03/03/2026

### Added

- deprecation warning for `breathe_design` which is now moving to `breathe_simulate`

## [1.8.0] - 25/02/2026

### Added

- Optional `initialVoltageOcvType` argument to `run_sim` to control how initial SOC for simulations is determined when using the `initialVoltage` argument

## [1.7.0] - 11/02/2026

### Added

- optional parameter`heatCapacity_kJkgK` to `run_api` to pass heat capacity to api

### Fixed

- Ensure DCIR values are positive

## [1.6.0] - 05/02/2026

### Changed

- significant improvements in simulation speed and flexibility

## [1.5.0] - 13/01/2026

### Added

- More flexible dynamic simulation with custom experiments and drive cycles

## [1.4.0] - 02/01/2026

### Added

- `run_sim` function now accepts initial voltage or SoC

## [1.3.3] - 10/12/2025

## Changed

- Renaming of variable names in dynamic results
  Available variables:
  Time [s]
  Voltage [V]
  Negative electrode potential [V]
  Positive electrode potential [V]
  Open-circuit voltage [V]
  Negative electrode open-circuit potential [V]
  Positive electrode open-circuit potential [V]
  Cell temperature [°C]
  SoC
  Negative electrode state of charge
  Positive electrode state of charge
  Current [A]
  Heat generation total [W]

## [1.3.2] - 03/12/2025

### Fixed

- Download design with no designs now completes successfully and downloads the Baseline design

## [1.3.1] - 03/12/2025

### Added

- `heatTransferCoefficient` parameter to dynamic simulations for better thermal control

## [1.3.0] - 01/12/2025

### Changed

- Improved performance of simulation functions

## [1.2.3] - 26/11/2025

### Changed

- changed some material names to lower case for consistency

## [1.2.2] - 17/11/2025

### Removed

- the example code from the README. The notebooks provide examples of how to use the API.

## [1.2.1] - 14/11/2025

### Added

- Added additional information to error messages, to help debugging/bug hunting

### Changed

- Update readme with details of sign up form to register for api access

## [1.2.0] - 13/11/2025

### Changed

- reduce minimum python version from `3.11` to `3.9`

### Fixed

- Bug that prevented `DCIR` simulations from running

## [1.1.0] - 02/10/2025

### Added

- Progress bar to show simulation progress
- Examples and utilities for performing Monte Carlo explorations of design variations. See the example notebook `10 Manufacturing Variability.ipynb`

### Removed

- Incorrect cell and link in the example notebook `01 Getting Started.ipynb`

## [1.0.2] - 25/09/2025

### Fixed

- Fixed possible timeout when running a large number of simulations at once

## [1.0.0] - 16/09/2025

- Breathe Design is released.
