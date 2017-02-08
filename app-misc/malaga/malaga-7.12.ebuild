# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit flag-o-matic elisp-common

DESCRIPTION="A Grammar Development Environment for Natural Languages"
HOMEPAGE="http://home.arcor.de/bjoern-beutel/malaga/"
SRC_URI="http://ftp.funet.fi/pub/mirrors/ftp.debian.org/debian/pool/main/m/malaga/malaga_7.12.orig.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="readline malshow emacs"

DEPEND="dev-libs/glib:2
readline? ( sys-libs/readline )
malshow? ( x11-libs/gtk+:2 )
emacs? ( virtual/emacs )"
RDEPEND="${DEPEND}"

SITEFILE="60${PN}-gentoo.el"

src_configure() {
	append-ldflags -lm
	econf \
		$(use_with readline ) \
		$(use_enable malshow)
}

src_install() {
	default
	if use emacs; then
		elisp-install ${PN} malaga.el
		elisp-site-file-install "${FILESDIR}"/${SITEFILE}
	fi
}
