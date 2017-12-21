# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Download media files from Yle Areena"
HOMEPAGE="http://aajanki.github.io/yle-dl/"
SRC_URI="https://github.com/aajanki/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="libav php youtube-dl"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

RDEPEND="
	${DEPEND}
	( !youtube-dl? ( !php? ( net-misc/wget ) ) )
	!libav? ( media-video/ffmpeg )
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pycrypto[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	php? (
		dev-lang/php[bcmath,cli,curl,crypt,simplexml]
		media-video/rtmpdump
	)
	python_targets_python2_7? ( dev-python/pyamf[python_targets_python2_7] )
	python_targets_python3_5? ( dev-python/py3amf[python_targets_python3_5] )
	python_targets_python3_6? ( dev-python/py3amf[python_targets_python3_6] )
	youtube-dl? ( net-misc/youtube-dl[${PYTHON_USEDEP}] )
"

python_prepare() {
	default

	distutils-r1_python_prepare_all
}

python_compile() {
	distutils-r1_python_compile
}

python_install_all() {
	DOCS="COPYING ChangeLog README.fi README.md"
	einstalldocs

	distutils-r1_python_install_all
}
