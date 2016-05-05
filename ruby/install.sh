#!/usr/bin/env bash

if test ! $(which rvm)
then
  echo "  Installing rvm for you."
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
  source ${HOME}/.rvm/scripts/rvm
fi