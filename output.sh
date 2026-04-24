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
