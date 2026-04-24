#!/bin/bash

cd ~

mkdir ytdl-script
chmod +x ytdl-script

sleep 0

# Pobranie ytdl.sh z GitHub raw
curl -o ~/ytdl-script/ytdl.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/ytdl.sh
curl -o ~/ytdl-script/output.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/output.sh

# Nadanie uprawnień
chmod +x ~/ytdl-script/ytdl.sh
chmod +x ~/ytdl-script/output.sh

sleep 0

# Dodanie aliasu do .bashrc (tylko jeśli go tam jeszcze nie ma)
cat << 'EOF' > .bashrc
alias ytdl='./ytdl-script/ytdl.sh'
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
