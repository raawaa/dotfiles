function avrename --description 'rename av filename to product code'
    perl-rename 's/.*?(sd)?([a-zA-Z]+)-?(\d{3,})(?(?=(HD|FHD))(HD|FHD))([A-Z]?).*(\.\S+$)/\2-\3\6\7/' $argv
end
