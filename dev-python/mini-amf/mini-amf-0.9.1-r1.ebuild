# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5..7} )
inherit distutils-r1

DESCRIPTION="Minimal AMF encoder and decoder for Python "
HOMEPAGE="https://pypi.python.org/pypi/Mini-AMF"
SRC_URI="https://github.com/zackw/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"

RESTRICT="test"

python_test() {
	cd tests/ || die
	"${EPYTHON}" -m unittest discover -v || die
}

python_compile_all() {
	use doc && emake -C docs html
	distutils-r1_python_compile
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	einstalldocs

	distutils-r1_python_install_all
}
