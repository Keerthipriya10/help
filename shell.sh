#!/bin/bash

# Path to the virtual environment
VENV_PATH="/path/to/your/virtualenv/bin"

# Path to your Flask app's entry point
FLASK_APP_PATH="/path/to/your/flask/app"

# Activate the virtual environment and start Flask app in the background
source $VENV_PATH/activate
nohup python $FLASK_APP_PATH/app.py > flask_app.log 2>&1 &

# Wait for the Flask app to start
echo "Waiting for Flask app to start..."
sleep 10 # Adjust the sleep time as needed

# Run the Electron app
cd /path/to/your/electron/app
npm run electron:serve

# Deactivate virtual environment
deactivate
