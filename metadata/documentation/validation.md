# Validation status (2026-11-16)

Confirmed:
- GitHub identity Prophet1233412, both connector and cloud gh authentication.
- gentoo-overlay returned 404 and accessible repository list was empty.
- Creating the requested public repository failed: Resource not accessible by integration (createRepository).
- Official ARM64 GUI 2.0.1 DEB and service 2.0.2 GNU tarball downloaded.
- Both SHA256 hashes matched release API digests; Manifest BLAKE2B and SHA512 calculated from downloaded bytes.
- Inspected package contents, ELF NEEDED entries, glibc versions and service CLI source at upstream v2.0.2.
- bash -n passed for both ebuilds, XML and YAML parsed successfully.
- Update checker ran: GUI latest 2.0.1; service latest 2.0.3.

Not passed:
- Portage phases: emerge-webrsync failed refreshing signature keys (No keyserver available).
  No signature checks were bypassed. A subsequent Docker image copy exhausted cloud disk.
  Created test images/container were removed to recover space.
- No native ARM64 ebuild CI has run. Workflow is a prepared definition, not a successful run.
- No GUI, service, network, SwayFX or Asahi integration tests have run.
- Bundled core license/dependency audit is still required before unmasking.

The terminal is cloud Debian x86_64, not the Gentoo laptop. No laptop /opt files,
OpenRC services, runlevels, VPN profiles, routes or DNS were modified.

Static pkgcheck scan against Gentoo master from the public GitHub source archive passed
with no package findings after fixing remote IDs and relative symlinks. The Debian
host has Bash 5.2, so pkgcore disabled EAPI 9; these packages both use EAPI 8.
This source-tree scan does not replace signed Portage sync or ARM64 staging.
