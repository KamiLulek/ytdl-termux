#!/bin/bash

cd ~/storage/music || { echo "Błąd: Brak dostępu do storage :d"; exit 1; }

# Pętla działająca w nieskończoność
while true; do
    clear
    echo "--- YT-DLP MP3 DOWNLOADER ---"
    echo "Wklej link do YT i daj Enter"
    echo "Albo wpisz 'x' i daj Enter, żeby wyjść :dd"
    echo "------------------------------"
    
    read -r input

    # Sprawdzenie czy użytkownik chce wyjść
if [ "$input" = "x" ] || [ "$input" = "X" ]; then
    echo "Zamykam wszystko..."
    bash ~/exit.sh &  # Odpala w tle, żeby główny skrypt mógł "odetchnąć" przed śmiercią
    exit 0
fi

    # Sprawdzenie czy użytkownik nic nie wpisał (sam Enter)
    if [ -z "$input" ]; then
        continue
    fi

    # Pobieranie z pełnym wypasem (jakość, okładka, metadane)
    yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata "$input"

    echo ""
    echo "------------------------------"
    echo "GOTOWE!"
    echo "Wracamy do menu ..."
    sleep 0
done
