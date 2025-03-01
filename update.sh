#!/bin/sh -e
cd "${0%/*}"
for arch in armv6-ios i386-macos x86_64-macos; do
    (
    cd "$arch"
    dpkg-scanpackages -m ./debs > Packages 2> /dev/null
    gzip -fkn Packages
    bzip2 -fk Packages
    ) &
done
wait
printf 'Done!\n'
