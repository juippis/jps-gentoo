# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils toolchain-funcs

DESCRIPTION="A set of utilities for constructing finite-state automata and transducers"
HOMEPAGE="https://code.google.com/p/foma/"
SRC_URI="https://bitbucket.org/mhulden/foma/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	sys-libs/readline:*
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${P}"

src_prepare() {
	sed -i 's/\/usr\/local/\/usr/' Makefile
	sed -i 's/-ltermcap/-lncurses/' Makefile
	sed -i 's/(ldconfig || true)/ /' Makefile

	if use amd64; then
		sed -i 's/\/lib/\/lib64/' Makefile
	fi

	default
}

src_compile() {
	emake prefix="${D}"/usr
}

src_install() {
	emake prefix="${D}"/usr install || die "installation failed"
}
