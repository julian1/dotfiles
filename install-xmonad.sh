
if [ -z $1 ]; then
  exit "need dir arg"
else
  dir=$1
fi
echo "dir $dir"


[ -d "$dir/.xmonad"  ] ||  mkdir "$dir/.xmonad"


cp xmonad.hs "$dir/.xmonad"

cp xmobarrc "$dir/.xmobarrc"

cp Xresources "$dir/.Xresources"


