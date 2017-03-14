# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{3,4,5,6}} )

inherit eutils python-r1

DESCRIPTION="Libvoikko provides spell checking, hyphenation, grammar checking and morphological analysis for Finnish language."
HOMEPAGE="http://voikko.puimula.org/"
SRC_URI="http://www.puimula.org/voikko-sources/${PN}/${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="expvfst hfst malaga"

DEPEND="
	hfst? ( dev-util/hfstospell ) 
	malaga? ( dev-libs/suomi-malaga )
"
RDEPEND="${DEPEND}"

src_configure() {

	local myconf_libvoikko=""

		myconf_libvoikko+="--prefix=/usr"
		myconf_libvoikko+=" $(use_enable expvfst)"

		if ! use hfst ; then
			myconf_libvoikko+=" --disable-hfst" 
		fi

		myconf_libvoikko+=" $(use_enable malaga)"
		myconf_libvoikko+=" --with-dictionary-path=/usr/share/voikko"

	econf ${myconf_libvoikko}
}

src_install() { 
    python_setup
	emake DESTDIR="${D}" install

	pythonTmpPath=${D}/usr/$(get_libdir)/${EPYTHON}/site-packages/
	mkdir -p $pythonTmpPath
	cp ${S}/python/libvoikko.py $pythonTmpPath || die "copying libvoikko.py failed"

}

pkg_postinst() { 
	ewarn "If you intend to use libvoikko with LibreOffice, "
	ewarn "make sure your active python interpreter is set "
	ewarn "to be the same version as PYTHON_SINGLE_TARGET in "
	ewarn "your installed LibreOffice package. "
	ewarn " "
	ewarn "You can set your active Python interpreter with "
	ewarn "eselect python list" 
}
