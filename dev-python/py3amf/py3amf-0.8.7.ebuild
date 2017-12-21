# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5..6} )
inherit distutils-r1

MY_PN="Py3AMF"

DESCRIPTION="A fork of PyAMF to support Python3"
HOMEPAGE="https://github.com/StdCarrot/Py3AMF"
SRC_URI="https://github.com/StdCarrot/${MY_PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	${DEPEND}
	dev-python/defusedxml[${PYTHON_USEDEP}]
"

S=${WORKDIR}/${MY_PN}-${PV}

python_prepare() {
	default

	distutils-r1_python_prepare_all
}

python_compile() {
	distutils-r1_python_compile
}

python_install_all() {
	DOCS="CHANGES.txt README.md"
	einstalldocs

	distutils-r1_python_install_all
}
