

# must be in local dir.
if [ -z $1 ]; then
  exit "need dir arg"
else
  dir=$1
fi
echo "dir $dir"


[ -d "$dir/.xmonad"  ] ||  mkdir "$dir/.xmonad"


cp xmonad.hs "$dir/.xmonad"

#mkdir "$dir/xmobar"
cp xmobarrc "$dir/.xmobarrc"


