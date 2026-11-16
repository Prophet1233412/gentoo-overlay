# Publishing from an authorized terminal

The owner has now created the public repository and the initial overlay is pushed.
The following steps describe recovery or publishing another checkout.


The connected integration could read the account identity but could not create a repository.
Create an empty PUBLIC repository named gentoo-overlay under Prophet1233412 in GitHub,
and grant the GitHub app access to this repository (including workflow file writes).
Do not initialize it with a README if pushing this prepared tree as its first commit.
Do not send passwords or tokens in chat; use GitHub's browser authentication flow.

From the prepared checkout after reviewing the files:

```sh
git remote add origin https://github.com/Prophet1233412/gentoo-overlay.git
git push -u origin main
```

If the repository already has commits, fetch and review them, then use a new branch/PR.
Never force-push over existing work. Run both workflows and inspect the ARM64 logs.
Even successful staging does not authorize a live VPN migration; follow migration.md.
