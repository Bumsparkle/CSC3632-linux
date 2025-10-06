#!/bin/bash/

# --- Config ---

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

# Check the input argument
if [ -z "$1" ]; then
	echo "Usage: $0 <STRIDE CATEGORY>"
	echo "Example: $0 Tampering"
	echo "Valid categories to include: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege."
	exit 1
fi

# The category provided by the user
CATEGORY="$1"

# --- Script: Search Process ---

echo "--- Searching for attacks categorised as: $CATEGORY ---"
echo ""

grep -ril "$CATEGORY" "$DIRECTORY" --include="$SEARCH_PATTERN"

# --- Completion ---

if [ $? -eq 0 ]; then
	echo ""
	echo "--- Search complete. ---"
else
	echo "No files found matching the category"
fi
