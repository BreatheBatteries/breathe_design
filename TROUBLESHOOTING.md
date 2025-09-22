# Troubleshooting

## Permission denied when creating virtual environment

If you get this sort of error when creating the virtual environment...

```
PS D:\Git\breathe_design> python -m venv venv
Error: [Errno 13] Permission denied: 'D:\\Git\\breathe_design\\venv\\Scripts\\python.exe'
```

...it might be that a virtual environment from before already exists, and the python inside it is still running.

Ensure that that `python.exe` is not running (close it in task manager if it is), delete the `venv` folder, and try the command again.
