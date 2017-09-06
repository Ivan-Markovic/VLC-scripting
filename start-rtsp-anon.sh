#!/bin/sh

# Kill VLC
ps ax | grep -i vlc | awk '{print $1}' | xargs kill -9
rm nohup.out

# Stream webcam 1
nohup /usr/bin/cvlc -vvv v4l2:///dev/video0 --sout="#transcode{vcodec=mp4v,fps=25,scale=1,width=640,height=480,acodec=none,soverlay,sfilter=marq{marquee='%H:%M:%S',size=24}}:rtp{sdp=rtsp://:15151/0.sdp}" & 

# Stream webcam 2 
nohup /usr/bin/cvlc -vvv v4l2:///dev/video1 --sout="#transcode{vcodec=mp4v,fps=25,scale=1,width=640,height=480,acodec=none,soverlay,sfilter=marq{marquee='%H:%M:%S',size=24}}:rtp{sdp=rtsp://:25252/0.sdp}" & 

# Tail nohup
# tail -f nohup.out

# Exit
exit
