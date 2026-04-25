#!/bin/bash

cd ~

# Dodanie aliasu do .bashrc (tylko jeśli go tam jeszcze nie ma)
cat << 'EOF' > .bashrc
alias ytdl='~/ytdl-scr/ytdl.sh'
EOF
source .bashrc

sleep 0

mkdir ~/storage/shared/music-ytdl

mkdir ~/ytdl-scr
chmod +x ~/ytdl-scr


# Pobranie ytdl.sh z GitHub raw
curl -o ~/ytdl-scr/ytdl.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/ytdl.sh
curl -o ~~/ytdl-scr/output.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/output.sh

# Nadanie uprawnień
chmod +x ~/ytdl-scr/ytdl.sh
chmod +x ~/ytdl-scr/output.sh

sleep 0

clear
echo ""
echo "════════════════════════════════════════"
echo "          Instalacja zakończona         "
echo "        Wpisz 'ytdl' żeby odpalić       "
echo "════════════════════════════════════════"
echo ""
