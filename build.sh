#!/bin/bash
set -eu

# For use in the GitHub workflow process.
# Run in the root of the repository to produce a dist/ directory.

# Copy html files
cp -a pages/* dist/

# Copy other files
mkdir -p dist/images
cp images/* dist/images

# Copy and minify CSS
mkdir -p dist/css
cp css/ubmh-impact.css css/ubmh-sandbox.css dist/css
pnpm run minify
[[ -f dist/css/ubmh-impact.min.css ]]
[[ -f dist/css/ubmh-sandbox.min.css ]]
