#!/bin/sh

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Ag
brew install the_silver_searcher

# Install vim
brew install vim

# Install tmux
brew install tmux

# Install reattach-to-user-namespace so that copy-paste works in Vim inside tmux
brew install reattach-to-user-namespace

# Setup vim swaps
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Setup .vimrc and .tmux.conf and .zshenv
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "so $DIR/vimrc" > ~/.vimrc
echo "source-file $DIR/tmux.conf" > ~/.tmux.conf
echo ". $DIR/zshenv" > ~/.zshenv

# Run :PlugInstall within vim
vim -c ":PlugInstall | :q | :q"

# Sync marvim macro repository
pushd ~
git clone git@github.com:trcoffman/marvim.git
mv marvim .marvim
popd

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setup agnoster theme for oh-my-zsh
sed -i~ 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# Install powerline fonts so that vim-airline and the agnoster theme for oh-my-zsh work properly
pushd /tmp
git clone https://github.com/powerline/fonts.git
fonts/install.sh
popd

# Now setup solarized dark colorscheme in iterm2 and select a powerline font in iterm2
