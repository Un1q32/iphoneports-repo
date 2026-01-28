#!/bin/sh -e
set -e
cd "${0%/*}"
for arch in armv6-ios armv7-ios armv7s-ios arm64-ios i386-macos x86_64-macos arm64-macos armv6-ios1 i386-tiger; do
    (
    cd "$arch"
    dpkg-scanpackages -m ./debs > Packages 2> /dev/null
    gzip -fkn Packages
    bzip2 -fk Packages
    ) &
done
wait
printf 'Done!\n'
