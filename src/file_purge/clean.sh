#/bin/sh

run() {
    flag="$@"

    find . -name "*.bak" -type f ${flag}
    find . -name "*.info" -type f ${flag}
    find . -name "*.ini" -type f ${flag}
    find . -name "*.jpg" -type f ${flag}
    find . -name "*.jpeg" -type f ${flag}
    find . -name "*.srt" -type f ${flag}
    find . -name "*.txt" -type f ${flag}
    find . -name "*.png" -type f ${flag}
    find . -type d -empty ${flag}
}

run
echo -n "Would you like to delete all the files above (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Deleting the files"
    run "-delete"
fi