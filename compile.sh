#!/bin/bash/

# --- Config ---

# The name of the final output file
OUTPUT_FILE="Compile.md"

# The pattern to search for (e.g., "*.md" for all markdown, "attacks/.*txt for specific files)
SEARCH_PATTERN="*.md"

# Directory to compile from
DIRECTORY="../known-cyber-attacks"

# --- Script Execution Setup ---

echo "--- Starting compliation process ---"

# Check if directory exists
if [ ! -d "$DIRECTORY" ]; then
	echo "Directory does not exist"
	exit
fi

# Clear or create the output file
> "$OUTPUT_FILE"

# Add a main title to the compiled file
echo "# Repository Attack Compilation" >> "$OUTPUT_FILE"
echo "This document was automatically generated on $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "---" >> "$OUTPUT_FILE"

# --- Script ---

#for f in "$DIRECTORY"/**/"$SEARCH_PATTERN"; do 
#	echo "$f"
#done

find "$DIRECTORY" -name "$SEARCH_PATTERN" -type f | while read -r file; do

	# Files not to include
	if [ "$file" == "../known-cyber-attacks/README.md" ] || [[ "$file" =~ Comments ]] || [ "$file" == "../known-cyber-attacks/Template/README.md" ]; then
		continue
	fi

	# File header
	echo "# Source: $file" >> "$OUTPUT_FILE"
	echo "" >> "$OUTPUT_FILE"

	# Append the file content
	cat "$file" >> "$OUTPUT_FILE"

	# Add seperator
	echo "" >> "$OUTPUT_FILE"
	echo "---" >> "$OUTPUT_FILE"
	echo "" >> "$OUTPUT_FILE"

done

# --- Completion ---

echo "--- Compilation successful! All content is saved to $OUTPUT_FILE ---"
