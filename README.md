# My dot files

## Introduction(s)

These are my **dot files**.
I'm using Linux since a year ago.
My current distribution is [Ubuntu 20.04](https://ubuntu.com), but I'm going to switch to [Arch Linux](https://archlinux.org) in the future.

## Content

* [Neovim](https://neovim.io)
* [Zsh](https://www.zsh.org)
* [Alacritty](https://github.com/alacritty/alacritty)

## How to store dotfiles?

That was the first question that came to my mind at the beginning.
My goal was to make my home folder to be as clean as possible.
I was searching for the best solution and found [this page](https://www.atlassian.com/git/tutorials/dotfiles).
Really helpful and great way to make it work.

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
```

## Last but not least

This repository was inspired by [makccr](https://github.com/makccr).
Really appreciate his work.
