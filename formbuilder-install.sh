#!/usr/bin/env bash

NODEMINVERSION="10.6.0"
NODE=$(which node)
NVM=$(which nvm)
BREW=$(which brews)

if [ "$NVM" != "" ]; then
  NODEVERSION=$(node --version)
  if [ "$NODEVERSION" = "$NODEMINVERSION" ]; then
    echo "Please use nvm to install Node $NODEMINVERSION or higher"
  else
    echo "You alredy have nvm and a sufficient version of Node installed"
  fi
  exit 0
fi

if [ "$NODE" != "" ]; then
  NODEVERSION=$(node --version)
  if [ "$NODEVERSION" = "$NODEMINVERSION" ]; then
    echo "You already have Node installed but not a sufficient version.\n\nDo yu want to install nvm to manage your Node versions"
    select yn in "Yes" "No"; do
      case $yn in
        Yes ) echo "Carrying on"; break;;
        No ) exit;;
      esac
    done
  else
    echo "You already have a sufficient version of Node installed.\n\nConsider using a Node version manager like nvm"
    exit 0
  fi
fi

if [ "$BREW" = "" ]; then
  echo "Installing brew"
  # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Hombrew already installed"
fi

