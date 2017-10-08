# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Flatix Theme created for Manjaro Gnome Edition"
HOMEPAGE="https://github.com/edskeye/MGE-Flatix-Theme"

MY_PV="b42466a1ea3e46e6a2c309ee33fdf955d1d86dde"
SRC_URI="https://github.com/edskeye/MGE-Flatix-Theme/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

# EGIT_REPO_URI="https://github.com/edskeye/MGE-Flatix-Theme.git"
# EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="cinnamon gnome-shell +gtk2 +gtk3 metacity xfce"

DEPEND=""
RDEPEND="
	x11-themes/gtk-engines-murrine
"

S="${WORKDIR}"/MGE-Flatix-Theme-${MY_PV}

src_install() {

	dodoc README.md

	if use cinnamon ; then 
		insinto /usr/share/themes/MGE-Flatix-Theme/cinnamon
			doins -r ./cinnamon/*
	fi

	if use gnome-shell ; then 
		insinto /usr/share/themes/MGE-Flatix-Theme/gnome-shell
			doins -r ./gnome-shell/*
	fi

	if use gtk2 ; then 
		insinto /usr/share/themes/MGE-Flatix-Theme/gtk-2.0
			doins -r ./gtk-2.0/*
	fi

	if use gtk3 ; then 
		insinto /usr/share/themes/MGE-Flatix-Theme/gtk-3.0
			doins -r ./gtk-3.0/*
	fi

	if use metacity ; then 
		insinto /usr/share/themes/MGE-Flatix-Theme/metacity-1
			doins -r ./metacity-1/*
	fi

	if use xfce ; then 
		insinto /usr/share/themes/MGE-Flatix-Theme/xfce-notify-4.0
			doins -r ./xfce-notify-4.0/*

		insinto /usr/share/themes/MGE-Flatix-Theme/xfwm4
			doins -r ./xfwm4/*
	fi

	# insinto /usr/share/themes/MGE-Flatix-Theme
	#	doins -r ./*

}
