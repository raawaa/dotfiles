function concatmp4 --description "Concat h264 encoded mp4 files using ffmpeg"
    echo START TO CONCAT (count $argv) VIDEOS
    echo "=============================="
    echo "GENERATING INTERMEDIATE FILES..."
    echo "=============================="

    # set name lists
    set -l output_filename $argv[-1]
    set -l origin_names $argv[1..-2]
    set -l temp_names

    # generate intermediate files
    for f in $origin_names
        set origin_names $origin_names (basename $f)
        # ffmpeg -i $f -c copy -bsf:v h264_mp4toannexb -f mpegts -y (string join '.' 'tempfile' ( basename $f ) 'ts')
        ffmpeg -i $f -c copy -f mpegts -y (string join '.' 'tempfile' ( basename $f ) 'ts')
        and set temp_names $temp_names (string join '.' 'tempfile' ( basename $f ) 'ts')
    end

    echo "=============================="
    printf '%d intermediate files generated' (count $temp_names) 

    # make ffmpeg input concat string
    set -l concat_string (string join ':' 'concat' (string join '|' $temp_names))
    # get output filename
    # echo -n "What's ur concated filename? "
    # read output_filename
    # ffmpeg -i "$concat_string" -c copy -bsf:a aac_adtstoasc "$output_filename"
    ffmpeg -y -i "$concat_string" -an -vf scale=w=1920:h=1080:force_original_aspect_ratio=decrease -c:v libx264 -profile:v high -level 4.1 -b:v 6M -framerate 30 -g 250 -preset veryslow -tune film -maxrate 12M -bufsize 6M -pix_fmt yuv420p -pass 1 -f mp4 /dev/null
    ffmpeg -i "$concat_string" -c:a aac -b:a 320k -vf scale=w=1920:h=1080:force_original_aspect_ratio=decrease -c:v libx264 -profile:v high -level 4.1 -preset veryslow -tune film -framerate 30 -g 250 -b:v 6M -maxrate 12M -bufsize 6M -pix_fmt yuv420p -pass 2 "$output_filename"
    # ffmpeg -i "$concat_string" -c:v libx264 -preset slow -tune film -crf 22 -c: copy (string join '.' "$output_filename" "mp4")
    and printf '%d of %d videos is concated!' (count $argv) (count $temp_names)

    # clean intermediate files
    rm -v $temp_names
end
