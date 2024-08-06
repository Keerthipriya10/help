#!/bin/bash

# Define the process name or command
PROCESS_NAME="python main.py"

# Find the PID(s) of the process
PIDS=$(pgrep -f "$PROCESS_NAME")

if [ -z "$PIDS" ]; then
    echo "No running process found for '$PROCESS_NAME'."
    exit 1
fi

# Kill the process(es)
echo "Stopping process(es) with PID(s): $PIDS"
kill $PIDS

# Optional: wait for the process to terminate
sleep 2

# Verify if the process is stopped
PIDS=$(pgrep -f "$PROCESS_NAME")
if [ -z "$PIDS" ]; then
    echo "Process stopped successfully."
else
    echo "Failed to stop process. Process still running: $PIDS"
    exit 1
fi
