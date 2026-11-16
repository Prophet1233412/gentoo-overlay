# Migration gate

Both packages are masked. CI may unpack/install into a disposable image only.
Do not run emerge on the live laptop until ARM64 CI passes and these steps are reviewed.

1. Record the existing /opt executable paths, versions, hashes, running service arguments,
   OpenRC script and runlevel links; record config/data directory ownership and socket paths.
   Do not share VPN subscriptions, credentials, full environment or config contents.
2. Back up the existing binaries, init script and config/data to a private timestamped directory.
   Confirm enough space and a working offline restore method. Keep the old binaries intact.
3. Build binary packages with emerge --buildpkgonly in an isolated ARM64 Gentoo environment.
   Check QA, ELF dependencies, all bundled core architectures and GUI startup on SwayFX/Asahi.
   CI staging cannot establish GPU/WebKit functionality or GUI/service protocol compatibility.
4. Review /usr/sbin/nyanpasu-service for any existing unmanaged binary before merging.
   Review exact config/data/app paths and IPC permissions against the running installation.
   The OpenRC file is an intentionally blocked example, not an activated service.
5. Schedule a manual cutover with network access recoverable independently of this VPN.
   Never run old and new services concurrently. Stop old only at this explicit cutover.
6. On failure stop new, restore backed-up config/data, restore old init script and runlevel
   links, start old and verify routing/DNS. Do not delete /opt or backups after initial success.

Do not invoke the GUI/service self-updater or install/uninstall commands: these can bypass
Portage and install systemd definitions. No package hooks modify OpenRC or runlevels.
A future binhost needs signed packages, an ARM64 baseline compatible with Asahi, and retention
of previous package versions. No binhost is configured or published here.
