# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python3_5 )

inherit distutils-r1

DESCRIPTION="Create thumbnail sheets from video files"
HOMEPAGE="https://github.com/amietn/vcsi"
SRC_URI="https://github.com/amietn/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/pillow-2.8.1 
		>=dev-python/jinja-2 
		>=dev-python/numpy-1.9.2 
		media-video/ffmpeg 
		media-fonts/dejavu"
RDEPEND="${DEPEND}"

python_compile() { 
	distutils-r1_python_compile
}

python_install() { 
	distutils-r1_python_install --optimize=1
}
