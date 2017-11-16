# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)"
HOMEPAGE="http://numixproject.org/"
SRC_URI="https://github.com/numixproject/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/glib:2
	dev-libs/libxml2
	dev-ruby/sass:*
	x11-libs/gdk-pixbuf:2
	x11-themes/gtk-engines-murrine
"

RDEPEND="${DEPEND}"

src_compile() {
	emake DESTDIR="${D}" || die "Compiling ${PN} failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "Installing ${PN} failed."
}
