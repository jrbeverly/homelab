#/bin/sh

default_ext="zip"
extension=${1:-$default_ext}

run() {
    for i in */; do zip -r "${i%/}.${1}" "$i"; done
}

run $extension