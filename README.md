# prophet-overlay (experimental)

ARM64/glibc Gentoo overlay for Clash Nyanpasu GUI 2.0.1 and nyanpasu-service 2.0.2.
These `-bin` ebuilds repackage official release assets; they do not compile Rust/Tauri.
Both packages are masked pending isolated ARM64 verification and laptop migration review.
Bundled cores stay in /opt/clash-nyanpasu-bin, away from existing /opt paths and PATH.
The GUI's bundled service is replaced with the separately versioned service package.

After this repository exists at the configured GitHub URL, copy metadata/documentation/repos.conf to
/etc/portage/repos.conf/prophet-overlay.conf and run `emaint sync -r prophet-overlay`.
Read metadata/documentation/migration.md before unmasking or installing. The eventual package atoms are
`net-proxy/clash-nyanpasu-bin` and `net-proxy/nyanpasu-service-bin`.

CI stages packages in a disposable ARM64 Gentoo container, never starts a service,
and does not prove GUI operation on Asahi. Updates are reported in Actions summaries;
new releases do not automatically change ebuilds or install anything.
