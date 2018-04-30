function subrename --description "Rename subtitles to the matching videos"
    set -l episodes *.{mkv,avi,rmvb,wmv}
    set -l subtitles *.{srt,ass}
    for episode in $episodes
        set_color -r blue; echo $episode; set_color normal;
        set -l episode_num (string match -i -r 's\d{1,2}e\d{1,2}' "$episode")
        set -l episode_name (string match -i -r '(.*)(\.[^\.]+$)' "$episode")[2]
        set_color -d blue; echo $episode_num; set_color normal
        for subtitle in $subtitles
            set -l sub_ext (string match -ir '\.[^\.]+$' "$subtitle")
            if string match -qie $episode_num $subtitle
                set -l new_sub_name (string join '' $episode_name $sub_ext )
                set_color -d
                command cp -v "$subtitle" "$new_sub_name"
                set_color normal
            end
        end
    end
end
