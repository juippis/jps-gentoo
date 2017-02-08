# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

#PYTHON_COMPAT=( python2_7 python3_4 )

inherit python-utils-r1

DESCRIPTION=""
HOMEPAGE="https://smoothgesturesplus.com/"
SRC_URI="http://roskakori.org/c/distfiles/${P}-jps.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="google-chrome +chromium"

REQUIRED_USE="
	?? ( google-chrome chromium )
"

DEPEND="dev-lang/python
		|| ( www-client/google-chrome www-client/chromium )"
RDEPEND="${DEPEND}"

src_install() { 
	# prepare directories
#	mkdir -p ${D}/opt/smoothgesturesplus-extras/
#	mkdir -p ${D}/etc/chromium/native-messaging-hosts/

	# make this script use python2
#	sed -i 's|/usr/bin/python|/usr/bin/python2|g' ${S}/src/sgplus-extras.py

#	cp ${S}/src/sgplus-extras.py ${D}/opt/smoothgesturesplus-extras/
#	cp -r ${S}/src/lib/ ${D}/opt/smoothgesturesplus-extras/

#	cp ${DISTDIR}/smg_manifest.json ${D}/etc/chromium/native-messaging-hosts/com.smoothgesturesplus.extras.json

#	chmod o+r -R ${D}/opt/smoothgesturesplus-extras/
#	chmod o+r ${D}/etc/chromium/native-messaging-hosts/com.smoothgesturesplus.extras.json

	# prepare and install default stuff
	mkdir -p ${D}/opt/smoothgesturesplus-extras/

	# make this script use python2
    sed -i 's|/usr/bin/python|/usr/bin/python2|g' ${S}/src/sgplus-extras.py

	cp ${S}/src/sgplus-extras.py ${D}/opt/smoothgesturesplus-extras/
	cp -r ${S}/src/lib/ ${D}/opt/smoothgesturesplus-extras/

	chmod o+r -R ${D}/opt/smoothgesturesplus-extras/

	# check whether user has google-chrome or chromium(-based) browser
	# https://developer.chrome.com/extensions/nativeMessaging
	if use google-chrome ; then
		mkdir -p ${D}/etc/opt/chrome/native-messaging-hosts/
		cp ${S}/com.smoothgesturesplus.extras.json ${D}/etc/opt/chrome/native-messaging-hosts/
		chmod o+r ${D}/etc/opt/chrome/native-messaging-hosts/com.smoothgesturesplus.extras.json
	fi
	
	if use chromium ; then 
		mkdir -p ${D}/etc/chromium/native-messaging-hosts/
		cp ${S}/com.smoothgesturesplus.extras.json ${D}/etc/chromium/native-messaging-hosts/
		chmod o+r ${D}/etc/chromium/native-messaging-hosts/com.smoothgesturesplus.extras.json
	fi 

}
