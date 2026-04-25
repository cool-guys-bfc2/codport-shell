#!/bin/bash
pkg=$1
rm -f "$HOME/pkg/${pkg}.txt"
echo "Removed package ${pkg}."
