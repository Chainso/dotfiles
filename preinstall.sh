#!/bin/bash

preinstall_base_dir="./preinstallers"
preinstall_dir="$preinstall_base_dir/$1"

preinstall_candidates=(
  "pip"
  "stow"
)

for preinstall_candidate in "${preinstall_candidates[@]}"; do
  if [ ! -f "$preinstall_dir/$preinstall_candidate.sh" ]; then
    echo "Preinstall script for $preinstall_candidate not found, please install manually"
    continue
  fi

  echo "Installing dependency $preinstall_candidate..."
  sh "$preinstall_dir/$preinstall_candidate.sh"
done
