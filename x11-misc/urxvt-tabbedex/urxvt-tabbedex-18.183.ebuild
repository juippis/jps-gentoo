# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="An extended version of rxvt-unicode's tabbed perl extension"
HOMEPAGE="https://github.com/mina86/urxvt-tabbedex"

MY_PN=${PN/urxvt-/}
SRC_URI="https://github.com/mina86/urxvt-tabbedex/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-terms/rxvt-unicode-9.21[perl]"

src_compile() { :; }

src_install() {
	insinto /usr/$(get_libdir)/urxvt/perl
	doins ${MY_PN}
}

pkg_postinst() {
	elog "Note that the syntax for tabbedex's functions has changed, "
	elog "check commit 7b704677f594d994908b0f5f96d9c1135c937159 from "
	elog "https://github.com/mina86/urxvt-tabbedex to learn new syntax."
}
