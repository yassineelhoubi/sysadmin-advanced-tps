#!/bin/bash

USER_FILE="users.txt"

if [ ! -f "$USER_FILE" ]; then
    echo "Erreur: Le fichier $USER_FILE est introuvable."
    exit 1
fi

echo "--- Début de la création des utilisateurs ---"

# Read file line by line
while IFS= read -r user; do
    if [ -n "$user" ]; then
        echo "Création de l'utilisateur : $user... [OK]"
        # sudo useradd "$user" # Command commented out for simulation safety
    fi
done < "$USER_FILE"

echo "--- Terminé ---"