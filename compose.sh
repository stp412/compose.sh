#! /bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 [editor] file.ly"
  exit 2
fi

editor="$1"
file="$2"
basename="$(basename -s .ly "$file")"
pdfout="$basename.pdf"
outdir="$(dirname "$file")"

$editor "$2" &
editor_pid=$!

lilypond -o "$basename" "$file" && mupdf "$pdfout" &


inotifywait -m -e close_write -e moved_to "$outdir"  | 
while read -r path action fname; do
    if [ "$fname" = "$file" ]; then
      if lilypond -o "$basename" "$file"; then
        killall mupdf 2>/dev/null
        mupdf "$pdfout"
      fi
    fi
done &

wait $editor_pid
kill $!

killall mupdf 2>/dev/null
