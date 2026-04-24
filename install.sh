#!/bin/bash

# Konfiguracja storage
termux-setup-storage
sleep 2

# Instalacja zależności
pkg update -y && pkg upgrade -y
pkg install python ffmpeg curl -y
pip install yt-dlp

# Pobranie ytdl.sh z GitHub raw
curl -o ~/ytdl.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/ytdl.sh

# Pobranie exit.sh z GitHub raw
curl -o ~/exit.sh https://raw.githubusercontent.com/KamiLulek/ytdl-termux/refs/heads/main/exit.sh

# Nadanie uprawnień
chmod +x ~/ytdl.sh
chmod +x ~/exit.sh

# Dodanie aliasu do .bashrc
if ! grep -q "alias ytdl=" ~/.bashrc; then
    echo "alias ytdl='~/exit.sh'" >> ~/.bashrc
    echo "✅ Alias dodany do .bashrc"
else
    sed -i 's/alias ytdl=.*/alias ytdl='"'"'~/exit.sh'"'"'/' ~/.bashrc
    echo "✅ Alias zaktualizowany"
fi

# Odświeżenie sesji
source ~/.bashrc

echo ""
echo "✅ Instalacja zakończona!"
echo "📌 Teraz wpisz 'ytdl' żeby odpalić pobieranie"
echo "💡 Po wpisaniu 'x' w menu - Termux się zamknie"
