#!/bin/bash

folders=(kdewebkit kdesignerplugin kxmlrpcclient kjs kdelibs4support khtml kjsembed kmediaplayer kross)

function build_extras_S() {
        shopt -s globstar
        for d in ${folders[@]} ; do
		mkdir -p "$d"                
		cd "$d"
		$@
                cd ..
        done
}

build_extras_S "makepkg --skipint"

function build_extras_S() {
        shopt -s globstar
        for d in ${folders[@]} ; do
               rm -rf "$d"
        done
}

#build_extras_S "makepkg --skipint -C -f"
