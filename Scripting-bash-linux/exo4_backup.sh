#!/bin/bash

SOURCE_DIR="./mon_projet"       # Change this to the folder you want to backup
BACKUP_DIR="./backups"
DATE=$(date +%Y-%m-%d)
ARCHIVE_NAME="backup_$DATE.tar.gz"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Dossier de sauvegarde créé: $BACKUP_DIR"
fi

# Create the compressed archive
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Sauvegarde réussie : $BACKUP_DIR/$ARCHIVE_NAME"
else
    echo "Erreur lors de la sauvegarde. Vérifiez que le dossier source existe."
fi