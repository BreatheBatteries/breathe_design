# setupEnvironment.ps1
# Script to set up a virtual environment and install requirements for breathe_design

# Set error action preference to stop on errors
$ErrorActionPreference = "Stop"

# Get the directory where this script is located (should be the repo root)
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host "Setting up environment in: $RepoRoot" -ForegroundColor Green

# Check if Python is available
try {
    $PythonVersion = python --version 2>&1
    Write-Host "Found Python: $PythonVersion" -ForegroundColor Green
} catch {
    Write-Host "Error: Python not found. Please install Python 3.11 or later." -ForegroundColor Red
    Write-Host "Download from: https://www.python.org/downloads/" -ForegroundColor Yellow
    exit 1
}

# Check Python version (should be 3.11+)
$VersionString = python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
$Version = [Version]$VersionString
$MinVersion = [Version]"3.11"

if ($Version -lt $MinVersion) {
    Write-Host "Error: Python $Version found, but Python 3.11 or later is required." -ForegroundColor Red
    Write-Host "Please upgrade Python: https://www.python.org/downloads/" -ForegroundColor Yellow
    exit 1
}

# Set paths
$VenvPath = Join-Path $RepoRoot "venv"
$RequirementsPath = Join-Path $RepoRoot "requirements.txt"

# Check if requirements.txt exists
if (Test-Path $RequirementsPath) {
    $RequirementsCommand = "python -m pip install -r $RequirementsPath"
} else {
    if (Test-Path "pyproject.toml") {
        $RequirementsCommand = "python -m pip install ."
    }
    else {
        Write-Host "Error: requirements.txt not found at $RequirementsPath" -ForegroundColor Red
        Write-Host "Make sure you're running this script from the repository root." -ForegroundColor Yellow
        exit 1
    }
}

# Remove existing virtual environment if it exists
if (Test-Path $VenvPath) {
    Write-Host "Removing existing virtual environment..." -ForegroundColor Yellow
    Remove-Item $VenvPath -Recurse -Force
}

# Create new virtual environment
Write-Host "Creating virtual environment at: $VenvPath" -ForegroundColor Green
python -m venv $VenvPath

if (-not $?) {
    Write-Host "Error: Failed to create virtual environment." -ForegroundColor Red
    exit 1
}

# Activate virtual environment
$ActivateScript = Join-Path $VenvPath "Scripts\Activate.ps1"
if (-not (Test-Path $ActivateScript)) {
    Write-Host "Error: Virtual environment activation script not found." -ForegroundColor Red
    exit 1
}

Write-Host "Activating virtual environment..." -ForegroundColor Green
& $ActivateScript

# Upgrade pip
Write-Host "Upgrading pip..." -ForegroundColor Green
python -m pip install --upgrade pip

if (-not $?) {
    Write-Host "Warning: Failed to upgrade pip, continuing anyway..." -ForegroundColor Yellow
}

# Install requirements
Write-Host "Installing requirements with $RequirementsCommand ..." -ForegroundColor Green
Invoke-Expression $RequirementsCommand

if (-not $?) {
    Write-Host "Error: Failed to install requirements." -ForegroundColor Red
    exit 1
}

# Display installed packages
Write-Host "" -ForegroundColor Green
Write-Host "Setup complete!" -ForegroundColor Green
Write-Host "" -ForegroundColor Green
