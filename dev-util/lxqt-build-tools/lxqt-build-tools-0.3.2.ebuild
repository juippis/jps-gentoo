# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Tools to build LXQt and components maintained by the project."
HOMEPAGE="https://github.com/lxde/lxqt-build-tools"
SRC_URI="https://github.com/lxde/${PN}/releases/download/${PV}/${PN}-${PV}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
		dev-util/cmake
		dev-qt/qtdbus
		dev-qt/qtwidgets:5
"
RDEPEND="
		${DEPEND}
"

src_configure() { 
	cmake-utils_src_configure
}
