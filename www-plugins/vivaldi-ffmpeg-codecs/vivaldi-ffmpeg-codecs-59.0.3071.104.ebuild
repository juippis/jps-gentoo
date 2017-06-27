# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm

DESCRIPTION="Additional proprietary codecs for Vivaldi web browser."
HOMEPAGE="http://www.vivaldi.net"

LICENSE="LGPL2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REV="3.1"

# https://build.opensuse.org/package/view_file/home:Juippis/vivaldi-ffmpeg-codecs/vivaldi-ffmpeg-codecs.spec
SRC_URI="
	amd64? ( http://download.opensuse.org/repositories/home:/Juippis/openSUSE_Tumbleweed/x86_64/${P}-${REV}.x86_64.rpm )
	x86? ( http://download.opensuse.org/repositories/home:/Juippis/openSUSE_Tumbleweed/i586/${P}-${REV}.i586.rpm )
"

DEPEND=">=www-client/vivaldi-1.10"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {

	insinto /opt/vivaldi/
		doins opt/vivaldi/libffmpeg.so

}
