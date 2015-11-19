set -x

for i in bashrc gitconfig vimrc Xdefaults xmobarrc ; do
	mv ~/.$i ~/.$i.old 2> /dev/null
	ln -s $(pwd)/$i ~/.$i
done

mkdir ~/.xmonad 
ln -f -s $(pwd)/xmonad.hs  ~/.xmonad/xmonad.hs

ln -f -s $(pwd)/start.sh ~/start.sh



