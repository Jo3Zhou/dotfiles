# Dotfiles Repository

This repository contains my personal dotfiles, which are managed using [GNU Stow](https://www.gnu.org/software/stow/). The configurations are tailored for my development environment, featuring a collection of tools that enhance productivity and streamline my workflow.

## Installation

```bash
cd $XDG_HOME_DIRECTORY
git clone https://github.com/Jo3Zhou/dotfiles
cd dotfiles
stow -S .
```

## Uninstall

```bash
cd dotfiles
stow -D
```
