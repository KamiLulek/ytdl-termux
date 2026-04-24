#!/bin/bash

# 1. Tworzenie pliku ytdl.sh w katalogu domowym
cat << 'EOF' > ~/ytdl.sh
#!/bin/bash

cd ~/storage/music || { echo "Błąd: Brak dostępu do storage :d"; exit 1; }

clear

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
        echo "Zamykam wszystko..."
        exit 0
    fi

    # Sprawdzenie czy użytkownik nic nie wpisał (sam Enter)
    if [ -z "$input" ]; then
        echo "Nie wpisałeś linku"
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
done
EOF

# Nadanie uprawnień
chmod +x ~/ytdl.sh

sleep 0

# Dodanie aliasu do .bashrc (tylko jeśli go tam jeszcze nie ma)
cat << 'EOF' > .bashrc
alias ytdl='./ytdl.sh'
EOF

sleep 0

# Odświeżenie sesji
source .bashrc

sleep 0

echo ""
echo "---------------------------------"
echo "      Instalacja zakończona      "
echo "---------------------------------"
echo "    Wpisz 'ytdl' żeby odpalić    "
echo "---------------------------------"
echo ""
