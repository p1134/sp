#!/bin/bash

# 🔐 Skopiuj plik z secrets do katalogu aplikacji
cp /etc/secrets/firebase_credentials.json /var/www/html/config/firebase_credentials.json

# ✅ Uruchom Apache
exec apache2-foreground
