# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Additional proprietary codecs for Vivaldi web browser, stable release."
HOMEPAGE="http://www.vivaldi.net"

LICENSE="LGPL2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SRC_URI="
	amd64? ( http://repo.herecura.eu/herecura/x86_64/${P}-1-x86_64.pkg.tar.xz )
	x86? ( http://repo.herecura.eu/herecura/i686/${P}-1-i686.pkg.tar.xz )
"

DEPEND="www-client/vivaldi"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() { 
	unpack ${A}
}

src_install() { 
	cd ${S}
	mkdir -p ${D}/opt/vivaldi/
	cp ${S}/opt/vivaldi/libffmpeg.so ${D}/opt/vivaldi/libffmpeg.so
	# mkdir -p ${D}/opt/vivaldi-snapshot/lib/
	# rm ${D}/opt/vivaldi-snapshot/lib/libffmpeg.so
	# ln -s ${D}/opt/vivaldi-snapshot/libffmpeg.so ${D}/opt/vivaldi-snapshot/lib/libffmpeg.so
}
