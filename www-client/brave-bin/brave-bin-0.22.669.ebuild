# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

BRAVE_PN="${PN/-bin/}"

CHROMIUM_LANGS="
	am ar bg bn ca cs da de el en-GB en-US es es-419 et fa fi fil fr gu he hi
	hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr sv
	sw ta te th tr uk vi zh-CN zh-TW
"

inherit chromium-2 gnome2-utils xdg-utils

DESCRIPTION="Brave Web Browser"
HOMEPAGE="https://brave.com"
SRC_URI="https://github.com/brave/browser-laptop/releases/download/v${PV}dev/Brave.tar.bz2 -> ${P}.tar.bz2"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gnome-keyring"

DEPEND="gnome-base/gconf:2"
RDEPEND="
	${DEPEND}
	app-accessibility/at-spi2-atk
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib
	dev-libs/libgcrypt
	dev-libs/nspr
	dev-libs/nss
	dev-libs/openssl
	media-libs/alsa-lib
	net-print/cups
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:2
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/pango
	x11-misc/xdg-utils
	gnome-keyring? ( >=gnome-base/libgnome-keyring-3.12:= )
"

QA_PREBUILT="*"

S="${WORKDIR}/${BRAVE_PN}-linux-x64"

pkg_setup() {
	chromium_suid_sandbox_check_kernel_config
}

src_prepare() {
	default

	pushd "${S}/locales" > /dev/null || die
		chromium_remove_language_paks
	popd > /dev/null || die
}

src_install() {
	declare BRAVE_HOME=/opt/${BRAVE_PN}

	dodir ${BRAVE_HOME%/*}

	insinto ${BRAVE_HOME}
		doins -r *

	exeinto ${BRAVE_HOME}
		doexe brave

	dosym ${BRAVE_HOME}/brave /usr/bin/${PN}

	newicon "${S}/resources/extensions/brave/img/braveAbout.png" "${PN}.png"
	newicon -s 128 "${S}/resources/extensions/brave/img/braveAbout.png" "${PN}.png"

	# install-xattr doesnt approve using domenu or doins from FILESDIR
	cp "${FILESDIR}"/${PN}.desktop "${S}" || die "Copying ${PN}.desktop failed."
	domenu "${S}"/${PN}.desktop
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update

	elog "NOTE: If you are using a variant of debian-sources kernel, Brave-bin "
	elog "may not start due to sandboxing error. You can get around this error "
	elog "by adding the following line into /etc/sysctl.conf: "
	elog " kernel.unprivileged_userns_clone = 1"
	elog "and then running sysctl -p"
	elog "Running Brave-bin with --no-sandbox is NOT recommended!"
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
