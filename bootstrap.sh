#!/usr/bin/env bash
set -e

script_run_path=${PWD}
script_path="$( cd $( dirname $0 ) && pwd )"
script_name=$(basename $0)

[ -f $script_path/../extra/.extra ] || { echo "Error: missing $script_path/../extra/.extra"; exit 1; }
source $script_path/../extra/.extra

[ ! -z "$PROJECTS_DIR" ] || { echo "Error: \$PROJECTS_DIR not set in $script_path/.extra"; exit 1; }


if [[ $# -ne 0 ]]; then
  echo $"Incorrect number of parameters provided ($#)" >&2
  echo $'\nUsage:' >&2
  echo $"  $script_name" >&2
  exit 1
fi

# Add private ssh keys
$script_path/bin/ssh_add_private_keys

# Install Homebrew formulas, Homebrew casks and Mac App Store applications
$script_path/brew.sh

# Create directory for github repositories
if [ ! -d $PROJECTS_DIR/github/sgulinski ]; then
  mkdir -p $PROJECTS_DIR/github/sgulinski
fi

# Clone git@github.com:sgulinski/extra.git
cd $PROJECTS_DIR/github/sgulinski;
if [ ! -d $PROJECTS_DIR/github/sgulinski/extra ]; then
  echo 'Cloning extra repository'
  git clone git@github.com:sgulinski/extra.git ./extra;
else
  echo 'extra repository already cloned - updating'
  cd ./extra
  git pull
fi

# Clone git@github.com:sgulinski/dotfiles.git
cd $PROJECTS_DIR/github/sgulinski;
if [ ! -d $PROJECTS_DIR/github/sgulinski/dotfiles ]; then
  echo 'Cloning dotfiles repository'
  git clone git@github.com:sgulinski/dotfiles.git ./dotfiles;
else
  echo 'dotfiles repository already cloned - updating'
  cd ./dotfiles
  git pull
fi

cd $script_run_path

# Create symbolic links
echo "Creating symbolink link pointing from $PROJECTS_DIR/github/sgulinski/extra/.extra to $HOME"
ln -sfn $PROJECTS_DIR/github/sgulinski/extra/.extra $HOME/.extra

echo "Creating symbolink links pointing from $PROJECTS_DIR/github/sgulinski/dotfiles/.* to $HOME"
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/bin $HOME/bin
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.aliases $HOME/.aliases
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.bash_profile $HOME/.bash_profile
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.bash_prompt  $HOME/.bash_prompt
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.bashrc $HOME/.bashrc
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.gitconfig $HOME/.gitconfig
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.gitconfig $HOME/.gitconfig
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.gitignore $HOME/.gitignore

[ -d $HOME/.mc ] && { rm -rf $HOME/.mc; } 
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.mc $HOME/.mc

[ -d $HOME/.vim ] && { rm -rf $HOME/.vim; } 
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.vim $HOME/.vim

ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.vimrc $HOME/.vimrc
ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/.wgetrc $HOME/.wgetrc
