#!/bin/bash

sudo mysql < "sqlscript.sh";  #on lance le script de création de la database à chaque pour faciliter de test


echo "res_x:$(exif $filename | grep "^R'esolution X" | tail -1 | cut -d "|" -f2 | tr -d ' ')"    
echo "res_y:$(exif $filename | grep "^R'esolution Y" | tail -1 | cut -d "|" -f2 | tr -d ' ')"
echo "$(exif $filename | grep "^Unit" | tail -1 | cut -d "|" -f2 | tr -d ' ')"
echo "$(exif $filename | grep "^Date et heure " | tail -1 | cut -d "|" -f2 | tr -d ' ')"
echo "$(exif $filename | grep "^Largeur" | tail -1 | cut -d "|" -f2 | tr -d ' ')"
echo "$(exif $filename | grep "^Longueur" | tail -1 | cut -d "|" -f2 | tr -d ' ')"
echo "$(exif $filename | grep "^Compression" | tail -1 | cut -d "|" -f2 | tr -d ' ')"
echo "$(exif $filename | grep "^'Echantillons" | tail -1 | cut -d "|" -f2 | tr -d ' ')"
echo "$(exif $filename | grep "^Description" | tail -1 | cut -d "|" -f2 | tr -d ' ')"