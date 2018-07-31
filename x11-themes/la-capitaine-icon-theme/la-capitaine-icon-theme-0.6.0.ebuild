# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils

DESCRIPTION="An icon pack designed to integrate with most desktop environments"
HOMEPAGE="https://krourke.org/projects/art/la-capitaine-icon-theme"
SRC_URI="https://github.com/keeferrourke/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default

	cd "${S}"
	rm -rf .github || die
	rm -rf .product || die
	rm -rf configure || die

}

src_install() {
	insinto /usr/share/icons/La-Capitaine
		doins -r ./*
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
