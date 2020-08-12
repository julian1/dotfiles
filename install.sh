#!/bin/bash

# OK. there's an issue. that this replaces bashrc for nixos. but debian we want bashaliases

for i in "bashrc" "vimrc" "screenrc"  "gitconfig" ; do
  # echo $i;
  # ln -sf "$(pwd)/$i" "$HOME/.$i"
  # mv "$HOME/.$i" "$HOME/.$i.old"

  cp -v "$(pwd)/$i" "$HOME/.$i"
done

# vim now hanles local dir creation,
#for i in ".vim" ".vim/backup" ".vim/swap"  ".vim/undo" ".vim/autoload" ".vim/bundle"; do
#  echo $i;
#  [ -d "$HOME/$i" ] ||  mkdir "$HOME/$i"
#done

# ssh public keys?
# not by default?

