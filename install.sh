#!/bin/bash


# must be in local dir.
if [ -z $1 ]; then
  dir=$HOME
else
  dir=$1
fi
echo "dir $dir"



for i in "bashrc" "vimrc" "screenrc"  "gitconfig" ; do
  # echo $i;

  cp -v "$(pwd)/$i" "$dir/.$i"
done


for i in ".vim" ".vim/backup" ".vim/swap"  ".vim/undo" ".vim/autoload" ".vim/bundle"; do
  echo $i;
  [ -d "$dir/$i" ] ||  mkdir "$dir/$i"
done


