# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Wallpapers from the Deepin project"
HOMEPAGE="https://www.deepin.org/en/"
SRC_URI="https://github.com/linuxdeepin/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	# deepin has their own scripts
	rm Makefile
}

src_install() {
	dodoc README.md

	insinto /usr/share/backgrounds/deepin
		doins ./deepin/*
}
