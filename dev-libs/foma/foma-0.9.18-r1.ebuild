# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A set of utilities for constructing finite-state automata and transducers"
HOMEPAGE="https://code.google.com/p/foma/"
SRC_URI="https://bitbucket.org/mhulden/foma/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-libs/readline:*
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	sed -i -e 's/\/usr\/local/\/usr/' \
		-e 's/-ltermcap/-lncurses/' \
		-e 's/(ldconfig || true)/ /' \
		Makefile || die "Sedding Makefile failed."

	if use amd64; then
		sed -i 's/\/lib/\/lib64/' Makefile || die "Sedding Makefile for amd64 failed."
	fi
}

src_install() {
	emake prefix="${D}"/usr install
	einstalldocs
}
