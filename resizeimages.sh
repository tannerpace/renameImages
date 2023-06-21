#!/bin/bash
filepaths=$(osascript <<EOF
set the_files to choose file with multiple selections allowed with prompt "Please select the images"
set the_paths to ""
repeat with a_file in the_files
    set the_paths to the_paths & POSIX path of a_file & "\n"
end repeat
return the_paths
EOF
)

if [ -z "$filepaths" ]; then
    echo "No file selected."
    exit 1
fi

# process each file path
while IFS= read -r filepath; do
    
    sips -Z 320 -s format png "$filepath" --out "${filepath%.*}_320.png"
    sips -Z 768 -s format png "$filepath" --out "${filepath%.*}_768.png"
    sips -Z 1024 -s format png "$filepath" --out "${filepath%.*}_1024.png"

    open "$(dirname "$filepath")"
done <<< "$filepaths"

echo "Images resized successfully"