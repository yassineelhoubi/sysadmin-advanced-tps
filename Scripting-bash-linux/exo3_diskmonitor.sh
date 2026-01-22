#!/bin/bash

THRESHOLD=90
PARTITION="/"

# Get usage percentage (strips the % sign)
USAGE=$(df -h "$PARTITION" | grep / | awk '{ print $5 }' | sed 's/%//g')

echo "Espace utilisé sur $PARTITION : $USAGE%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "ALERTE CRITIQUE: Espace disque faible ($USAGE% utilisé) !"
    # Optional: Send email here
else
    echo "Espace disque normal."
fi