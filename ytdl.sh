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
    echo "👋 Zamykam Termuxa za 3 sekundy..."
    ~/exit.sh  # BEZ & (nie w tle)
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
    echo "GOTOWE! Plik siedzi w Music :D"
    echo "Wracamy do menu za 2 sekundy..."
    sleep 1
done
