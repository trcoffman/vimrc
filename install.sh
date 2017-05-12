# Setup vim swaps
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Setup .vimrc and .tmux.conf
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "so $DIR/vimrc" > ~/.vimrc
echo "source-file $DIR/tmux.conf" > ~/.tmux.conf

# Install reattach-to-user-namespace
brew install reattach-to-user-namespace

# Install powerline fonts.
pushd /tmp
git clone https://github.com/powerline/fonts.git
fonts/install.sh
popd

