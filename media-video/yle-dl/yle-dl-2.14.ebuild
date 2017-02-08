# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# http://www.kosunen.fi/gentoo/portage/media-video/rtmpdump-yle/rtmpdump-yle-1.3.0.ebuild
# retrieved on 2011-11-26, and updated for 1.4.5 by teknohog

EAPI=4
PYTHON_DEPEND="2"

inherit python

DESCRIPTION="Download media files from Yle Areena"
HOMEPAGE="http://aajanki.github.io/yle-dl/"
SRC_URI="https://github.com/aajanki/yle-dl/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"

IUSE="php +youtube-dl"

REQUIRED_USE="
	|| ( php youtube-dl )
"

DEPEND="dev-python/pycrypto
	media-video/rtmpdump
	!media-video/rtmpdump-yle
	net-misc/youtube-dl
	php? ( 
		dev-lang/php[bcmath,curl,mcrypt,simplexml]
	)"

RDEPEND="${DEPEND}"

S=${WORKDIR}/aajanki-${PN}-440ecb2

src_prepare() {
	sed -i 's|/usr/local/share/yle-dl/AdobeHDS.php|/usr/bin/AdobeHDS.php|g' yle-dl	
}

src_compile() {
	if [ -f Makefile ]; then
		emake -j1 prefix="${DESTTREE}" || die "emake failed"
	fi
}

src_install() {
	einstall
	dobin ${S}/AdobeHDS.php
}

pkg_setup() {
	python_set_active_version 2
}

pkg_postinst() { 
	if use !php ; then 
		ewarn "It appears you have disabled the PHP USE flag. "
		ewarn "You might want to add alias for yle-dl to use " 
		ewarn "youtube-dl as backend ( --backend youtubedl )."
	fi
}
