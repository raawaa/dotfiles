function record --description "record main screen"
    ffmpeg -video_size 1920x1080 -f x11grab -framerate 30 -i :0.0 -c:v h264_nvenc -qp 0 $argv
end

