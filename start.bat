@echo off
REM Heart Disease Analysis Flask App - Quick Start Script (Windows)
REM This script will set up and run your Flask application

echo ======================================
echo Heart Disease Analysis Flask App
echo Quick Start Script (Windows)
echo ======================================
echo.

REM Check Python installation
echo Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    echo X Python is not installed. Please install Python 3.8 or higher.
    pause
    exit /b 1
)

for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PYTHON_VERSION=%%i
echo √ Python %PYTHON_VERSION% found
echo.

REM Check if we're in the correct directory
if not exist "app.py" (
    echo X Error: app.py not found. Please run this script from the heart_disease_app directory.
    pause
    exit /b 1
)

REM Create virtual environment if it doesn't exist
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
    echo √ Virtual environment created
) else (
    echo √ Virtual environment already exists
)

REM Activate virtual environment
echo.
echo Activating virtual environment...
call venv\Scripts\activate.bat
echo √ Virtual environment activated

REM Install dependencies
echo.
echo Installing dependencies...
python -m pip install --quiet --upgrade pip
pip install --quiet -r requirements.txt
echo √ Dependencies installed

REM Check configuration
echo.
echo ======================================
echo Configuration Check
echo ======================================

REM Check if Tableau URLs are configured
findstr /C:"YOUR_TABLEAU_URL_HERE" app.py >nul
if not errorlevel 1 (
    echo ! Warning: Tableau URLs need to be configured
    echo   Please edit app.py and replace placeholder URLs
    echo   See TABLEAU_SETUP.md for detailed instructions
    echo.
    set /p CONTINUE="Do you want to continue anyway? (Y/N): "
    if /i not "%CONTINUE%"=="Y" (
        echo Exiting. Please configure Tableau URLs first.
        pause
        exit /b 1
    )
) else (
    echo √ Tableau URLs appear to be configured
)

REM Start the application
echo.
echo ======================================
echo Starting Flask Application
echo ======================================
echo.
echo The application will start on http://localhost:5000
echo Press Ctrl+C to stop the server
echo.
echo Opening in 3 seconds...
timeout /t 3 /nobreak >nul

REM Open in default browser
start http://localhost:5000

REM Run the Flask app
python app.py

pause
