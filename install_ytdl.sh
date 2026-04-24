#!/bin/bash

# Pobranie ytdl.sh z GitHub raw
curl -o ~/ytdl.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/ytdl.sh

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
