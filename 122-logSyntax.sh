#!/bin/bash

log_file="/var/log/path/hardening.log"

# Function to log messages
log() {
    local log_level="$1"
    local message="$2"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] [$log_level] - $message" > "$log_file"
}


# Example usage
log "INFO" "Script starting..."

# Your script logic goes here

log "INFO" "Script completed."