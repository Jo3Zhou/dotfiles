# Dotfiles Repository

This repository contains my personal dotfiles, which are managed using [GNU Stow](https://www.gnu.org/software/stow/). The configurations are tailored for my development environment, featuring a collection of tools that enhance productivity and streamline my workflow.

## macOS installation

Install the Xcode Command Line Tools, then install Homebrew:

```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Clone the repository, install the declared dependencies, and link the dotfiles into the home directory:

```bash
git clone https://github.com/Jo3Zhou/dotfiles.git ~/dotfiles
cd ~/dotfiles
./macos/install.sh
```

The installer recognizes Homebrew's Apple Silicon (`/opt/homebrew`) and Intel (`/usr/local`) locations. Open a new terminal after it completes.

## Linux installation

`packages.txt` and `yay_packages.txt` are an Arch Linux package inventory. They are retained for the existing Linux environment and are not a Fedora package list.

```bash
sudo pacman -S --noconfirm $(cat packages.txt)
yay -S --noconfirm $(cat yay_packages.txt)
```

```bash
git clone https://github.com/Jo3Zhou/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow -t "$HOME" .
```

## Uninstall

```bash
cd ~/dotfiles
stow -D -t "$HOME" .
```

## Updating package inventories

On macOS, update the Brewfile after installing or removing packages:

```bash
brew bundle dump --force --file=macos/Brewfile
```

On Arch Linux:

```bash
pacman -Qqe > packages.txt
yay -Qm > yay_packages.txt
```
