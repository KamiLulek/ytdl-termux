#!/bin/bash

# 1. Tworzenie pliku ytdl.sh w katalogu domowym
cat << 'EOF' > ~/ytdl.sh
#!/bin/bash
cd && cd storage/music || { echo "Błąd: Brak dostępu do storage/music. Odpal 'termux-setup-storage' :d"; exit 1; }
echo "Wklej link do YT i daj Enter :dd"
read -r link
yt-dlp -x --audio-format mp3 "$link"
echo "Gotowe, pobrane! XD"
EOF

# 2. Nadanie uprawnień do wykonywania
chmod +x ~/ytdl.sh

# 3. Dodanie aliasu do .bashrc (tylko jeśli go tam jeszcze nie ma)
if ! grep -q "alias ytdl=" ~/.bashrc; then
    echo "alias ytdl='~/ytdl.sh'" >> ~/.bashrc
    echo "Alias dodany do .bashrc :D"
else
    echo "Alias już istnieje, pomijam dopisywanie :d"
fi

# 4. Odświeżenie sesji
source ~/.bashrc

echo "Konfiguracja zakończona. Teraz wpisz 'ytdl' żeby odpalić pobieranie!"
