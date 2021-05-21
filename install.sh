

# must be in local dir.
if [ -z $1 ]; then
  exit "need dir arg"
else
  dir=$1
fi
echo "dir $dir"


# only needed in non ansible managed debian etc
#for i in "bashrc" "vimrc" "screenrc"  "gitconfig" ; do
#  # echo $i;
#
#  cp -v "$(pwd)/$i" "$dir/.$i"
#done


