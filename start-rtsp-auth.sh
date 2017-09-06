#!/bin/sh

# Kill VLC
ps ax | grep -i vlc | awk '{print $1}' | xargs kill -9
rm nohup.out

# Stream webcam 1
nohup /usr/bin/cvlc -vvv v4l2:///dev/video0 --sout-rtsp-user="username" --sout-rtsp-pwd="password" --sout="#transcode{vcodec=h264,venc=x264{no-cabac,level=12,vbv-maxrate=384,vbv-bufsize=1000,keyint=75,ref=3,bframes=0},vb=384,scale=1,width=640,height=480,acodec=none}:rtp{sdp=rtsp://:15151/0.sdp}" & 

# Stream webcam 2 
nohup /usr/bin/cvlc -vvv v4l2:///dev/video1 --sout-rtsp-user="username" --sout-rtsp-pwd="password" --sout="#transcode{vcodec=h264,venc=x264{no-cabac,level=12,vbv-maxrate=384,vbv-bufsize=1000,keyint=75,ref=3,bframes=0},vb=384,scale=1,width=640,height=480,acodec=none}:rtp{sdp=rtsp://:25252/0.sdp}" & 

# Tail nohup
# tail -f nohup.out

# Exit
exit
