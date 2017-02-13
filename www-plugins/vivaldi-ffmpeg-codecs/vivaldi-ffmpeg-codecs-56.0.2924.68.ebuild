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

VIVALDISRCVER="vivaldi-snapshot"
PKGSRC="${VIVALDISRCVER}-ffmpeg-codecs-${PV}"

SRC_URI="
	amd64? ( http://repo.herecura.eu/herecura/x86_64/${PKGSRC}-1-x86_64.pkg.tar.xz )
	x86? ( http://repo.herecura.eu/herecura/i686/${PKGSRC}-1-i686.pkg.tar.xz )
"

DEPEND=">=www-client/vivaldi-1.7"
RDEPEND="${DEPEND}"

S=${WORKDIR}

pkg_setup() {
    if [[ -e "${ROOT}opt/vivaldi/vivaldi" ]]; then
        export VIVALDIVER="vivaldi"

    else
        export VIVALDIVER="vivaldi-snapshot"
    fi
}

src_unpack() {
    unpack ${A}
}

src_install() {

	cd ${S}
	mkdir -p ${D}/opt/${VIVALDIVER}/
	cp ${S}/opt/${VIVALDISRCVER}/libffmpeg.so ${D}/opt/${VIVALDIVER}/libffmpeg.so
}
