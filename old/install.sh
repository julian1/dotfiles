#!/bin/bash -x

# for i in bash_aliases gitconfig vimrc xmobarrc screenrc; do
for i in bash_aliases gitconfig xmobarrc screenrc; do
	mv ~/.$i ~/.$i.old 2> /dev/null
  # use copy instead of linking to permit local modification
	# ln -s $(pwd)/$i ~/.$i
	cp $(pwd)/$i ~/.$i
done

test -d ~/.xmonad || mkdir ~/.xmonad

ln -f -s $(pwd)/xmonad.hs  ~/.xmonad/xmonad.hs

