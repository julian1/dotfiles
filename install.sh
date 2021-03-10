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
  # ln -sf "$(pwd)/$i" "$HOME/.$i"
  # mv "$HOME/.$i" "$HOME/.$i.old"

  cp -v "$(pwd)/$i" "$dir/.$i"
done

# vim now hanles local dir creation,
# except, if vim is not run first, then 
# ansible won't

for i in ".vim" ".vim/backup" ".vim/swap"  ".vim/undo" ".vim/autoload" ".vim/bundle"; do
  echo $i;
  [ -d "$dir/$i" ] ||  mkdir "$dir/$i"
done

# ssh public keys?
# not by default?

