# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

DESCRIPTION="A browser plugin designed for the viewing of premium video content, works with Vivaldi web browser."
HOMEPAGE="http://www.google.com/chrome"
SRC_URI="https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${PV}-1_amd64.deb"

LICENSE="google-chrome"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

RESTRICT="bindist mirror strip"

DEPEND="www-client/vivaldi[system-ffmpeg]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/opt/google/chrome"
QA_PREBUILT="*"

src_install() {

	insinto /opt/vivaldi/
		doins libwidevinecdm.so

}
