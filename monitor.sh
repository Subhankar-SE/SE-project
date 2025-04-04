#!/bin/bash

# ==========================
# Linux Resource Monitoring Script
# ==========================

# Thresholds
CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=90

# Log file location
LOG_FILE="/var/log/resource_monitor.log"

# Email for alerts
EMAIL="your-email@example.com"

# Function to log data
log_data() {
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - CPU: $CPU_USAGE% | RAM: $RAM_USAGE% | Disk: $DISK_USAGE%" >> "$LOG_FILE"
}

# Function to send alert email
send_alert() {
    echo "Resource Usage Alert: CPU: $CPU_USAGE%, RAM: $RAM_USAGE%, Disk: $DISK_USAGE%" | mail -s "Linux System Alert" "$EMAIL"
}

# Function to get system stats
check_resources() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')  # CPU usage
    RAM_USAGE=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100.0}')  # RAM usage
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//g')  # Disk usage

    # Log data
    log_data

    # Alert conditions
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )) || 
       (( $(echo "$RAM_USAGE > $RAM_THRESHOLD" | bc -l) )) || 
       (( "$DISK_USAGE" -gt "$DISK_THRESHOLD" )); then
        send_alert
    fi
}

# Run the resource check
check_resources
