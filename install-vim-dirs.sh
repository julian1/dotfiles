

# must be in local dir.
if [ -z $1 ]; then
  exit "need dir arg"
else
  dir=$1
fi
echo "dir $dir"


for i in ".vim" ".vim/backup" ".vim/swap"  ".vim/undo" ".vim/autoload" ".vim/bundle"; do
  echo $i;
  [ -d "$dir/$i" ] ||  mkdir "$dir/$i"
done


