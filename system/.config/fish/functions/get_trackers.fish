function get_trackers --description "fetch newest public bittorrent trackers"
    curl 'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt' | xsel -ib
end
