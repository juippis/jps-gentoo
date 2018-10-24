# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{4..6} )

inherit distutils-r1

MY_PV="2c4869ebc48012531689830351159da7b3f104b5"

DESCRIPTION="Command-line torrent search program (cross-platform)"
HOMEPAGE="https://kryptxy.github.io/torrench/"
SRC_URI="https://github.com/kryptxy/torrench/archive/${MY_PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	${PYTHON_DEPS}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	${DEPEND}
	dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pyperclip[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
"

S="${WORKDIR}"/"${PN}"-${MY_PV}

src_prepare() {
	default

	# fix installing to wrong path issue, 
	sed -i "s|join(CONFIG_DIR|join('/usr/share'|g" setup.py || die
}

python_install() {
	insinto /usr/share/${PN}/
		newins "${FILESDIR}/config.ini.example" config.ini

	distutils-r1_python_install --optimize=1
}

pkg_postinst() {
	elog "Fetching torrents from TPB/KAT/Nyaa is disabled by default."
	elog "Please read docs for configuration instructions."
	elog ""
	elog "https://github.com/kryptxy/torrench"
	elog ""
	elog "Example config.ini installed into /usr/share/${PN}/config.ini"
	elog ""
	elog "Example torrench.ini config file installed into /usr/share/${PN}/torrench.ini"
}
