#!/bin/sh

/usr/bin/cvlc -vvv -I dummy --file-caching 1000 --live-caching 1000 --network-caching 1000 --video-filter=motiondetect --sout="#file{dst=./o.mpg}" rtsp://IP:15151/0.sdp
