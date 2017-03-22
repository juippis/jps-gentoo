# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Pulseaudio mixer in Qt (port of pavucontrol)."
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
		lxqt-base/liblxqt
		dev-util/lxqt-build-tools
"
RDEPEND="
		${DEPEND}
		>=lxqt-base/liblxqt-${PV}
        media-sound/pulseaudio[glib]
        x11-misc/xdg-user-dirs
"

src_configure() { 

	# The Gentoo-LXQt way
	local mycmakeargs=(
		-DPULL_TRANSLATIONS=no
	)

	cmake-utils_src_configure

}

