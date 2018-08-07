# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{4..7}} )

inherit python-r1

DESCRIPTION="Spell checking, hyphenation and morphological analysis tool for Finnish language"
HOMEPAGE="https://voikko.puimula.org/"
SRC_URI="https://www.puimula.org/voikko-sources/${PN}/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="expvfst hfst"

DEPEND="
	${PYTHON_DEPS}
	hfst? ( dev-util/hfstospell )
"
RDEPEND="${DEPEND}"

src_configure() {
	local myconf=(
		--prefix=/usr
		--with-dictionary-path=/usr/share/voikko
		$(use_enable expvfst)
	)

	if ! use hfst ; then
		myconf+=( --disable-hfst )
	fi

	econf "${myconf[@]}"
}

src_install() {
	python_setup
	emake DESTDIR="${D}" install

	python_foreach_impl python_domodule python/libvoikko.py
}
