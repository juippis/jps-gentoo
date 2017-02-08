# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Additional support for proprietary codecs for Vivaldi web browser."
HOMEPAGE="http://www.vivaldi.net"
SRC_URI="http://repo.herecura.eu/herecura/x86_64/vivaldi-snapshot-ffmpeg-codecs-${PV}-1-x86_64.pkg.tar.xz"

LICENSE="LGPL2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="www-client/vivaldi"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() { 
	unpack ${A}
}

src_install() { 
	cd ${S}
	mkdir -p ${D}/opt/vivaldi-snapshot/
	cp ${S}/opt/vivaldi-snapshot/libffmpeg.so ${D}/opt/vivaldi-snapshot/libffmpeg.so
	# mkdir -p ${D}/opt/vivaldi-snapshot/lib/
	# rm ${D}/opt/vivaldi-snapshot/lib/libffmpeg.so
	# ln -s ${D}/opt/vivaldi-snapshot/libffmpeg.so ${D}/opt/vivaldi-snapshot/lib/libffmpeg.so
}
