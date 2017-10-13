#!/bin/sh
nkf -Lu -w ~/dotfiles/.vimrc > ~/dotfiles/.vimrc_linux
nkf -Lu -w ~/dotfiles/.netrc > ~/dotfiles/.netrc_linux
nkf -Lu -w ~/dotfiles/.bash_profile > ~/dotfiles/.bash_profile_linux
nkf -Lu -w ~/dotfiles/.bashrc > ~/dotfiles/.bashrc_linux
nkf -Lu -w ~/dotfiles/bash/git-prompt > ~/dotfiles/bash/git-prompt_linux
nkf -Lu -w ~/dotfiles/bash/git-unyou > ~/dotfiles/bash/git-unyou_linux

ln -sf ~/dotfiles/.netrc_linux ~/.netrc
ln -sf ~/dotfiles/.vimrc_linux ~/.vimrc
ln -sf ~/dotfiles/.bash_profile_linux ~/.bash_profile
ln -sf ~/dotfiles/.bashrc_linux ~/.bashrc

ln -sf ~/dotfiles/bash/git-prompt_linux ~/.bash/git-prompt
ln -sf ~/dotfiles/bash/git-unyou_linux ~/.bash/git-unyou

mkdir -p ~/.vim/dein/repos/github.com/Shougo
mkdir -p ~/.vim/rc
nkf -Lu -w ~/dotfiles/vim/rc/dein.toml > ~/.vim/rc/dein.toml 
nkf -Lu -w ~/dotfiles/vim/rc/dein_lazy.toml > ~/.vim/rc/dein_lazy.toml

mkdir -p ~/vimfiles/Backup
mkdir -p ~/vimfiles/script
mkdir -p ~/vimfiles/Undo

cat << EOS
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
EOS>> ~/.vimrc
