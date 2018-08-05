# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4..6} )

inherit python-any-r1

DESCRIPTION="Finnish dictionary for libvoikko based spell checkers. (vvfst format)"
HOMEPAGE="http://voikko.puimula.org/"
SRC_URI="http://www.puimula.org/voikko-sources/${PN}/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/libvoikko-4.0
		dev-libs/foma
		${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

src_compile() {
	emake vvfst || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}/usr/share/voikko/" vvfst-install

	DOCS="README.md"
	einstalldocs
}
