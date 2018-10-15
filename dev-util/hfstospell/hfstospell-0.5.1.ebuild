# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="HFST spell checker library and command line tool."
HOMEPAGE="https://github.com/hfst/hfst-ospell"
SRC_URI="https://github.com/hfst/hfst-ospell/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# It depends on libxmlpp-2.6, so >3 wont work. 
DEPEND="
	app-arch/libarchive
	dev-cpp/libxmlpp:2.6
	dev-libs/icu:=
	dev-libs/tinyxml2
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

S=${WORKDIR}/hfst-ospell-${PV}

src_prepare() {
	default
	eautoreconf
}
