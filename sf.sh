#!/bin/bash

if [ ! -f app/console ] ; then
    if [ ! -f bin/console ] ; then
        # Erreur
        echo -e '\033[41;37;1m'
        printf "\n Impossible de localiser le fichier console\n"
        printf " Le chemin $PWD est-il la racine de votre projet ?\n"
        echo -e '\033[m'
        printf "\n"
        exit 1
    else
        cmd="php bin/console"
    fi
else
    cmd="php app/console"
fi

# Aucun argument, affichage de la doc
if [ $# = 0 ] ; then
    $cmd
    exit 0
fi

# Ajout des arguments a la commande
for var in "$@"
do
    cmd+=" $var"
done

# Execution de la commande
$cmd
