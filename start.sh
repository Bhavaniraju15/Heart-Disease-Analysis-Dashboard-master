#!/bin/bash

# Heart Disease Analysis Flask App - Quick Start Script
# This script will set up and run your Flask application

echo "======================================"
echo "Heart Disease Analysis Flask App"
echo "Quick Start Script"
echo "======================================"
echo ""

# Check Python installation
echo "Checking Python installation..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d ' ' -f 2)
echo "✓ Python $PYTHON_VERSION found"
echo ""

# Check if we're in the correct directory
if [ ! -f "app.py" ]; then
    echo "❌ Error: app.py not found. Please run this script from the heart_disease_app directory."
    exit 1
fi

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "✓ Virtual environment created"
else
    echo "✓ Virtual environment already exists"
fi

# Activate virtual environment
echo ""
echo "Activating virtual environment..."
source venv/bin/activate || source venv/Scripts/activate 2>/dev/null
echo "✓ Virtual environment activated"

# Install dependencies
echo ""
echo "Installing dependencies..."
pip install -q --upgrade pip
pip install -q -r requirements.txt
echo "✓ Dependencies installed"

# Check configuration
echo ""
echo "======================================"
echo "Configuration Check"
echo "======================================"

# Check if Tableau URLs are configured
if grep -q "YOUR_TABLEAU_URL_HERE" app.py; then
    echo "⚠️  Warning: Tableau URLs need to be configured"
    echo "   Please edit app.py and replace placeholder URLs"
    echo "   See TABLEAU_SETUP.md for detailed instructions"
    echo ""
    read -p "Do you want to continue anyway? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting. Please configure Tableau URLs first."
        exit 1
    fi
else
    echo "✓ Tableau URLs appear to be configured"
fi

# Start the application
echo ""
echo "======================================"
echo "Starting Flask Application"
echo "======================================"
echo ""
echo "The application will start on http://localhost:5000"
echo "Press Ctrl+C to stop the server"
echo ""
echo "Opening in 3 seconds..."
sleep 3

# Try to open in default browser
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:5000 &
elif command -v open &> /dev/null; then
    open http://localhost:5000 &
elif command -v start &> /dev/null; then
    start http://localhost:5000 &
fi

# Run the Flask app
python app.py
