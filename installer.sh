#!/bin/bash

# step - 01: keep backup of existing alacritty config folder if exists
if [ -d ~/.config/alacritty/ ];then
  echo "Keeping backup of your existing alacritty config folder"
  cp -rv ~/.config/alacritty ~/.config/alacritty.backup
  rm -rf ~/.config/alacritty
fi

# step - 02: clone the github repo into userspace home directory first
if [ -d ~/alacritty_config ]; then 
  echo "Removing ~/alacritty_config directory "
  rm -rf ~/alacritty_config
fi 
git clone https://github.com/RumanBhuiyan/alacritty_config.git ~/alacritty_config

# step - 03 : copy the alacritty executable binary file into ~/.local/bin folder
if [ ! -d ~/.local/bin/ ];then 
  echo "~/.local/bin doesn't exist. Creating..."
  mkdir -m777 ~/.local/bin
fi

echo "Copying alacritty executable binary into ~/.local/bin folder !"
cp -v ~/alacritty_config/alacritty ~/.local/bin/

# step - 04 : now copy the alacritty folder into ~/.config folder 
if [ ! -d ~/.config/alacritty ];then
  echo "~/.config/alacritty doesn't exist. Creating..."
  mkdir -m777 ~/.config/alacritty
fi 

echo "Copying alacritty config toml file..."
cp -v ~/alacritty_config/alacritty.toml ~/.config/alacritty/

echo "Copying alacritty themes into ~/.config/alacritty/themes folder..."
cp -r ~/alacritty_config/themes ~/.config/alacritty/themes/

# step - 05 : add the executable binary path to PATH if doesn't exist
if [[ ! $PATH == *"/.local/bin/"* ]];then 
  echo "PATH=~/.local/bin/:$PATH" >> ~/.bashrc
  echo "PATH=~/.local/bin/:$PATH" >> ~/.zshrc
fi 

# step - 06 : remove the github repo 
echo "Removing ~/alacritty_config git repo from home directory."
rm -rf ~/alacritty_config 

echo "Alacritty installed... type alacritty and hit enter!!"

