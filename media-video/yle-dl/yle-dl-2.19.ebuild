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
	dev-python/pycrypto[${PYTHON_USEDEP}]
	media-video/ffmpeg
	php? ( 
		dev-lang/php[bcmath,curl,crypt,simplexml] 
		media-video/rtmpdump
	)
	youtube-dl? ( net-misc/youtube-dl[python_targets_python2_7] )
"

RDEPEND="${DEPEND}"

src_prepare() {
	python_fix_shebang .

	sed -i 's|/usr/local|/usr|g' Makefile

	if use !php ; then
		cat <<- EOF > "${T}"/yle-dl 
				#!/bin/bash
				python2 /usr/share/yle-dl/yle-dl.py --backend youtubedl "\$@"
			EOF
	
	else
		sed -i 's|/usr/local/share/yle-dl/AdobeHDS.php|/usr/share/yle-dl/AdobeHDS.php|g' yle-dl
	fi

	default
}

src_install() {
	if use !php ; then 
		exeinto /usr/share/yle-dl
			newexe yle-dl yle-dl.py 

		exeinto /usr/bin
			doexe "${T}"/yle-dl

	else 
		emake DESTDIR="${D}" install 

	fi
	
	DOCS="COPYING ChangeLog README.fi README.md"
	einstalldocs
}
