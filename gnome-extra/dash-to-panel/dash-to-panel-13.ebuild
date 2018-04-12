# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils

DESCRIPTION="An icon taskbar for the Gnome Shell"
HOMEPAGE="https://github.com/home-sweet-gnome/dash-to-panel"
SRC_URI="https://github.com/home-sweet-gnome/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/glib:2
	dev-util/intltool
	gnome-base/gnome-common
"
RDEPEND="
	gnome-base/gnome-shell
"

src_install() {
	emake INSTALLBASE="${D}/usr/share/gnome-shell/extensions" VERSION=${PV} install

	insinto "/usr/share/glib-2.0/schemas/"
		doins "schemas/org.gnome.shell.extensions.dash-to-panel.gschema.xml"

	dodoc README.md
}

pkg_postinst() {
	gnome2_schemas_update

	elog "You may have to relogin to see the extension. "
}
