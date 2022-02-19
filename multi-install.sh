#!/bin/bash
if [[ ! -d "/data/data/com.termux/files/usr/bin" ]]
then
    echo "This script will not work properly if Termux is installed as a system app."
    echo "Reinstall Termux as a user app then try again."
    exit
else
    echo
fi

echo "youtube-dl installer for Termux-Android"
echo
echo "Select an option:"
echo "1: Install youtube-dl"
echo "2: Uninstall youtube-dl"
echo "Any other key: quit"
echo
echo -n "Select any option and hit ENTER: "
read x

if [[ $x -eq 1 ]] 
then
    echo 
    echo "The following processes are about to occur:"
    echo "Install/Update dependency: Python (via apt)"
    echo "youtube-dl is downloaded and installed to /data/data/com.termux/files/usr/bin"
    echo "youtube-dl is made executable"
    echo
    echo -n 'To continue, enter "y". To abort, press any other key: '
    read y
    if [[ $y == "y" ]] 
    then
        echo "Installing/updating Python (using apt)"
        apt -y install python
        echo "Installing youtube-dl to /data/data/com.termux/files/usr/bin/youtube-dl (using curl)"
        curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /data/data/com.termux/files/usr/bin/youtube-dl
        echo "Making youtube-dl executable (using chmod)"
        chmod a+rx /data/data/com.termux/files/usr/bin/youtube-dl
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
    echo "youtube-dl is removed from /data/data/com.termux/files/usr/bin"
    echo
    echo -n 'To continue, enter "y". To abort, press any other key: '
    read y
    if [[ $y == "y" ]] 
    then
        echo "Removing youtube-dl (using rm)"
        rm -rf /data/data/com.termux/files/usr/bin/youtube-dl
        echo "Removal complete."
        echo 'Python is still installed. If you need to remove Python, please do so by running "apt remove python".'
        exit
    else
        echo "Removal aborted"
        exit
    fi
else
    exit
fi
