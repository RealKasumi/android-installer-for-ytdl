# An Android installer for yt-dl in Termux.

Termux doesn't have youtube-dl or yt-dlp in its package manager. As a result it has to be installed manually.

This script automates the installation of it. It also allows the installation of the daily builds as a separate executable (nyt-dlp).

To install/uninstall

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/RealKasumi/android-installer-for-ytdl/main/multi-install.sh)"```
