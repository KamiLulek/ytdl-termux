#!/bin/bash

# output.sh - rozbudowana wersja
FILE="$1"

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    echo ""
    echo "════════════════════════════════════════"
    echo "  $(basename "$FILE")"
    echo "════════════════════════════════════════"

    echo ""
else
    echo "⚠️ Błąd: Nie znaleziono pliku: $1"
fi
