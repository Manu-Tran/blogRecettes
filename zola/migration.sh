#!/usr/bin/env bash
# convert_header_inplace.sh
# Usage: ./convert_header_inplace.sh file.md
set -euo pipefail

file="${1:?usage: $0 file}"
tmp="$(mktemp)"

awk '
BEGIN {
  in_header = 0

  title = category = date = updated = summary = ""
  tags_n = authors_n = 0
}

function trim(s){ gsub(/^[ \t\r]+|[ \t\r]+$/, "", s); return s }
function split_list(s, arr,    tmpa,n,i,x,cnt){
  n = split(s, tmpa, /[,;]+/)
  cnt = 0
  for (i=1; i<=n; i++) {
    x = trim(tmpa[i])
    if (x != "") arr[++cnt] = x
  }
  return cnt
}
function yaml_quote(s,    t){
  t = s
  gsub(/\\/,"\\\\",t)
  gsub(/"/,"\\\"",t)
  return "\"" t "\""
}
function emit_yaml(    i){
  print "---"
  print "title: " (title != "" ? title : "")
  print "taxonomies:"
  print "  category:"
  if (category != "") print "    - " category
  print "  tags:"
  for (i=1; i<=tags_n; i++) print "    - " tags[i]
  print "  authors:"
  for (i=1; i<=authors_n; i++) print "      - " authors[i]
  print "date: " (date != "" ? date : "")
  if (updated != "") print "updated: " updated
  if (summary != "") print "summary: " yaml_quote(summary)
  print "---"
}

# Returns:
#   1 if the line was a recognized header field
#   2 if the line was blank (header separator)
#   0 if not header
function handle_header_line(line){
  if (line ~ /^[ \t]*$/) return 2

  if (line ~ /^Title:[ \t]*/){
    sub(/^Title:[ \t]*/, "", line); title = trim(line); return 1
  }
  if (line ~ /^Category:[ \t]*/){
    sub(/^Category:[ \t]*/, "", line); category = trim(line); return 1
  }
  if (line ~ /^Tags?:[ \t]*/){
    sub(/^Tags?:[ \t]*/, "", line); tags_n = split_list(line, tags); return 1
  }
  if (line ~ /^Authors?:[ \t]*/){
    sub(/^Authors?:[ \t]*/, "", line); authors_n = split_list(line, authors); return 1
  }
  if (line ~ /^Date:[ \t]*/){
    sub(/^Date:[ \t]*/, "", line); date = trim(line); return 1
  }
  if (line ~ /^Modified:[ \t]*/){
    sub(/^Modified:[ \t]*/, "", line); updated = trim(line); return 1
  }
  if (line ~ /^Summary:[ \t]*/){
    sub(/^Summary:[ \t]*/, "", line); summary = trim(line); return 1
  }
  return 0
}

{
  line = $0
  sub(/\r$/, "", line)   # tolerate CRLF

  # Detect legacy header at the very start
  if (NR == 1) {
    if (line ~ /^(Title|Category|Tags?|Authors?|Date|Modified|Summary):[ \t]*/) {
      in_header = 1
      # Process the first line as header immediately (bugfix)
      res = handle_header_line(line)
      next
    } else {
      in_header = 0
      print line
      next
    }
  }

  if (in_header) {
    res = handle_header_line(line)
    if (res == 1) next           # header field consumed
    if (res == 2) {              # blank line → end of header
      emit_yaml(); in_header=0; next
    }
    # First non-header line → close header, then print this as body
    emit_yaml(); in_header=0; print line; next
  }

  # Normal body passthrough
  print line
}

END {
  # File ended while still in header
  if (in_header) emit_yaml()
}
' "$file" > "$tmp" && mv "$tmp" "$file"

