#!/bin/bash



if [ $# -lt 1 ]

then

    echo "aucun paramètre n'a été donné"

    exit 1;

fi



sudo mysql sae_database -e "$*";