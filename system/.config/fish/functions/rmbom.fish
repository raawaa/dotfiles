function rmbom -d "remove unicode bom from text file"
    set -l original_file_name $argv[(count $argv)]
    set -l tmp_file_name "$original_file_name".tmp
    command sed -e '1s/^\xef\xbb\xbf//' $argv > $tmp_file_name; and command mv "$tmp_file_name" "$original_file_name"
end
