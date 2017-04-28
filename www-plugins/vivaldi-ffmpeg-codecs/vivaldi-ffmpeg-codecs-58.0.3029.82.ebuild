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

VIVALDISRCVER="vivaldi"
PKGSRC="${VIVALDISRCVER}-ffmpeg-codecs-${PV}"
REV="2.1"

# https://build.opensuse.org/package/view_file/home:Juippis/vivaldi-ffmpeg-codecs/vivaldi-ffmpeg-codecs.spec
SRC_URI="
	amd64? ( http://download.opensuse.org/repositories/home:/Juippis/openSUSE_Tumbleweed/x86_64/${PKGSRC}-${REV}.x86_64.rpm )
	x86? ( http://download.opensuse.org/repositories/home:/Juippis/openSUSE_Tumbleweed/i586/${PKGSRC}-${REV}.i586.rpm )
"

DEPEND=">=www-client/vivaldi-1.9"
RDEPEND="${DEPEND}"

S=${WORKDIR}

pkg_setup() {
	if [[ -e "${ROOT}opt/vivaldi/vivaldi" ]]; then
		export VIVALDIVER="vivaldi"

	elif [[ -e "${ROOT}opt/vivaldi-snapshot/vivaldi" ]]; then
		export VIVALDIVER="vivaldi-snapshot"
		die || "Vivaldi-snapshot detected. Please install a stable version of Vivaldi."

	else 
		export VIVALDIVER="" 
		die || "Couldn't locate Vivaldi installation directory."
	fi
}

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {

	if [[ ${VIVALDIVER} == "" ]]; then
		die || "Is Vivaldi installed?"
	fi 

	insinto /opt/${VIVALDIVER}/
		doins opt/${VIVALDISRCVER}/libffmpeg.so

}
