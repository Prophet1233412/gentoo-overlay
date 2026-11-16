#!/usr/bin/env python3
import json, os, urllib.request
packages = [("libnyanpasu/clash-nyanpasu", "2.0.1"), ("libnyanpasu/nyanpasu-runtime", "2.0.2")]
lines = ["# Upstream release check"]
for repo, current in packages:
    req = urllib.request.Request(f"https://api.github.com/repos/{repo}/releases/latest", headers={"Accept": "application/vnd.github+json"})
    if os.environ.get("GH_TOKEN"):
        req.add_header("Authorization", "Bearer " + os.environ["GH_TOKEN"])
    with urllib.request.urlopen(req, timeout=30) as response:
        release = json.load(response)
    latest = release["tag_name"].removeprefix("v")
    lines.append(f"- {repo}: packaged {current}, latest {latest}; " + ("current" if current == latest else "review required"))
text = "\n".join(lines) + "\n"
print(text)
if os.environ.get("GITHUB_STEP_SUMMARY"):
    with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as summary:
        summary.write(text)
