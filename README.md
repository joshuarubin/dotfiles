# dotfiles

Install `chezmoi` according to the [instructions](https://github.com/twpayne/chezmoi#installation).

```sh
chezmoi keyring set --service aws --user ngrok
chezmoi keyring set --service github --user homebrew # if on mac

git clone https://github.com/joshuarubin/dotfiles ~/.local/share/chezmoi
~/.local/share/chezmoi/scripts/init.sh
```
