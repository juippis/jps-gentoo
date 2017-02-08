# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A set of utilities for constructing finite-state automata and transducers"
HOMEPAGE="https://code.google.com/p/foma/"
SRC_URI="https://bitbucket.org/mhulden/foma/downloads/${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-libs/zlib
		sys-libs/readline"
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${P}"

src_unpack() {
	unpack ${A}
	cd ${S}

	sed -i 's/\/usr\/local/\/usr/' Makefile
	sed -i 's/-ltermcap/-lncurses/' Makefile
	sed -i 's/(ldconfig || true)/ /' Makefile
}

src_compile() { 
	emake prefix=${D}/usr
}

src_install() { 
	emake prefix=${D}/usr install || die "installation failed"
}
