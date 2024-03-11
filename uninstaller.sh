#!/bin/bash

# step - 01 : remove the executable binary file first 
if [ -e ~/.local/bin/alacritty ]; then 
  echo "removing alacritty binary file from ~/.local/bin"
  rm ~/.local/bin/alacritty
fi

# step - 02: remove alacritty configurations folder
if [ -d ~/.config/alacritty ];then
  echo "Removing ~/.config/alacritty/ folder"
  rm -rf ~/.config/alacritty
fi

# step -03: also remove github repo if found in ~/ 
if [ -d ~/alacritty_config ];then 
  echo "Removing ~/alacritty_config folder..."
  rm -rf ~/alacritty_config
fi 

echo "Alcritty uninstalled successfully!!!"

