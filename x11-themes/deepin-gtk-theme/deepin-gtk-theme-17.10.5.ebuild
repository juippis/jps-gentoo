# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Deepin GTK Theme"
HOMEPAGE="https://www.deepin.org/en/dde/"
SRC_URI="https://github.com/linuxdeepin/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cinnamon gnome-shell +gtk2 +gtk3 metacity unity xfce"

DEPEND=""
RDEPEND="
	${DEPEND}
	gtk2? ( x11-themes/gtk-engines-murrine )
"

MY_PN1=deepin
MY_PN2=deepin-dark

src_install() {
	if use cinnamon ; then
		insinto /usr/share/themes/${MY_PN1}/cinnamon
			doins -r ./${MY_PN1}/cinnamon/*

		insinto /usr/share/themes/${MY_PN2}/cinnamon
			doins -r ./${MY_PN2}/cinnamon/*

	fi

	if use gnome-shell ; then
		insinto /usr/share/themes/${MY_PN1}/gnome-shell
			doins -r ./${MY_PN1}/gnome-shell/*

		insinto /usr/share/themes/${MY_PN2}/gnome-shell
			doins -r ./${MY_PN2}/gnome-shell/*

	fi

	if use gtk2 ; then
		insinto /usr/share/themes/${MY_PN1}/gtk-2.0
			doins -r ./${MY_PN1}/gtk-2.0/*

		insinto /usr/share/themes/${MY_PN2}/gtk-2.0
			doins -r ./${MY_PN2}/gtk-2.0/*

	fi

	if use gtk3 ; then
		insinto /usr/share/themes/${MY_PN1}/gtk-3.0
			doins -r ./${MY_PN1}/gtk-3.0/*

		insinto /usr/share/themes/${MY_PN2}/gtk-3.0
			doins -r ./${MY_PN2}/gtk-3.0/*

	fi

	if use metacity ; then
		insinto /usr/share/themes/${MY_PN1}/metacity-1
			doins -r ./${MY_PN1}/metacity-1/*

		insinto /usr/share/themes/${MY_PN2}/metacity-1
			doins -r ./${MY_PN2}/metacity-1/*

	fi

	if use unity ; then
		insinto /usr/share/themes/${MY_PN1}/unity
			doins -r ./${MY_PN1}/unity/*

		insinto /usr/share/themes/${MY_PN2}/unity
			doins -r ./${MY_PN2}/unity/*

	fi

	if use xfce ; then
		insinto /usr/share/themes/${MY_PN1}/xfwm4
			doins -r ./${MY_PN1}/xfwm4/*

		insinto /usr/share/themes/${MY_PN2}/xfwm4
			doins -r ./${MY_PN2}/xfwm4/*

	fi
}
