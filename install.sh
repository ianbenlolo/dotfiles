# # Install Zsh
# adapted from https://gist.github.com/mgbckr/b8dc6d7d228e25325b6dfaa1c4018e78
# Installs Zsh with Oh-My-Zsh without root privileges 
# on Stanford's Sherlock (https://sherlock.stanford.edu) for use in tmux
#
# ## Instructions
# 1) bash install_zsh.sh
# 2) edit .zshrc (add the path to your Zsh binary to the PATH variable, etc.)
# 3) add `set-option -g default-shell <path to zsh>/bin/zsh` to `~/.tmux.conf`
# 4) also see comments for potential further notes
#
# Elaborating on Step 2, this is what I added to my `.zshrc`:
# ```
# # Recently I got a bunch of errors out of the blue (e.g. `colors: function definition file not found`).
# To fix this I had to add this (source: https://github.com/ohmyzsh/ohmyzsh/issues/4607):
# export FPATH=/home/users/mgbckr/services/zsh/share/zsh/5.6.2-test-2/functions:$FPATH
# ZSH_DISABLE_COMPFIX=true
#

ZSH_INSTALL_DIR=$HOME/bin/zsh

# switch to tmp folder
mkdir tmp; cd tmp

# get ncurses
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz
tar -xf ncurses-6.1.tar.gz
cd ncurses-6.1

# Set cflags and c++ flags to compile with Position Independent Code enabled which we need for compiling zsh
export CXXFLAGS=' -fPIC'
export CFLAGS=' -fPIC'

./configure --prefix=$ZSH_INSTALL_DIR --enable-shared
make

# don't need this probably
#cd progs
#./capconvert
#cd ..

# probably don't need this
#export TERMINFO=/usr/share/terminfo

# test ncurses (only works with the above)
#./test/ncurses

make install
cd ..

# Tell environment where ncurses is
INSTALL_PATH="$ZSH_INSTALL_DIR"
export PATH=$INSTALL_PATH/bin:$PATH
export LD_LIBRARY_PATH=$INSTALL_PATH/lib:$LD_LIBRARY_PATH
export CFLAGS=-I$INSTALL_PATH/include
export CPPFLAGS="-I$INSTALL_PATH/include" LDFLAGS="-L$INSTALL_PATH/lib"


# Zsh

# Get zsh
git clone https://github.com/zsh-users/zsh.git

# Move into root zsh source directory
cd zsh

# Produce config.h.in, needed to produce config.status from ./configure
autoheader

# Produce the configure file from aclocal.m4 and configure.ac
autoconf

# Produce Makefile and config.h via config.status
./configure --prefix=$ZSH_INSTALL_DIR --enable-shared

make
make install

cd ..

# oh-my-zsh

# clone repository into local dotfiles
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

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

cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git


ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

