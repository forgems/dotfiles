#!/bin/sh -x
DIR=$(dirname "${PWD}/$(dirname $0)")
ln -f -s "${DIR}/.vimrc" "${HOME}/.vimrc"
ln -f -s "${DIR}/.vim" "${HOME}/.vim"
ln -f -s "${DIR}/.gitconfig" "${HOME}/.gitconfig"
ln -f -s "${DIR}/.tmux.conf" "${HOME}/.tmux.conf"
