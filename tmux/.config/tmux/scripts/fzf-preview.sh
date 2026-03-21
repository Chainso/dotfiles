#!/usr/bin/env bash

file=$1

if [[ -z "$file" ]]; then
  exit 0
fi

if command -v bat >/dev/null 2>&1; then
  bat --style=numbers --color=always --line-range ':200' "$file"
else
  sed -n '1,200p' "$file"
fi
