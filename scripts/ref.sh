#!/bin/sh
# Print this plugin's reference files by short name, for example:
#   ref.sh blueprint key
# The skills call it through !`...` injection, so the reference text loads
# with the skill and Claude never has to ask to read a file outside your project.
# It only reads files inside the plugin's own reference/ folder.
dir="$(cd "$(dirname "$0")/../reference" && pwd)" || exit 1
for name in "$@"; do
  case "$name" in
    blueprint)  file="foundations-blueprint.md" ;;
    key)        file="exam-key-vs-docs.md" ;;
    examples)   file="example-items.md" ;;
    vocabulary) file="vocabulary.md" ;;
    item-rules) file="item-rules.md" ;;
    *) echo "ref.sh: unknown reference '$name'" >&2; exit 1 ;;
  esac
  printf '\n<!-- cert-coach reference: %s -->\n\n' "$file"
  cat "$dir/$file"
done
