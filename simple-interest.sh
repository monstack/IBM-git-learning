#!/bin/bash

# Simple Interest Calculator

echo "---------------------------------------"
echo "      Simple Interest Calculator       "
echo "---------------------------------------"

# Function to validate if input is a number
validate_input() {
    if [[ ! $1 =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Invalid input. Please enter a numeric value."
        exit 1
    fi
}

# Prompt user for Principal
read -p "Enter the Principal amount: " principal
validate_input "$principal"

# Prompt user for Rate of Interest
read -p "Enter the annual Rate of Interest (in %): " rate
validate_input "$rate"

# Prompt user for Time period
read -p "Enter the Time period (in years): " time
validate_input "$time"

# Calculate Simple Interest using 'bc' for floating point math
# Formula: SI = (P * R * T) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount
total=$(echo "scale=2; $principal + $interest" | bc)

echo "---------------------------------------"
echo "Results:"
echo "Interest Earned: $interest"
echo "Total Balance:   $total"
echo "---------------------------------------"
