set -x

for i in bashrc gitconfig vimrc Xdefaults xmobarrc xinitrc Xmodmap; do
	mv ~/.$i ~/.$i.old 2> /dev/null
	ln -s $(pwd)/$i ~/.$i
done

test -d ~/.xmonad || mkdir ~/.xmonad

ln -f -s $(pwd)/xmonad.hs  ~/.xmonad/xmonad.hs

# ln -f -s $(pwd)/start.sh ~/start.sh


