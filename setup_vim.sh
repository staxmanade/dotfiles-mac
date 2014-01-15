mkdir ~/.vim/bundle -p 2> /dev/null
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
