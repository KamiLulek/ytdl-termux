#!/bin/bash

cd ~/storage/music || { echo "Błąd: Brak dostępu do storage :d"; exit 1; }

clear

# Funkcja sprawdzająca czy to link YouTube
is_youtube_link() {
    local link="$1"
    if [[ "$link" =~ ^(https?://)?(www\.)?(youtube\.com|youtu\.be)/ ]]; then
        return 0
    else
        return 1
    fi
}

# Pętla działająca w nieskończoność
while true; do
    echo ""
    echo "---------------------------------"
    echo "      YT-DLP MP3 DOWNLOADER      "
    echo "Wklej link do YT, 'x' zeby wyjsc."
    echo "---------------------------------"
    echo ""
    read -r input

    # Sprawdzenie czy użytkownik chce wyjść
    if [ "$input" = "x" ] || [ "$input" = "X" ]; then
        echo ""
        echo "Zamykam wszystko..."
        echo ""
        exit 0
    fi

    # Sprawdzenie czy użytkownik nic nie wpisał (sam Enter)
    if [ -z "$input" ]; then
        echo ""
        echo "BRAK lub ZłY link YT!"
        continue
    fi

    # Sprawdzenie czy to poprawny link YouTube
    if ! is_youtube_link "$input"; then
        echo ""
        echo "BRAK lub ZłY link YT!"
        continue
    fi

    echo ""
    echo "Pobieranie: $input"
    echo ""

    # Pobieranie z pełnym wypasem (jakość, okładka, metadane)
    yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata "$input"

    echo ""
    echo "---------------------------------"
    echo "         !!! POBRANE !!!         "
    echo "---------------------------------"
    echo ""
    # brak sleep i brak clear – wszystko zostaje na ekranie
done
