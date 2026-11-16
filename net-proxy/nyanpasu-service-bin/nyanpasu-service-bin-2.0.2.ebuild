# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Nyanpasu privileged service (upstream prebuilt)"
HOMEPAGE="https://github.com/libnyanpasu/nyanpasu-runtime"
SRC_URI="https://github.com/libnyanpasu/nyanpasu-runtime/releases/download/v${PV}/nyanpasu-service-aarch64-unknown-linux-gnu.tar.gz -> ${P}-arm64.tar.gz"
S="${WORKDIR}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"
RESTRICT="strip mirror"
QA_PREBUILT="usr/sbin/nyanpasu-service"
RDEPEND=">=sys-libs/glibc-2.30"

src_install() {
	dosbin nyanpasu-service
}

pkg_postinst() {
	ewarn "No init script is installed: review metadata/documentation/migration.md before activating."
	ewarn "Do not run service install/update: manage this binary with Portage."
}
