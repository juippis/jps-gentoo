# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
KEYWORDS="-* ~amd64 ~ppc ~ppc64 ~x86"

HOMEPAGE="
	https://pfactum.github.io/pf-kernel/
	https://dev.gentoo.org/~mpagano/genpatches/
"

IUSE=""

# No 'experimental' USE flag provided, but we still want to use genpatches
K_EXP_GENPATCHES_NOUSE="1"

# Revbumping this usually collides with patches already included in 
# pf-sources
K_GENPATCHES_VER="1"

K_NOSETEXTRAVERSION="don't_set_it"

# Not supported by the Gentoo crew
K_SECURITY_UNSUPPORTED="1"

K_USEPV="yes"

# We want the very basic patches from gentoo-sources, experimental patch
# is already included in pf-sources
K_WANT_GENPATCHES="base extras"

UNIPATCH_STRICTORDER="yes"

inherit kernel-2
detect_version

DESCRIPTION="Desktop-oriented Linux kernel fork that incorporates PDS CPU scheduler, graysky's GCC patch, UKSM, BFQ fixes, blk-mq performance patches and Gentoo's basic genpatches"

PF_URI="https://github.com/pfactum/pf-kernel/compare/v${PV/_p*/}...v${PV/_p*/}-pf${PV/*_p/}.diff -> ${P}.patch"
SRC_URI="
	${KERNEL_URI}
	${PF_URI}
	https://dev.gentoo.org/~mpagano/genpatches/tarballs/genpatches-${PV/_p*/}-${K_GENPATCHES_VER}.base.tar.xz
	https://dev.gentoo.org/~mpagano/genpatches/tarballs/genpatches-${PV/_p*/}-${K_GENPATCHES_VER}.extras.tar.xz
"

KV_FULL="${PVR}-pf"
S="${WORKDIR}/linux-${KV_FULL}"

pkg_pretend() {
	# https://bugs.gentoo.org/show_bug.cgi?id=547868
	if [[ $(gcc-version) < 4.9 ]]; then
			eerror ""
			eerror "${P} needs an active GCC 4.9+ compiler"
			eerror ""
			die "${P} needs an active sys-devel/gcc >= 4.9"
	fi
}

pkg_setup(){
	ewarn
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the pf developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla."
	ewarn
	kernel-2_pkg_setup
}

src_prepare(){
	eapply "${DISTDIR}/${P}.patch" || die "Applying ${P}.patch failed."

	# allow user to apply any additional patches without modifing ebuild
	eapply_user

	kernel-2_src_prepare
}

src_install() {
	kernel-2_src_install
}

pkg_postinst() {
	kernel-2_pkg_postinst
}

K_EXTRAEINFO="For more info on pf-sources and details on how to report problems,
see: ${HOMEPAGE}."
