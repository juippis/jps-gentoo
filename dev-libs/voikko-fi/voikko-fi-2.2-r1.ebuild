# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{4..7} )

inherit python-any-r1

DESCRIPTION="Finnish dictionary for libvoikko based spell checkers (vvfst format)"
HOMEPAGE="https://voikko.puimula.org/"
SRC_URI="https://www.puimula.org/voikko-sources/${PN}/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	${PYTHON_DEPS}
	dev-libs/foma
	$(python_gen_any_dep '
		>=dev-libs/libvoikko-4.0[${PYTHON_USEDEP}]
	')
"
RDEPEND="${DEPEND}"

src_compile() {
	emake vvfst || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}/usr/share/voikko/" vvfst-install
	einstalldocs
}
