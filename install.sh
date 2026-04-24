#!/bin/bash

# Konfiguracja storage
termux-setup-storage
sleep 1

# Instalacja zależności
pkg update -y && pkg upgrade -y
pkg install python ffmpeg curl -y
pip install yt-dlp

sleep 0

cd ~

sleep 0

# Pobranie ytdl.sh z GitHub raw
curl -o ~/ytdl.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/ytdl.sh
curl -o ~/output.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/output.sh

# Nadanie uprawnień
chmod +x ~/ytdl.sh
chmod +x ~/output.sh

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
echo "════════════════════════════════════════"
echo "          Instalacja zakończona         "
echo "        Wpisz 'ytdl' żeby odpalić       "
echo "════════════════════════════════════════"
echo ""
