#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Error: Invalid number of arguments --- Usage: create-markdown.sh <output_filename>"
  exit 1
fi

# Get the output filename from the command line argument
character=$1
number=$2
title=$3

if [ "$character" = "e" ]; then
    difficulty="Easy"
elif [ "$character" = "m" ]; then
    difficulty="Medium"
elif [ "$character" = "h" ]; then
    difficulty="Hard"
else
  echo "Error: invalid difficulty '$character'"
  exit 1
fi

output_filename="Graphs-$difficulty-$number-$title".md

# Check if the output file already exists
if [ -e "$output_filename" ]; then
  echo "Error: File '$output_filename' already exists. Please choose a different name."
  exit 1
fi

# Copy the contents of 'template.md' into the new Markdown file
cat ../template.md > "$output_filename"

echo "Markdown file '$output_filename' created successfully."
