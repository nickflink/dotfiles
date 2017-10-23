#!/bin/bash
sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`
sudo kextunload /System/Library/Extensions/AppleHDA.kext
sudo kextload /System/Library/Extensions/AppleHDA.kext
