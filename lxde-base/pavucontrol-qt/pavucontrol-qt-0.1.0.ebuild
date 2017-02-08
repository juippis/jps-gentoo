# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Pulseaudio mixer in Qt (port of pavucontrol)"
HOMEPAGE="https://github.com/lxde/pavucontrol-qt"
SRC_URI="https://github.com/lxde/${PN}/releases/download/${PV}/${PN}-${PV}.tar.xz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
		dev-util/cmake
		dev-qt/qtdbus
		dev-qt/qtwidgets:5
"
RDEPEND="
		${DEPEND}
		>=lxqt-base/liblxqt-${PV}
        media-sound/pulseaudio
        x11-misc/xdg-user-dirs
"

src_configure() { 
	cmake-utils_src_configure
}
