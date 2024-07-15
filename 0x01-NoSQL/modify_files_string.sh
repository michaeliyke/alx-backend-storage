#!/usr/bin/env bash
# Modify files in current directory: replace "MogoDB file" with "Mongosh file"
# Usage: ./modify_files_string.sh

for file in *; do
    if [ -f "$file" ]; then

		# Skip file that do not contain "MongoDB file"
		if ! grep -q "Mongosh file" "$file"; then
			# echo "Skip file: $file"
			continue
		fi

		if [ "$file" == "modify_files_string.sh" ]; then
			echo "Skip file: $file"
			continue
		fi

        sed -i 's/Mongosh file/MongoDB file: mongo\/mongosh/g' "$file"
		echo "Modified file: $file"
    fi
done
