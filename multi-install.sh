#!/bin/bash
if [[ ! -d "/data/data/com.termux/files/usr/bin" ]]
then
    echo "This script will not work properly if Termux is installed as a system app."
    echo "Reinstall Termux as a user app then try again."
    exit
else
    echo
fi

echo "yt-dlp installer for Termux-Android"
echo
echo "Select an option:"
echo "1: Install yt-dlp"
echo "2: Uninstall yt-dlp"
echo "Any other key: quit"
echo
echo -n "Select any option and hit ENTER: "
read x

if [[ $x -eq 1 ]] 
then
    echo 
    echo "The following processes are about to occur:"
    echo "Install/Update dependency: Python (via apt)"
    echo "Install/Update dependency: ffmpeg (via apt)"
    echo "yt-dlp is downloaded and installed to /data/data/com.termux/files/usr/bin"
    echo "yt-dlp is made executable"
    echo
    echo -n 'To continue, enter "y". To abort, press any other key: '
    read y
    if [[ $y == "y" ]] 
    then
        echo "Installing/updating dependencies (using apt)"
        apt -y install python ffmpeg
        echo "Installing yt-dlp to /data/data/com.termux/files/usr/bin/yt-dlp (using curl)"
        curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /data/data/com.termux/files/usr/bin/yt-dlp
        echo "Making yt-dlp executable (using chmod)"
        chmod a+rx /data/data/com.termux/files/usr/bin/yt-dlp
        echo "Install complete."
        exit
    else 
        echo "Installation aborted"
        exit
    fi
elif [[ $x -eq 2 ]] 
then
    echo 
    echo "The following processes are about to occur:"
    echo "yt-dlp is removed from /data/data/com.termux/files/usr/bin"
    echo
    echo -n 'To continue, enter "y". To abort, press any other key: '
    read y
    if [[ $y == "y" ]] 
    then
        echo "Removing yt-dlp (using rm)"
        rm -rf /data/data/com.termux/files/usr/bin/yt-dlp
        echo "Removal complete."
        echo 'Dependencies may still be installed, please remove them manually.'
        exit
    else
        echo "Removal aborted"
        exit
    fi
else
    exit
fi
