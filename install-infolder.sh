#!/bin/bash

cd ~

mkdir ytdl-scr

chmod +x ytdl-scr

sleep 0

cd ytdl-scr

cat << 'EOF' > output.sh
#!/bin/bash

# output.sh - rozbudowana wersja
FILE="$1"

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    sleep 0
    clear
    sleep 0
    echo "════════════════════════════════════════"
    echo "                 Pobrano                "
    echo ""
    echo "  $(basename "$FILE")"
    echo "════════════════════════════════════════"
    echo ""

else
    echo "Błąd: Nie znaleziono pliku: $1"
fi
EOF

chmod +x ~/ytdl-scr/output.sh

cat << 'EOF' > ytdl.sh
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
    echo "════════════════════════════════════════"
    echo "          YT-DLP MP3 DOWNLOADER         "
    echo "    Wklej link do YT, 'x' zeby wyjsc.   "
    echo "════════════════════════════════════════"
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
        echo "════════════════════════════════════════"
        echo "         BRAK lub ZłY link YT!          "
        echo "════════════════════════════════════════"
        echo ""
        continue
    fi

    # Sprawdzenie czy to poprawny link YouTube
    if ! is_youtube_link "$input"; then
        echo ""
        echo "════════════════════════════════════════"
        echo "         BRAK lub ZłY link YT!          "
        echo "════════════════════════════════════════"
        echo ""
        continue
    fi

    clear
    
    echo ""
    echo "════════════════════════════════════════"
    echo "               Pobieranie               "
    echo "════════════════════════════════════════"
    echo ""

    # Pobieranie i wyświetlenie nazwy pliku
        # Pobieranie z lepszym wyświetlaniem dla playlist
    yt-dlp -x --ignore-errors --audio-format mp3 --embed-thumbnail --add-metadata \
        --exec '~/ytdl-scr/output.sh {}' "$input"
done
EOF

# Nadanie uprawnień
chmod +x ~/ytdl-scr/ytdl.sh

sleep 0

# Dodanie aliasu do .bashrc (tylko jeśli go tam jeszcze nie ma)
cat << 'EOF' > .bashrc
alias ytdl='./ytdl-scr/ytdl.sh'
EOF

sleep 0

# Odświeżenie sesji
source .bashrc

sleep 0

echo ""
echo "════════════════════════════════════════"
echo "          Instalacja zakończona         "
echo "        Wpisz 'ytdl' żeby odpalić       "
echo "════════════════════════════════════════"
echo ""

sleep 2
