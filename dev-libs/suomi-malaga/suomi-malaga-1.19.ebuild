# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-any-r1

DESCRIPTION="Suomi-malaga is a description of Finnish morphology implemented with Malaga."
HOMEPAGE="http://voikko.puimula.org/"
SRC_URI="http://www.puimula.org/voikko-sources/${PN}/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=app-misc/malaga-7.12
${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

src_compile() {
	emake PYTHON="${PYTHON}" voikko || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}usr/lib/voikko" voikko-install
	dodoc README{,.fi}
}

