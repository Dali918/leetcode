#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: create-markdown.sh <output_filename>"
  exit 1
fi

# Get the output filename from the command line argument
output_filename="$1".md

# Check if the output file already exists
if [ -e "$output_filename" ]; then
  echo "Error: File '$output_filename' already exists. Please choose a different name."
  exit 1
fi

# Copy the contents of 'template.md' into the new Markdown file
cat template.md > "$output_filename"

echo "Markdown file '$output_filename' created successfully."
