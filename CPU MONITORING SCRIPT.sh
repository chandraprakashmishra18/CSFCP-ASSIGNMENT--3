#!/bin/bash
# LOG THE CPU AND MEMORY USAGE TO A FILE AT A REGULAR INTERVALS
# AUTHOR: CHANDRA PRAKASH MISHRA
# DATE:18/11/2025

#CHECK IF BOTH THE ARGUEMENTS ARE GIVEN
if [ $# -ne 2 ]; then
  echo "Usage: $0 <interval_in_seconds> <output_file>"
  exit 1
fi
# ASSIGNING THE ARGUEMENTS TO THE VARIABLES
interval=$1
output=$2

# WRITING THE HEADER TO THE OUPUT FILE
echo "Timestamp, CPU_Usage(%), Memory_Usage(%)" > "$output"

# RUNNING THE INFINITE LOOP TO MONITOR AND LOG CPU AND MEMORY USAGE
while true; do
  # GET THE CURRENT TIMESTAMP
  timestamp=$(date +"%Y-%m-%d\ %H:%M:%S")
  
  # GET THE CPU USAGE PERCENTAGE
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
  
  # GET THE MEMORY USAGE PERCENTAGE
  mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  
  # WRITING THE DATE TO THE OUTPUT FILE
  echo "$timestamp, $cpu_usage, $mem_usage" >> "$output"
  
  # WAITING FOR THE SPECIFIED INTERVAL
  sleep "$interval"
done
