# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="Extra ffmpeg codecs for the Chromium Browser"
HOMEPAGE="https://ffmpeg.org/"
SRC_URI="http://mirrors.kernel.org/ubuntu/pool/universe/c/chromium-browser/${PN}_${PV}-0ubuntu0.15.10.1.1215_amd64.deb"

LICENSE="LGPL2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	mv * "${D}" || die
}
