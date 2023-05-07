#!/bin/bash

ARCH="x86_64"
OUT="../../../../out"
PKGS="${OUT}/pkgs/${ARCH}"

remove_leftovers() {
    iam=$1

    cd $@

    set +e
    echo " "
    echo "[*]: Moving $iam pkgs to proper place"
    mkdir -p $PKGS/$iam/
    mv */*pkg.t* $PKGS/$iam/ &> /dev/null
    set -e
    echo "[*]: Cleaning up $iam"

    rm -rf */pkg/ */src/ */*pkg* */*xz* */*tar.gz */*tar.bz2 */*.zip */*/ */*tgz */*tar.zst */*sign* */*sig* */*asc*

    cd ..
}

remove_kde_leftovers() {
    iam=$1

    cd $@

    KDE_DEF="frameworks graphics kdevelop libraries multimedia network other plasma sdk system themes utilities"
    for removed in ${KDE_DEF}
    do
        set +e
        echo " "
        echo "[*]: Moving KDE/$removed pkgs to proper place"
        mkdir -p $PKGS/$iam/
        mv $removed/*/*pkg.t* $PKGS/$iam/ &> /dev/null
        set -e

        echo "[*]: Cleaning up KDE/$removed"
        rm -rf $removed/*/pkg/ $removed/*/src/ $removed/*/*pkg* $removed/*/*xz* $removed/*/*tar.gz $removed/*/*tar.bz2 $removed/*/*.zip $removed/*/*/ $removed/*/*tgz $removed/*/*tar.zst $removed/*/*sign* $removed/*/*sig* $removed/*/*asc*
    done

    # KDE Neon
    set +e
    echo " "
    echo "[*]: Moving KDE/neon pkgs to proper place"
    mkdir -p ${OUT}/pkgs/${ARCH}/$iam
    mv neon/*/*/*pkg.t* ../${OUT}/pkgs/${ARCH}/$iam/ &> /dev/null
    set -e

    echo "[*]: Cleaning up KDE/neon"
    rm -rf neon/*/*/pkg/ neon/*/*/src/ neon/*/*/*pkg* neon/*/*/*xz* neon/*/*/*tar.gz neon/*/*/*tar.bz2 neon/*/*/*.zip neon/*/*/*/ neon/*/*/*tgz neon/*/*/*tar.zst neon/*/*/*sign* neon/*/*/*sig* neon/*/*/*asc*

    cd ..
}

remove_xorg_leftovers() {
    iam=$1

    cd $@

    KDE_DEF="app data driver libs proto xserver"
    for removed in ${KDE_DEF}
    do
        set +e
        echo " "
        echo "[*]: Moving XORG/$removed pkgs to proper place"
        mkdir -p $PKGS/$iam/
        mv $removed/*/*pkg.t* $PKGS/$iam/ &> /dev/null
        set -e

        echo "[*]: Cleaning up XORG/$removed"
        rm -rf $removed/*/pkg/ $removed/*/src/ $removed/*/*pkg* $removed/*/*xz* $removed/*/*tar.gz $removed/*/*tar.bz2 $removed/*/*.zip $removed/*/*/ $removed/*/*tgz $removed/*/*tar.zst $removed/*/*sign* $removed/*/*sig* $removed/*/*asc*
    done

    cd ..
}

set -e

remove_leftovers core
remove_leftovers cross_tools
remove_leftovers extra
remove_leftovers extra32
remove_leftovers games
remove_leftovers layers
remove_leftovers pentest
remove_leftovers perl
remove_leftovers proprietary
remove_leftovers python
remove_leftovers server
remove_leftovers xfce
remove_leftovers gnome
remove_kde_leftovers kde
remove_xorg_leftovers xorg

echo " "
echo "[*]: Done"
