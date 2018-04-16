# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{5,6} )
inherit distutils-r1

DESCRIPTION="Minimal AMF encoder and decoder for Python "
HOMEPAGE="https://pypi.python.org/pypi/Mini-AMF"
SRC_URI="https://github.com/zackw/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="
	${PYTHON_DEPS}
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"

# make it work some day
python_test() {
	"${EPYTHON}" -m unittest discover -v tests || die
}

python_compile_all() {
	use doc && emake -C docs html

	distutils-r1_python_compile
}

python_install_all() {
	einstalldocs

	use doc && local HTML_DOCS=( docs/_build/html/. )

	distutils-r1_python_install_all
}
