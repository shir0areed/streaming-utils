VIDEO_IN="-f v4l2 -thread_queue_size 8192 -s 640x480 -i /dev/video0"
AUDIO_IN="-f alsa -thread_queue_size 8192 -i hw:3,0"
VIDEO_OUT="-c:v h264_v4l2m2m -pix_fmt yuv420p -b:v 200k -s 320x240"
AUDIO_OUT="-c:a aac -b:a 64k -ac 1 -ar 44100"
MUXED_OUT="-f flv"
URI="rtmp://rtmp401.twitcasting.tv/live?pass=$RTMP_PASS&key=$RTMP_KEY"

ffmpeg $VIDEO_IN $AUDIO_IN $VIDEO_OUT $AUDIO_OUT $MUXED_OUT - \
    | ffmpeg -i - -c copy -f flv $URI
