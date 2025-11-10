#!/bin/bash

csh() {
  if [ -z "$1" ]; then
    echo "Verwendung: csh <thema/kommando>"
    echo "Beispiele:"
    echo "  csh tar"
    echo "  csh python/list"
    echo "  csh js/map"
    return 1
  fi

  # Verwende curl mit cheat.sh
  curl -s "https://cheat.sh/$1"
}
