# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_3 python3_4 python3_5 )

inherit python-any-r1

DESCRIPTION="Finnish dictionary for libvoikko based spell checkers. (vvfst format)"
HOMEPAGE="http://voikko.puimula.org/"
SRC_URI="http://www.puimula.org/voikko-sources/${PN}/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
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
	# dodoc README{,.fi}
}

