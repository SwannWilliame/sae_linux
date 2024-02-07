#!/bin/bash

for filename in $(ls ../DB_Astro/Others)
do
    echo "$(exif ../DB_Astro/Others/$filename | grep "^[^-]" | grep "^[^EXIF]")"
    echo ""
done

for filename in $(ls ../DB_Astro/Solar)
do
    echo "$(exif ../DB_Astro/Solar/$filename | grep "^[^-]" | grep "^[^EXIF]")"
    echo ""
done