#!/usr/bin/env bash
set -e

script_run_path=${PWD}
script_path="$( cd $( dirname $0 ) && pwd )"
script_name=$(basename $0)

if [ -f $script_path/.extra ]; then
  source $script_path/.extra
elif [ -f $script_path/../extra/.extra ]; then
  source $script_path/../extra/.extra
else
  echo "Error: missing $script_path/.extra and $script_path/../extra/.extra"
  exit 1
fi

[ ! -z "$PROJECTS_DIR" ] \
  || { echo "Error: \$PROJECTS_DIR not set in $script_path/.extra"; exit 1; }

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
echo "Creating symbolic link for .extra"
ln -sfn $PROJECTS_DIR/github/sgulinski/extra/.extra $HOME/.extra

# Delete directories if exist - ln -sfn on macOS does not work as intended
for dir in {.mc,.vim,bin,init}; do
  [ -d $HOME/$dir ] && { rm -rf $HOME/$dir; }
done;
unset dir;

for file in {.aliases,.bash_profile,.bash_prompt,.bashrc,.curlrc,\
.editorconfig,.exports,.functions,.gdbinit,.gitattributes,.gitconfig,\
.gitignore,.gvimrc,.hushlogin,.inputrc,.macos*,.mc,.path,.screenrc,\
.tmux.conf,.vim,.vimrc,.wgetrc,Brewfile,bin,bootstrap.sh,brew.sh,init}; do

  echo "Creating symbolic link for $file"
  ln -sfn $PROJECTS_DIR/github/sgulinski/dotfiles/$file $HOME/$file
done;
unset file;
