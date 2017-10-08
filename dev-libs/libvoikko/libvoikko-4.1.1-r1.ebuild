# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4..6}} )

inherit eutils python-r1 python-utils-r1

DESCRIPTION="Spell checking, hyphenation and morphological analysis tool for Finnish language"
HOMEPAGE="http://voikko.puimula.org/"
SRC_URI="http://www.puimula.org/voikko-sources/${PN}/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="expvfst hfst"

DEPEND="
	hfst? ( dev-util/hfstospell )
"
RDEPEND="${DEPEND}"

src_configure() {

	local myconf_libvoikko=""

		myconf_libvoikko+="--prefix=/usr"
		myconf_libvoikko+=" $(use_enable expvfst)"

		if ! use hfst ; then
			myconf_libvoikko+=" --disable-hfst" 
		fi

		myconf_libvoikko+=" --with-dictionary-path=/usr/share/voikko"

	econf ${myconf_libvoikko}
}

src_install() { 
    python_setup
	emake DESTDIR="${D}" install

	python_foreach_impl python_domodule python/libvoikko.py

}
