# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4..6} )

inherit distutils-r1

DESCRIPTION="Create thumbnail sheets from video files"
HOMEPAGE="https://github.com/amietn/vcsi"
SRC_URI="https://github.com/amietn/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/jinja-2[${PYTHON_USEDEP}] 
	>=dev-python/numpy-1.9.2[${PYTHON_USEDEP}] 
	>=dev-python/pillow-2.8.1[${PYTHON_USEDEP}] 
	>=dev-python/texttable-0.8.8[${PYTHON_USEDEP}] 
	media-fonts/dejavu 
	media-video/ffmpeg
"
RDEPEND="${DEPEND}"

python_compile() { 
	distutils-r1_python_compile
}

python_install() { 
	distutils-r1_python_install --optimize=1
}
