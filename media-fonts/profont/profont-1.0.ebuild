# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit font

DESCRIPTION="ProFont is a monospaced font created to be a most readable font for programming."
HOMEPAGE="http://tobiasjung.name/profont/"
SRC_URI="http://tobiasjung.name/downloadfile.php?file=profont-x11.zip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/profont-x11"
FONT_SUFFIX="pcf"

