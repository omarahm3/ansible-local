# Omarahm3 playbook

This is mostly used on a fresh Arch Linux install, currently I run endeavouros i3-wm flavor (expect this change tho. Thats why this will be always WIP)

## About

This playbook will be installing these applications and tools:

- dunst
- polybar
- rofi
- neovim
- fish shell
- oh my fish
- fisher
- starship
- tmux
- suckless terminal (st)
- kitty
- jq
- ripgrep
- authy
- flameshot
- bat
- docker
- notion
- k8s lens
- insomnia
- steam
- baapan (node repl)
- bitwarden cli

and will install these languages:

- go
- php
- rust

plus Nerd fonts and some other needed fonts.

Playbook will depend heavily on yay, pacman, and git to install each package (obviously)

## Prerequisites

You need to make sure that all ENV variables are setup right, that is why you **must** have a `./variables.yaml` file that contain all needed variables.

```yaml
# SOURCE_KEY & DEST_KEY are used only on `./tasks/ssh-setup.yaml` & `./tasks/dotfiles-setup.yaml`
# to setup my private repositories and projects, mostly these 2 tasks can be ignored
# head over to https://github.com/omarahm3/.dotfiles to check the dotfiles
SOURCE_KEY: ./some/top/secret/key
DEST_KEY: "{{ lookup('env', 'HOME') }}/.ssh/ansible"

# USER will be the current logged in user or fallback to a default user 'mrgeek' in that case
USER: "{{ lookup('env', 'USER') or 'mrgeek' }}"

NERD_FONTS_VERSION: v2.1.0

# Global git user name and email
GIT_NAME: MrGeek
GIT_EMAIL: john@doe.com
```

## Run

To run the whole setup (not recommended) you need to have ansible installed, and run:

```bash
./install ALL
```

Otherwise it's recommended to just install using tags

```bash
./install neovim
./install languages
```
