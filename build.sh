#!/bin/bash
set -eu

# For use in the GitHub workflow process.
# Run in the root of the repository to produce a dist/ directory.

# Reset dist/ from any previous run
rm -rf dist
mkdir -p dist

# Copy html files
cp -a pages/* dist/

# Copy other files
mkdir -p dist/images
cp images/* dist/images

# Copy CNAME so GitHub Pages preserves the custom domain
# after peaceiris/actions-gh-pages resets the gh-pages branch.
cp CNAME dist/CNAME

# Copy and minify CSS
mkdir -p dist/style
cp style/ubmh-impact.css style/ubmh-sandbox.css dist/style
pnpm run minify
[[ -f dist/style/ubmh-impact.min.css ]]
[[ -f dist/style/ubmh-sandbox.min.css ]]
