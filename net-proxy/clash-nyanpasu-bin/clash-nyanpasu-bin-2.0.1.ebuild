# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg
DESCRIPTION="Clash Nyanpasu GUI with upstream bundled cores (prebuilt)"
HOMEPAGE="https://github.com/libnyanpasu/clash-nyanpasu"
SRC_URI="https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v${PV}/Clash.Nyanpasu_${PV}_arm64.deb"
S="${WORKDIR}"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~arm64"
RESTRICT="strip mirror"
QA_PREBUILT="*"
BDEPEND="app-arch/xz-utils"
RDEPEND=">=sys-libs/glibc-2.39
	dev-libs/glib:2
	dev-libs/libayatana-appindicator
	net-libs/webkit-gtk:4.1
	net-libs/libsoup:3.0
	sys-devel/gcc
	sys-apps/dbus
	x11-libs/gtk+:3
	x11-libs/gdk-pixbuf:2
	x11-libs/cairo
	x11-libs/libxcb
	media-libs/fontconfig
	=net-proxy/nyanpasu-service-bin-2.0.2*"

src_unpack() {
	unpack_deb "${A}"
}

src_install() {
	# Preserve Tauri's bin/../lib layout without overwriting /opt installations.
	local dest=/opt/clash-nyanpasu-bin
	rm usr/bin/nyanpasu-service || die
	insinto "${dest}"
	doins -r usr
	local bin
	for bin in "${ED}${dest}/usr/bin/"*; do
		fperms 0755 "${dest}/usr/bin/${bin##*/}"
	done
	dosym -r /usr/sbin/nyanpasu-service "${dest}/usr/bin/nyanpasu-service"
	dosym -r "${dest}/usr/bin/Clash Nyanpasu" /usr/bin/clash-nyanpasu
	make_desktop_entry clash-nyanpasu "Clash Nyanpasu" clash-nyanpasu "Network;"
	newicon "usr/share/icons/hicolor/128x128/apps/Clash Nyanpasu.png" clash-nyanpasu.png
}

pkg_postinst() {
	xdg_pkg_postinst
	ewarn "Experimental package. No service has been started or enabled."
	ewarn "Do not use the GUI's service install/update controls with Portage."
}
