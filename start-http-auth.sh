#!/bin/sh

# Stream webcam
nohup /usr/bin/cvlc -v v4l2:///dev/video0 --sout-http-user="username" --sout-http-pwd="password" --network-caching=1500 --http-host="IP" --sout="#transcode{vcodec=MPEG4,width=800,height=600,scale=1}:http{dst=IP:15151/stream.ogg}" &

#Exit
exit
