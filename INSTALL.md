# Install

### [Neovim](https://neovim.io)
###### Install
```
sudo apt install neovim
```
###### [vim-plug](https://github.com/junegunn/vim-plug)

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

---

### [Alacritty](https://github.com/alacritty/alacritty)
##### Install
```
cargo install alacritty
```

---

### [Vifm](https://vifm.info)

---

### [i3](https://i3wm.org)
###### Base package(s)
```
sudo apt install i3
```
###### i3-gaps
```
sudo add-apt-repository -y ppa:regolith-linux/stable
sudo apt update
sudo apt install i3-gaps
```

---

## All in one

```
sudo apt install neovim i3
```
