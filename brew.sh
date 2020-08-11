#!/usr/bin/env bash
set -e

script_run_path=${PWD}
script_path="$( cd $( dirname $0 ) && pwd )"
script_name=$(basename $0)

# Check number of input parameters
if [[ $# -ne 0 ]]; then
  echo $"Incorrect number of parameters provided ($#)" >&2
  echo $'\nUsage:' >&2
  echo $"  $script_name" >&2
  exit 1
fi

# Update/install Homebrew
echo 'Updating/installing Homebrew'
if ( brew --version; ) < /dev/null > /dev/null 2>&1; then
  echo 'Homebrew already installed - updating'
  brew update
else
  echo 'Homebrew not installed - installing'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update/install Mac App Store CLI
echo 'Updating/installing Mac App Store CLI'
if ( mas version; ) < /dev/null > /dev/null 2>&1; then
  echo 'Mac App Store CLI already installed - updating'
  brew upgrade mas
else
  echo 'Mac App Store CLI not installed - installing'
  brew install mas
fi

# Install and clean up
cd $script_path
echo 'Installing Homebrew formulas, Homebrew casks and Mac App Store applications'
brew bundle

echo 'Removing outdated versions from the Homebrew cellar'
brew cleanup

echo 'Checking for potential problems with Homebrew'
set +e
brew doctor
set -e
cd $script_run_path
