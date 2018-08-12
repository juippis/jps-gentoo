# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 python3_{5..6} )

inherit distutils-r1

DESCRIPTION="Download media files from Yle Areena"
HOMEPAGE="http://aajanki.github.io/yle-dl/"
SRC_URI="https://github.com/aajanki/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="libav php socks5 test youtube-dl"

DEPEND="
	${PYTHON_DEPS}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/pytest-runner )
"

RDEPEND="
	${DEPEND}
	( !youtube-dl? ( !php? ( net-misc/wget ) ) )
	!libav? ( media-video/ffmpeg )
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/mini-amf[${PYTHON_USEDEP}]
	dev-python/progress[${PYTHON_USEDEP}]
	dev-python/pycryptodomex[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	php? (
		dev-lang/php[bcmath,cli,curl,simplexml]
		>=dev-libs/openssl-1.0.2:0=
		media-video/rtmpdump
	)
	socks5? ( dev-python/PySocks[${PYTHON_USEDEP}] )
	youtube-dl? ( net-misc/youtube-dl[${PYTHON_USEDEP}] )
"

python_test() {
	esetup.py test
}
