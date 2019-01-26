# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="Ant-Nebula"

DESCRIPTION="Nebula variant of the Ant theme"
HOMEPAGE="https://www.gnome-look.org/p/1099856/"
SRC_URI="https://github.com/EliverLara/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome-shell gtk2 +gtk3 metacity unity xfce"

RDEPEND="gtk2? ( x11-themes/gtk-engines-murrine )"

S="${WORKDIR}"/"${MY_PN}"-"${PV}"

src_install() {
	if use gnome-shell ; then
		insinto /usr/share/themes/${PN}
			doins -r ./gnome-shell
	fi

	if use gtk2 ; then
		insinto /usr/share/themes/${PN}
			doins -r ./gtk-2.0
	fi

	if use gtk3 ; then
		insinto /usr/share/themes/${PN}
			doins -r ./gtk-3.20

		dosym gtk-3.20 /usr/share/themes/${PN}/gtk-3.0
	fi

	if use metacity ; then
		insinto /usr/share/themes/${PN}
			doins -r ./metacity-1
	fi

	if use unity ; then
		insinto /usr/share/themes/${PN}
			doins -r ./unity
	fi

	if use xfce ; then
		insinto /usr/share/themes/${PN}
			doins -r xfwm4
	fi

	insinto /usr/share/themes/${PN}
		doins -r ./Art
		doins -r ./assets
		doins index.theme

	einstalldocs
}
