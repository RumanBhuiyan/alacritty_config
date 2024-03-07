#!/bin/bash

# step - 01 : remove the executable binary file first 
if [ -e ~/.local/bin/alacritty ];
  echo "removing alacritty binary file from ~/.local/bin"
  rm ~/.local/bin/alacritty
then 

# step - 02: remove alacritty configurations folder
if [ -d ~/.config/alacritty/ ];then
  echo "Removing ~/.config/alacritty/ folder"
  rm -rf ~/.config/alacritty
fi

