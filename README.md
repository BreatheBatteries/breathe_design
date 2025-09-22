# Breathe Design

A python based api wrapper for running the breathe design model.

## Installation steps

- Open your terminal or command prompt.
- Navigate to the directory or create new one where you want to setup.
- Run the following command to clone our GitHub repository.

  ```bash
  git clone https://github.com/BreatheBatteries/breathe_design.git .
  ```

 To set up everything in one go, just run `.\setupEnvironment.ps1`

 Alternatively, run following command to create the virtual environment:

  ```bash
  python -m venv myvenv
  ```

  Replace `myvenv` with the desired name for your virtual environment.

- Activate the virtual environment:
  - On **Windows**:
    ```cmd
    myvenv\Scripts\activate
    ```
  - On **macOS/Linux**:
    ```bash
    source myvenv/bin/activate
    ```

  After activating the virtual environment, you'll see `(myenv)` in your terminal prompt to indicate that the environment is active.

- Install the `breathe_design` package in the virtual environment:

  ```
  pip install breathe_design
  ```

# Running the models

The app requires a connection to our server for which you must log in to receive an api key. Once logged in you can fetch the batteies in your library.

```
from breathe_design import api_interface as api
batteries = api.get_batteries()
print(batteries)
```

Access the base parameters for your battery

```
base_params = api.get_design_parameters("Molicel P45B")
print(base_params)
```

See the equilibrium KPIs and there sensitivities to changes in the base parameters

```
eqm_kpis, fig = api.get_eqm_kpis("Molicel P45B")
print(eqm_kpis)
fig.show()
```

Add any number of new designs

```
designs = [
    {
      "designName": "Lower NP",
      "NPratio": base_params["NPratio"]*0.95
    },
    {
      "designName": "Higher Vmax",
      "Vmax_V": base_params["Vmax_V"]+0.05
    },
    {
      "designName": "Thicker Cathode",
      "cathodeThickness_um": base_params["cathodeThickness_um"]*1.05
    },
    {
      "designName": "Less Porous Anode",
      "anodePorosity": base_params["anodePorosity"]*0.95
    },
    {
      "designName": "Thinner Separator",
      "separatorThickness_um": base_params["separatorThickness_um"]*0.95
    },
  ]
```

Recompute the KPIs

```
eqm_kpis, fig = api.get_eqm_kpis("Molicel P45B", designs)
print(eqm_kpis)
```

Plot the KPIs for all designs `relative` or `delta` with the baseline

```
from breathe_design import plot_kpis
plot_kpis(eqm_kpis, "relative")
plot_kpis(eqm_kpis, "delta")
```

Perform dynamic analysis for your designs

```
from breathe_design import Cycler
from breathe_design import plot_dynamic_kpis
from breathe_design import extract_dynamic_kpis

baseline_capacity = eqm_kpis.loc["Capacity [Ah]", "Baseline"]
cycler = Cycler(selected_unit="C", cell_capacity=baseline_capacity)
cycler_input = cycler.cccv(1.0, -1.0, 0.01, 4.2, 2.6, 60.0, 60.0)
output = api.run_sim(
    base_battery="Molicel P45B",
    cycler=cycler.cccv(1.0, -1.0, 0.01, 4.2, 2.6, 60.0, 60.0),
    designs=designs,
    initialSoC=0.5,
    initialTemperature_degC=21.0,
    ambientTemperature_degC=21.0
    )
plot_dynamic_kpis(output["dynamicData"])
```

Let's now try changing the form factor

```
base_format = api.get_battery_format("Molicel P45B")
smaller_format = base_format.copy()
smaller_format["name"] = "Smaller Format"
smaller_format["height_mm"] = 0.9 * base_format["height_mm"]
thinner_format = base_format.copy()
thinner_format["name"] = "Thinner Format"
thinner_format["diameter_mm"] = 0.9 * base_format["diameter_mm"]
formats = [smaller_format, thinner_format]
eqm_kpis, fig = api.get_eqm_kpis("Molicel P45B", designs=[], formats=formats)
eqm_kpis
```

# Examples

Check out the python notebooks in [docs/examples](docs/examples) for how to use the api.
