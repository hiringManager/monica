#!/bin/bash
BACKUP_DIR=./json_exports
mkdir -p "$BACKUP_DIR"
DATE=$(date +%Y%m%d_%H%M%S)

# Example Contacts export (Monica API must be configured with token)
API_URL="http://localhost:8082/api/contacts"
API_TOKEN="YOUR_API_TOKEN_HERE"

curl -s -H "Authorization: Bearer $API_TOKEN" "$API_URL" -o "$BACKUP_DIR/contacts_${DATE}.json"
echo "Contacts exported to: $BACKUP_DIR/contacts_${DATE}.json"
