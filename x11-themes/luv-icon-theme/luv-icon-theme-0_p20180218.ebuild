# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils

DESCRIPTION="A flat but complex icon theme for freedesktop environments"
HOMEPAGE="https://www.gnome-look.org/p/1193830/"

MY_PV="e2f482afb79ceb9afc928678c5b1a74a6d06e873"
SRC_URI="https://github.com/Nitrux/luv-icon-theme/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+wallpapers"

DEPEND=""
RDEPEND="
	${DEPEND}
	gnome-base/librsvg"

S="${WORKDIR}/${PN}-${MY_PV}"

src_install() {
	dodoc README.md

	if use wallpapers ; then
		insinto /usr/share/backgrounds/Luv
			doins -r ./Wallpapers/*

			dosym "${ED%/}"/usr/share/backgrounds/Luv /usr/share/wallpapers/Luv

	fi

	insinto /usr/share/icons/Luv
		doins -r ./Luv/*
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
