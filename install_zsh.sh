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
# git clone https://github.com/zsh-users/zsh.git
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1

# Move into root zsh source directory
cd zsh

# Produce config.h.in, needed to produce config.status from ./configure
# autoheader

# Produce the configure file from aclocal.m4 and configure.ac
# autoconf

# Produce Makefile and config.h via config.status
./configure --prefix=$ZSH_INSTALL_DIR

make
make install

cd ..

