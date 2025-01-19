#!/bin/sh

#-----------------------------------------------------------------------------#
#                   Deprecated, use stow instead of this script               #
#-----------------------------------------------------------------------------#

function destination_exists() {
  if [ -f $1 ] || [ -d $1 ]; then
    return 0
  fi
  return 1
}

function ask() {
  read -p "$1" yn
  case $yn in
    [Yy]* ) return 0;;
    [Nn]* ) return 1;;
    * ) echo "Please answer yes or no.\n";;
  esac
}

function create_symlink() {
  if destination_exists $2; then
    echo "$2 exists"
    if ask "Do you want to overwrite it? (y/n): " $2; then
      rm -rf $2
      ln -s $1 $2
      echo "Overwritten $2"
    else
      echo "Skipping $2"
    fi
    echo -e "\n"
    return
  fi
  if ask "Do you want to create symlink $2? (y/n)" $2; then
    ln -s $1 $2
    echo "Created symlink $2 \n"
  else
    echo "Skipping $2\n"
  fi
  echo -e "\n"
}

create_symlink ~/dotfiles/.zshrc ~/.zshrc
create_symlink ~/dotfiles/.config/zsh ~/.config/zsh

create_symlink ~/dotfiles/.config/nvim ~/.config/nvim
create_symlink ~/dotfiles/.config/terminator ~/.config/terminator
create_symlink ~/dotfiles/.tmux.conf ~/.tmux.conf
create_symlink ~/dotfiles/.config/alacritty ~/.config/alacritty
create_symlink ~/dotfiles/.config/wallpapers ~/.config/wallpapers
create_symlink ~/dotfiles/.config/zellij ~/.config/zellij
create_symlink ~/dotfiles/.config/starship.toml ~/.config/starship.toml
create_symlink ~/dotfiles/.config/oh_my_posh ~/.config/oh_my_posh
create_symlink ~/dotfiles/.ideavimrc ~/.ideavimrc
