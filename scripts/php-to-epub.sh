#!/bin/bash

# Script to convert a PHP page to EPUB

if [ $# -ne 1 ]; then
    echo "Usage: $0 <php-file>"
    exit 1
fi

PHP_FILE=$1
EPUB_FILE="${PHP_FILE%.php}.epub"

# Install necessary tools if not already installed
if ! command -v pandoc &> /dev/null
then
    echo "Installing pandoc..."
    sudo apt-get install pandoc
fi

# Convert PHP to HTML then EPUB
pandoc "${PHP_FILE}" -o "${EPUB_FILE}"

echo "Conversion complete: ${EPUB_FILE} has been created."