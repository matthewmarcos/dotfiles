ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/tmux.conf .tmux.conf

git config --global core.excludesfile '~/dotfiles/gitignore'
mkdir -p ~/.vim.tmp
cd .vim/tmp
mkdir mkdir swap undo backup view