#!/bin/sh

function destination_exists() {
  if [ -f $1 ] || [ -d $1 ]; then
    return 0
  fi
  return 1
}


function create_symlink() {
  if destination_exists $2; then
    echo "$2 exists"
    read -p "Do you want to overwrite it? (y/n)" yn
    case $yn in
      [Yy]* ) 
        rm -rf $2
        ln -s $1 $2
      ;;
      [Nn]* ) echo "Skipping $2";;
      * ) echo "Please answer yes or no.";;
    esac
    return
  fi
  ln -s $1 $2
}



function zshrc() {
  create_symlink ~/.dotfiles/.zshrc ~/.zshrc
}
function nvim() {
  create_symlink ~/.dotfiles/.config/nvim ~/.config/nvim
}
function terminator() {
  create_symlink ~/.dotfiles/.config/terminator ~/.config/terminator
}
function zsh() {
  create_symlink ~/.dotfiles/.config/zsh ~/.config/zsh
}
function tmux() {
  create_symlink ~/.dotfiles/.tmux.conf ~/.tmux.conf
}
function alacritty() {
  create_symlink ~/.dotfiles/.config/alacritty ~/.config/alacritty
}
function wallpaper() {
  create_symlink ~/.dotfiles/.config/wallpapers ~/.config/wallpapers
}
function zellij() {
  create_symlink ~/.dotfiles/.config/zellij ~/.config/zellij
}
function starship() {
  create_symlink ~/.dotfiles/.config/starship.toml ~/.config/starship.toml
}


zshrc
nvim
terminator
zsh
tmux
alacritty
wallpaper
zellij
starship


