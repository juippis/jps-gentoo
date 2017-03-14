# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="HFST spell checker library and command line tool."
HOMEPAGE="https://github.com/hfst/hfst-ospell"
SRC_URI="https://github.com/hfst/hfst-ospell/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# It searches for libxmlpp-2.6, so >3 wont work. 
DEPEND="
	app-arch/libarchive
	dev-cpp/libxmlpp:2.6
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/hfst-ospell-${PV}

src_configure() { 

	eautoreconf || die "Autoconf failed" 
	econf \ 
		--prefix=/usr 

}

