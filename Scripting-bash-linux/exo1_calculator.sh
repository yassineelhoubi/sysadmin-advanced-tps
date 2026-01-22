#!/bin/bash

while true; do
    echo "--- Calculateur Interactif ---"
    read -p "Entrez le premier nombre: " num1
    read -p "Entrez le deuxième nombre: " num2

    echo "Choisissez l'opération: + , - , * , / (ou 'q' pour quitter)"
    read op

    case $op in
        +) echo "Résultat: $(echo "$num1 + $num2" | bc)" ;;
        -) echo "Résultat: $(echo "$num1 - $num2" | bc)" ;;
        \*) echo "Résultat: $(echo "$num1 * $num2" | bc)" ;;
        /)
            if [ "$num2" == "0" ]; then
                echo "Erreur: Division par zéro impossible !"
            else
                # Uses bc for floating point division
                echo "Résultat: $(echo "scale=2; $num1 / $num2" | bc)" 
            fi
            ;;
        q) echo "Au revoir !"; break ;;
        *) echo "Opération invalide." ;;
    esac
    echo ""
done