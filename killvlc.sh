#!/bin/sh
ps ax | grep -i vlc | awk '{print $1}' | xargs kill -9
