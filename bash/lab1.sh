#!/bin/vcbash
echo "filename; type; size; date; duration">./result.xls
#создание функции
files()
{
  (
  for file in "$1"/*
  do
    ext=$(echo ${file##*.})
    path=$file
    name=$(echo "$path"|rev|cut -f1 -d /|rev)
    
    if [[$ext=="mkv" || $ext =="mp4" || $ext =="avi" || $ext=="mp3"]]; then
        echo $name,$ext,$(stat --printf="%s,%z" "$path"),$(mediainfo "$path"|head -n6|tail -n1|cut -c44-)
    elif [[$name =="*"]]; then
        continue
    elif [[-d "$path" && $(echo "$path"|wc -l) -ne 0]]; then
        files "$path"
    else
        echo $name, $ext,$(stat --printf="%s,%z" "$path")
    fi
  done)>>./result.xls
}
files .
