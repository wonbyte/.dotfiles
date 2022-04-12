# https://github.com/ThePrimeagen/.dotfiles/blob/master/install
export STOW_FOLDERS="antigen,kitty,nvim,tmux,zsh"

pushd $HOME/.dotfiles

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -D $folder
    stow $folder
done

popd
