# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PLOCALES="cs de en es fr gl hr_HR id it ja pl pt_BR pt ro ru@petr1708 ru sr sv tr_TR zh_CN"

inherit cmake-utils l10n

MY_PN="Yarock"
MY_PP=""
MY_P="${MY_PN}_${PV}${MY_PP}_source"
DESCRIPTION="Yarock is Qt4/Qt5 modern music player designed to provide an easy and pretty music collection browser based on cover art."
HOMEPAGE="http://qt-apps.org/content/show.php?content=129372"
SRC_URI="http://launchpad.net/yarock/1.x/${PV}/+download/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="phonon mpv +qt4 qt5 shortcut vlc"
IUSE+="${LANGS// / linguas_}"

DEPEND="
	qt4? (
		>=dev-qt/qtcore-4.7.0:4
		>=dev-qt/qtgui-4.7.0:4
		>=dev-qt/qtdbus-4.7.0:4
		>=dev-qt/qtsql-4.7.0:4[sqlite]
		dev-libs/qjson
	)
	qt5? (
		>=dev-qt/qtcore-5.3.2:5
		>=dev-qt/qtgui-5.3.2:5
		>=dev-qt/qtwidgets-5.3.2:5
		>=dev-qt/qtnetwork-5.3.2:5
		>=dev-qt/qtxml-5.3.2:5
		>=dev-qt/qtconcurrent-5.3.2:5
		>=dev-qt/qtdbus-5.3.2:5
		>=dev-qt/qtsql-5.3.2:5[sqlite]
		>=dev-qt/qtx11extras-5.3.2:5
		>=dev-qt/linguist-tools-5.3.2:5
	)
	media-libs/taglib
	net-libs/htmlcxx
	phonon? ( media-libs/phonon[qt4?,qt5?] )
	mpv? ( media-video/mpv[libmpv] )
	vlc? ( media-video/vlc[qt4?,qt5?] )
"

RDEPEND="${DEPEND}"

REQUIRED_USE="|| ( phonon mpv vlc )"

DOCS="CHANGES.md README.md"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# Translations
	remove_locale() {
		rm "translation/${PN}_${1}.ts" || die "Removing ${1} locale failed!"
	}
	l10n_find_plocales_changes 'translation' "${PN}_" '.ts'
	l10n_for_each_disabled_locale_do remove_locale
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable phonon)
		$(cmake-utils_use_enable mpv)
		$(cmake-utils_use_enable vlc)
		$(cmake-utils_use_enable qt5)
		$(cmake-utils_use_enable shortcut)
	)
	cmake-utils_src_configure
}
