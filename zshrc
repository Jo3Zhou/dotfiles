# ~/.zshrc

# My personal evn & alias
source $HOME/.shell

# The dircolors
eval "$(dircolors -b $HOME/.dircolors)" > /dev/null

# THe starship
eval "$(starship init zsh)"
