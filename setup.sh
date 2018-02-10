#!/bin/sh


# シンボリックリンクを張る
DOT_FILES=( .vimrc .vim )
if [ -e $HOME/dotbk ]; then
  rm -r -f $HOME/dotbk
fi
mkdir $HOME/dotbk
    
for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    mv -f $HOME/$file $HOME/dotbk
  fi
  ln -s $HOME/dotfiles/$file $HOME/$file
done

# Gitからリポジトリを取得
 
[ ! -d ~/.vim/dein ] && mkdir -p ~/.vim/dein && git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim && echo "you should run following command to setup plugins ->  vim -c ':call dein#install()'"

