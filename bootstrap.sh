#!/bin/sh

#######################################################
# bootstrap.sh
# This script sets up a laptop the way that I like it.
#######################################################

set -e

dir=$HOME/Code/dotfiles

fancy_echo() {
  local fmt="$1"; shift

  printf "\n$fmt\n" "$@"
}

install_latest() {
  if [ ! -d "~/.asdf/installs/$1" ]
  then
    fancy_echo "Installing $1..."
    asdf list-all $1 | tail -1 | xargs asdf install $1
  fi
}

if [ ! d "$HOME/Code"]; then
  fancy_echo "Creating $HOME/Code directory..."
  mkdir "$HOME/Code"
fi

# fancy_echo "Setting MacOs defaults..."
# source ~/dotfiles/set-defaults.sh

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap homebrew/bundle
fi

fancy_echo "Updating Homebrew..."
brew update


if ! command -v git >/dev/null; then
  brew install git
fi

if [ ! -d "$dir" ]; then
  fancy_echo "Cloning dotfiles..."
  git clone git://github.com/mvf4z7/dotfiles.git "$dir"
fi

fancy_echo "Installing items in Brewfile"
brew bundle --file="$dir/Brewfile"

if [ ! -d "$HOME/bin" ]; then
  fancy_echo "Creating bin directory..."
  mkdir ~/bin
fi

fancy_echo "Linking dotfiles..."
env RCRC=$dir/rcrc rcup

. $HOME/.asdf/asdf.sh

if ! asdf plugin-list | grep nodejs > /dev/null
then
  fancy_echo "Installing nodejs asdf plugin..."
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

if ! asdf plugin-list | grep golang > /dev/null
then
  fancy_echo "Installing golang asdf plugin..."
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
fi

if ! asdf plugin-list | grep elixir > /dev/null
then
  fancy_echo "Installing elixir asdf plugin..."
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

if ! asdf plugin-list | grep erlang > /dev/null
then
    fancy_echo "Installing erlang asdf plugin..."
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi

if ! command -v rustup > /dev/null
then
  fancy_echo "Installing rustup..."
  curl https://sh.rustup.rs -sSf | sh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  fancy_echo "Installing oh-my-zsh..."
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

case "$SHELL" in
  */zsh) : ;;
  *)
    fancy_echo "Changing your shell to zsh..."
      chsh -s "$(which zsh)"
    ;;
esac
