#!/bin/bash

# 1. Tworzenie pliku ytdl.sh w katalogu domowym
cat << 'EOF' > ~/ytdl.sh
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
        echo "Nara! Zamykam Termuxa... XD"
        sleep 1
        exit 0
    fi

    # Sprawdzenie czy użytkownik nic nie wpisał (sam Enter)
    if [ -z "$input" ]; then
        echo "Nic nie wpisano! Wracam do menu..."
        sleep 2
        continue
    fi

    # Pobieranie z pełnym wypasem (jakość, okładka, metadane)
    yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata "$input"

    echo ""
    echo "------------------------------"
    echo "GOTOWE! Plik siedzi w Music :D"
    echo "Zamykam Termuxa za 3 sekundy..."
    sleep 3
    
    # Po zakończeniu pobierania - wyjście i zamknięcie Termuxa
    exit 0
done
EOF

# 2. Nadanie uprawnień do wykonywania
chmod +x ~/ytdl.sh

# 3. Dodanie aliasu do .bashrc (tylko jeśli go tam jeszcze nie ma)
if ! grep -q "alias ytdl=" ~/.bashrc; then
    echo "alias ytdl='~/ytdl.sh'" >> ~/.bashrc
    echo "Alias dodany do .bashrc"
else
    echo "Alias już istnieje, pomijam dopisywanie"
fi

# 4. Odświeżenie sesji
source ~/.bashrc

echo "Konfiguracja zakończona. Teraz wpisz 'ytdl' żeby odpalić pobieranie!"
