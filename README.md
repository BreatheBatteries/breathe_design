# Breathe Design

A python based api wrapper for running the breathe design model.

> **Registration Required**: To use the Breathe Design API, you must register for a free trial. You can sign up at [https://www.breathebatteries.com/breathe-design-free-trial](https://www.breathebatteries.com/breathe-design-free-trial).

## Installation steps

### In a new project or existing project

In the virtual environment in your new or existing project, simply install `breathe_design` with

```
pip install breathe_design
```

### Using this repo

If you want to work with the examples in this repo, follow these steps...

- Open your terminal or command prompt.
- Navigate to the directory or create new one where you want to setup.
- Run the following command to clone our GitHub repository.

  ```bash
  git clone https://github.com/BreatheBatteries/breathe_design.git .
  ```

To set up everything in one go, just run `.\setupEnvironment.ps1`.

That will create a virtual environment and install the requirements.

## Alternative manual setup

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

# Examples

Check out the python notebooks in [docs/examples](docs/examples) for how to use the api.

# Reporting Bugs

If you find a bug, or run into an error, please raise an issue on the GitHub account.
