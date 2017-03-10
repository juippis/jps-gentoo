# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit python-single-r1

DESCRIPTION="Download media files from Yle Areena"
HOMEPAGE="http://aajanki.github.io/yle-dl/"
SRC_URI="https://github.com/aajanki/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"

IUSE="php +youtube-dl"

REQUIRED_USE="
	|| ( php youtube-dl )
"

DEPEND="
	dev-python/pycrypto
	php? ( 
		dev-lang/php[bcmath,curl,crypt,simplexml] 
		media-video/rtmpdump
	)
	youtube-dl? ( net-misc/youtube-dl[python_targets_python2_7] )
"

RDEPEND="${DEPEND}"

# S=${WORKDIR}/aajanki-${PN}-440ecb2

src_prepare() {
	python_fix_shebang .

	sed -i 's|/usr/local|/usr|g' Makefile

	if use !php ; then
		sed -i '/$(DATADIR)/d' Makefile
	
	else
		sed -i 's|/usr/local/share/yle-dl/AdobeHDS.php|/usr/bin/AdobeHDS.php|g' yle-dl
	fi

	default
}

src_install() {
	emake DESTDIR="${D}" install 
	
	DOCS="COPYING ChangeLog README.fi README.md"
	einstalldocs
}

# fixed in yle-dl, if AdobeHDS.php file isnt found it uses youtube-dl as a default backend. 
# Needs testing
# pkg_postinst() { 
# 	if use !php ; then 
#		ewarn "It appears you have disabled the PHP USE flag. "
#		ewarn "You might want to add an alias for yle-dl to use " 
#		ewarn "youtube-dl as backend ( --backend youtubedl )."
#	fi
# }
