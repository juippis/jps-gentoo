# Copyright 1999-2018 Gentoo Authors
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
IUSE="gnutls +gstreamer libressl libsecret +rar ssl +zip"

DEPEND="
	dev-cpp/glibmm:2
	dev-cpp/gtkmm:2.4
	dev-libs/libconfig[cxx]
	dev-libs/libxml2
	dev-libs/libsigc++:2
	net-misc/curl:=
	gnutls? ( net-misc/curl[curl_ssl_gnutls] )
	gstreamer? (
		media-libs/gst-plugins-bad:1.0
		media-libs/gstreamer:1.0
	)
	libressl? ( net-misc/curl[curl_ssl_libressl] )
	libsecret? ( app-crypt/libsecret )
	rar? ( app-arch/unrar )
	ssl? (
		libressl? ( net-misc/curl[curl_ssl_libressl] )
		!libressl? ( net-misc/curl[curl_ssl_openssl] )
	)
	zip? ( dev-libs/libzip )
"
RDEPEND="
	${DEPEND}
	gstreamer? (
		media-libs/gst-plugins-base:1.0[X]
		media-libs/gst-plugins-good:1.0
		|| (
			media-plugins/gst-plugins-vpx
			media-plugins/gst-plugins-libav
		)
	)
"
REQUIRED_USE="
	?? ( gnutls ssl )
	libressl? ( ssl )
"

src_configure() {
	local myconf=(
		$(use_enable gnutls)
		$(use_enable gstreamer gst)
		$(use_enable libsecret)
		$(use_enable rar)
		$(use_enable ssl)
		$(use_enable zip)
	)

	gnome2_src_configure "${myconf[@]}"
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
