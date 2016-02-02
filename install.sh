#!/bin/bash -x

for i in bash_aliases gitconfig vimrc xmobarrc; do
	mv ~/.$i ~/.$i.old 2> /dev/null
  # copy instead of linking to permit local modification
	# ln -s $(pwd)/$i ~/.$i
	cp $(pwd)/$i ~/.$i
done

test -d ~/.xmonad || mkdir ~/.xmonad

ln -f -s $(pwd)/xmonad.hs  ~/.xmonad/xmonad.hs

