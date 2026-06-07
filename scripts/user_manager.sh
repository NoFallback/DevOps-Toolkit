#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
echo "Usage: $0 users.csv"
exit 1
fi

csv_file="$1"

if [[ ! -f "$csv_file" ]]; then
echo "Error: CSV file not found: $csv_file"
exit 1
fi
while IFS=, read -r action username; do
[[ -z "${action:-}" ]] && continue
[[ "$action" =~ ^# ]] && continue

case "$action" in
    create)
        if id "$username" &>/dev/null; then
            echo "User '$username' already exists"
        else
            useradd -m "$username"
            echo "Created user '$username'"
        fi
        ;;
    delete)
        if id "$username" &>/dev/null; then
            userdel -r "$username" 2>/dev/null || userdel "$username"
            echo "Deleted user '$username'"
        else
            echo "User '$username' does not exist"
        fi
        ;;
    *)
        echo "Unknown action '$action' for user '$username'"
        ;;
esac

done < "$csv_file"
