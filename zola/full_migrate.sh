#!/bin/bash

for file in content/recettes/*.md; do
  echo "Converting $file..."
  ./migration.sh "$file"
done
