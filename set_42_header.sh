#!/bin/bash

# ASCII art definition
asciiart=(
    "        :::      ::::::::"
    "      :+:      :+:    :+:"
    "    +:+ +:+         +:+  "
    "  +#+  +:+       +#+     "
    "+#+#+#+#+#+   +#+        "
    "     #+#    #+#          "
    "    ###   ########.fr    "
)

start='/*'
end='*/'
fill='*'
length=80
margin=5

# File type settings
declare -A types=(
    ["c|h|cc|hh|cpp|hpp|tpp|ipp|cxx|go|rs|php|py|java|kt|kts"]='/* */ *'
    ["htm|html|xml"]='<!-- --> *'
    ["js|ts"]='// // *'
    ["tex"]='% % *'
    ["ml|mli|mll|mly"]='(* *) *'
    ["vim|vimrc"]='" " *'
    ["el|emacs|asm"]='; ; *'
    ["f90|f95|f03|f|for"]='! ! /'
    ["lua"]='-- -- -'
)

# Get file type and adjust settings
filetype() {
    local ext="${1##*.}"
    for pattern in "${!types[@]}"; do
        if [[ "$ext" =~ $pattern ]]; then
            IFS=' ' read -r start end fill <<< "${types[$pattern]}"
            break
        fi
    done
}

# Generate text line
textline() {
    local left="$1"
    local right="$2"
    local padded_left="${left:0:$((length - margin * 2 - ${#right}))}"
    printf "%s%s%s%s%s%s%s\n" \
        "$start" \
        "$(printf "%-${margin}s" " ")" \
        "$padded_left" \
        "$(printf "%$((length - margin * 2 - ${#padded_left} - ${#right}))s" " ")" \
        "$right" \
        "$(printf "%-${margin}s" " ")" \
        "$end"
}

# Generate specific lines
line() {
    local n="$1"
    case $n in
        1|11) # Top and bottom line
            printf "%s %s %s\n" \
                "$start" \
                "$(printf "%-${length}s" "${fill}")" \
                "$end"
            ;;
        2|10) # Blank line
            textline "" ""
            ;;
        3|5|7) # ASCII art
            textline "" "${asciiart[$((n - 3))]}"
            ;;
        4) # Filename
            textline "$(basename "$0")" "${asciiart[$((n - 3))]}"
            ;;
        6) # Author
            textline "By: $USER <$USER@42.fr>" "${asciiart[$((n - 3))]}"
            ;;
        8) # Created
            textline "Created: $(date '+%Y/%m/%d %H:%M:%S') by $USER" "${asciiart[$((n - 3))]}"
            ;;
        9) # Updated
            textline "Updated: $(date '+%Y/%m/%d %H:%M:%S') by $USER" "${asciiart[$((n - 3))]}"
            ;;
    esac
}

# Insert header
insert_header() {
    echo
    for ((i=11; i>=1; i--)); do
        line "$i"
    done
    echo
}

# Update header
update_header() {
    # Example logic for updating the header. This requires parsing the file content.
    echo "Updating header logic goes here (if applicable)"
}

# Main function to manage header
stdheader() {
    filetype "$1"
    insert_header
}

# Main Script Execution
if [[ "$1" == "insert" ]]; then
    stdheader "$2"
elif [[ "$1" == "update" ]]; then
    update_header "$2"
else
    echo "Usage: $0 {insert|update} <filename>"
fi

