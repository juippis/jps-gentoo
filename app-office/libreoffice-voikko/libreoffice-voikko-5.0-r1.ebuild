# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Free Finnish spell checking and hyphenation for LibreOffice"
HOMEPAGE="https://voikko.puimula.org/"
SRC_URI="https://www.puimula.org/voikko-sources/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-office/libreoffice[odk]
	>=dev-libs/voikko-fi-2.0
"
RDEPEND="
	${DEPEND}
	dev-libs/libvoikko
"

src_compile() {
	emake oxt || die "make failed"
}

src_install() {
	einstalldocs

	emake DESTDIR="${D}/usr/$(get_libdir)/${P}" install-unpacked

	insinto /usr/$(get_libdir)/libreoffice/share/extension/install/
	doins build/voikko.oxt
}

pkg_postinst() {
	# Register voikko with libreoffice
	COMPONENT="${ROOT}/usr/$(get_libdir)/libreoffice/share/extension/install/voikko.oxt"

	einfo "Trying to register ${COMPONENT}..."
	unopkg add --shared "${COMPONENT}" || die "unopkg failed."
}

pkg_prerm() {
	# Remove voikko registration from libreoffice
	unopkg remove --shared org.puimula.ooovoikko || die "unopkg failed."
}
