#!/bin/sh
#
# - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -
# This script prepares the documentation for production release
# then creates a zip file.
#
# NOTICE: This script requires `composer`, `git`, and `zip`
#          binaries installed globally.
#
# (c) 2021 Dedulab
# - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -  - -


# 1) Package the plugin, then move compressed file to build directory
rm -f build/do-framework-documentation.zip
zip -r build/do-framework-documentation.zip . \
    -x \.\* \*/\.\* \*.zip \*.log \*.xml \
    gulpfile.js package.json package-lock.json \
    \./\*.lock \./\*.md \
    \*.git\* node_modules\/\* scripts\* build\*

cd build
unzip do-framework-documentation.zip -d do-framework-documentation
rm -f do-framework-documentation.zip
zip -r do-framework-documentation.zip do-framework-documentation
rm -rf do-framework-documentation
cd ../
