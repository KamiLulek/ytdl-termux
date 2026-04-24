#!/bin/bash

cd ~/storage/music || { 
    echo "❌ Błąd: Brak dostępu do storage/music"
    echo "📌 Uruchom najpierw: termux-setup-storage"
    exit 1
}

# Pętla główna
while true; do
    clear
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "   YT-DLP MP3 DOWNLOADER"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📎 Wklej link do YouTube i Enter"
    echo "❌ Albo wpisz 'x' i Enter (zamknie Termux)"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    read -r input

    # Wyjście przez 'x' - odpala exit.sh i wychodzi z pętli
    if [ "$input" = "x" ] || [ "$input" = "X" ]; then
        echo "👋 Zamykam Termuxa za 3 sekundy..."
        ~/exit.sh &
        exit 0
    fi

    # Pusty Enter - nic nie robi, wraca do menu
    if [ -z "$input" ]; then
        continue
    fi

    # Pobieranie
    echo ""
    echo "📥 Pobieranie: $input"
    yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata "$input"

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ GOTOWE! Plik jest w Music"
    echo "🔄 Wracam do menu za 2 sekundy..."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    sleep 2
done
