#!/bin/bash

# Function to check if the KDE window manager is ready
is_wm_ready() {
    # Check if the KWin process is running
    pgrep kwin > /dev/null
}

# Wait until the window manager is ready
while ! is_wm_ready; do
    sleep 0.5 # Wait for a short period before checking again
done

# Run unclutter command with specified options
unclutter -root -noevents -grab -idle 2 &

# Save the process ID of the unclutter command
UNCLUTTER_PID=$!

# Function to kill the unclutter process when the script exits
trap 'kill $UNCLUTTER_PID' EXIT

# Wait for the unclutter process to finish
wait $UNCLUTTER_PID
