# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GNOME2_EAUTORECONF="yes"

inherit gnome2 xdg-utils

DESCRIPTION="A GTK2 image viewer, manga reader, and booru browser"
HOMEPAGE="https://github.com/ahodesuka/ahoviewer"
SRC_URI="https://github.com/ahodesuka/ahoviewer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gstreamer libsecret +rar +zip"

DEPEND="
	>=dev-cpp/glibmm-2.36.0:2
	>=dev-cpp/gtkmm-2.20.0:2.4
	>=dev-libs/libconfig-1.4
	dev-libs/libxml2
	>=net-misc/curl-7.32.0
	gstreamer? (
		media-libs/gst-plugins-bad:1.0[opengl]
		media-libs/gstreamer:1.0
	)
	libsecret? ( app-crypt/libsecret )
	rar? ( app-arch/unrar )
	zip? ( dev-libs/libzip )
"

RDEPEND="
	${DEPEND}
	gstreamer? (
		media-libs/gst-plugins-good:1.0
		|| (
			media-plugins/gst-plugins-vpx
			media-plugins/gst-plugins-libav
		)
	)
"

src_prepare() {
	gnome2_src_prepare
}

src_configure() {
	local myconf_ahoviewer=(
		$(use_enable gstreamer gst)
		$(use_enable libsecret)
		$(use_enable rar)
		$(use_enable zip)
	)

	gnome2_src_configure "${myconf_ahoviewer[@]}"
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
