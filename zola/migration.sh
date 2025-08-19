#!/bin/bash

file="$1"
tmpfile=$(mktemp)

awk '
BEGIN {
    in_header = 1
    print "---"
}
in_header {
    if ($1 == "Title:") {
        sub("Title:", "title:", $0)
        print $0
    } else if ($1 == "Category:") {
        sub("Category: ", "", $0)
        print "taxonomies:"
        print "  category:"
        print "    - " $0
    } else if ($1 == "Tags:") {
        sub("Tags: ", "", $0)
        n = split($0, tags, ",")
        print "  tags:"
        for (i=1; i<=n; i++) {
            gsub(/^ +| +$/, "", tags[i])  # trim spaces
            print "    - " tags[i]
        }
    } else if ($1 == "Authors:") {
        sub("Authors: ", "", $0)
        n = split($0, authors, ",")
        print "  authors:"
        for (i=1; i<=n; i++) {
            gsub(/^ +| +$/, "", authors[i])  # trim spaces
            print "    - " authors[i]
        }
    } else if ($1 == "Date:") {
        sub("Date:", "date:", $0)
        print $0
    } else if ($0 ~ /^$/) {
        # empty line = end of header
        print "---"
        in_header = 0
    }
    next
}
{
    print
}
' "$file" > "$tmpfile" && mv "$tmpfile" "$file"

