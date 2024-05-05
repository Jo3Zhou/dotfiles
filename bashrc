# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# My personal evn & alias
source ~/.shell

eval "$(dircolors -b $HOME/.dircolors)" >/dev/null

eval "$(starship init bash)"
