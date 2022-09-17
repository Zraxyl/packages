#!/bin/bash

folders=(kcoreaddons kdbusaddons kconfig kdnssd kguiaddons ki18n kidletime kimageformats kitemmodels kitemviews kplotting kwidgetsaddons kwindowsystem networkmanager-qt solid sonnet threadweaver kauth kcompletion kcrash kdoctools kpty kunitconversion kconfigwidgets kservice kglobalaccel kpackage kdesu kemoticons kiconthemes kjobwidgets knotifications ktextwidgets kxmlgui kbookmarks kwallet kded kio kdeclarative kcmutils kirigami2 syndication knewstuff frameworkintegration kinit kparts kactivities kdewebkit syntax-highlighting ktexteditor kdesignerplugin kwayland plasma-framework modemmanager-qt kpeople kxmlrpcclient bluez-qt kfilemetadata baloo breeze-icons oxygen-icons5 kactivities-stats krunner prison qqc2-desktop-style kjs kdelibs4support khtml kjsembed kmediaplayer kross kholidays purpose kcalendarcore kcontacts kquickcharts knotifyconfig kdav)

function build_extras_S() {
        shopt -s globstar
        for d in ${folders[@]} ; do
		mkdir -p "$d"                
		cd "$d"
		$@
		sudo pacman -U *x86_64*tar.gz --noconfirm
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
