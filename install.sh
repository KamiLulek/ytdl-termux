#!/bin/bash

# Konfiguracja storage
termux-setup-storage
sleep 1

# Instalacja zależności
pkg update -y && pkg upgrade -y
pkg install python ffmpeg curl -y
pip install yt-dlp

sleep 1

cd ~

sleep 1

# Pobranie ytdl.sh z GitHub raw
curl -o ~/ytdl.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/ytdl.sh

# Nadanie uprawnień
chmod +x ~/ytdl.sh

sleep 1

# Dodanie aliasu do .bashrc (tylko jeśli go tam jeszcze nie ma)
cat << 'EOF' > .bashrc
alias ytdl='./ytdl.sh'
EOF

sleep 1

# Odświeżenie sesji
source .bashrc

sleep 1

echo ""
echo "✅ Instalacja zakończona!"
echo "📌 Teraz wpisz 'ytdl' żeby odpalić pobieranie"
echo "💡 Po wpisaniu 'x' w menu - Termux się zamknie"
