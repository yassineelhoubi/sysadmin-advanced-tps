#!/bin/bash
LOGFILE="journal.log"

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}

echo "--- Gestionnaire de Fichiers ---"
ls -l # Lists files

echo "Quelle action voulez-vous effectuer ?"
echo "1. Supprimer"
echo "2. Renommer"
echo "3. Copier"
read -p "Choix: " choice

case $choice in
    1)
        read -p "Fichier à supprimer: " file
        if [ -f "$file" ]; then
            rm "$file" && echo "Fichier supprimé."
            log_action "Suppression de $file"
        else
            echo "Fichier introuvable."
        fi
        ;;
    2)
        read -p "Fichier à renommer: " old
        read -p "Nouveau nom: " new
        if [ -f "$old" ]; then
            mv "$old" "$new" && echo "Fichier renommé."
            log_action "Renommage de $old vers $new"
        fi
        ;;
    3)
        read -p "Fichier à copier: " src
        read -p "Destination: " dest
        if [ -f "$src" ]; then
            cp "$src" "$dest" && echo "Fichier copié."
            log_action "Copie de $src vers $dest"
        fi
        ;;
    *) echo "Choix invalide." ;;
esac