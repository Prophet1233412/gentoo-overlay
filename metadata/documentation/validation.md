# Validation status (2026-11-16)

## Confirmed

- Published to public Prophet1233412/gentoo-overlay after the owner created the repository.
- GitHub write access confirmed by pushing the overlay and a CI correction.
- Official ARM64 GUI 2.0.1 DEB and service 2.0.2 GNU tarball downloaded.
- SHA256 matched release API digests; Manifest BLAKE2B and SHA512 calculated from downloaded bytes.
- Inspected package contents, ELF NEEDED entries, glibc versions and service CLI source at upstream v2.0.2.
- bash syntax, XML and YAML checks passed.
- Static pkgcheck scan against Gentoo master passed with no package findings.
  The Debian host has Bash 5.2, so pkgcore disabled EAPI 9; both ebuilds use EAPI 8.
- GitHub update-check workflow passed: GUI latest 2.0.1; service latest 2.0.3.
- Native ARM64 runner successfully verified the Gentoo snapshot OpenPGP signature.
  The first staging run then found the wrong pkgcheck category; corrected to dev-util/pkgcheck.

## Remaining gates

- No GUI, service, network, SwayFX or Asahi integration tests have run.
- Bundled core license/dependency audit is required before unmasking.
- Both packages remain masked pending the migration gate.
- No binhost is configured or published.

The terminal is cloud Debian x86_64, not the Gentoo laptop. No laptop /opt files,
OpenRC services, runlevels, VPN profiles, routes or DNS were modified.

ARM64 staging run is in progress; no successful staging result is claimed:
https://github.com/Prophet1233412/gentoo-overlay/actions/runs/43832421608
