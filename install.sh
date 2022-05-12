
# oh-my-zsh

# clone repository into local dotfiles
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


# copy template file into home directory
# cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

cd ..

# delete tmp folder
rm -rf tmp

ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/zshenv $HOME/.zshenv

ln -s ${pwd}/tmux.conf $HOME/.tmux.conf

# install pathogen for vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle && git clone https://github.com/altercation/vim-colors-solarized.git
#cd ~/.vim/bundle && \
#    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

