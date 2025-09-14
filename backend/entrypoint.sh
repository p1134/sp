#!/bin/bash

# 🔐 Ustaw uprawnienia do Firebase credentials po starcie kontenera
chmod 644 /etc/secrets/firebase_credentials.json || true

# ✅ Uruchom Apache
exec apache2-foreground
