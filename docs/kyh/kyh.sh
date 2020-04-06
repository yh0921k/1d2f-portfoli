#!/bin/bash
rm ~/.vimrc
echo "remove USERHOME/.vimrc"
rm ~/.bash_profile
echo "remove USERHOME/.bash_profile"
cp .vimrc ~
echo "copy .vimrc from this to USERHOME/"
cp .bash_profile ~
echo "copy .bash_profile from this to USERHOME/"
echo "[Usage] : please restart your shell to aplly above contents"
