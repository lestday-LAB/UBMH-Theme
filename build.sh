#!/bin/bash
set -eu

# For use in the GitHub workflow process.
# Run in the root of the repository to produce a dist/ directory.

# Create directory structure
mkdir -p dist/pages

# Copy html files
cp -a pages/* dist/pages/

# Copy and minify CSS
mkdir -p dist/css
cp css/ubmh-impact.css css/ubmh-sandbox.css dist/css
pnpm run minify
[[ -f dist/css/ubmh-impact.min.css ]]
[[ -f dist/css/ubmh-sandbox.min.css ]]
