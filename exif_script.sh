#!/bin/bash

for i in $(ls DB_Astro/Others/)
do
    data=$(exif DB_Astro/Others/$i)
    echo "$i : "
    echo " "
    echo "$data"
    echo " "
    echo " "
    echo " "
done