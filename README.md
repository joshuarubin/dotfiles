# dotfiles

Install `pass` according to the [instructions](https://www.passwordstore.org/).
Install `chezmoi` according to the [instructions](https://github.com/twpayne/chezmoi#installation).

```sh
git clone https://github.com/joshuarubin/pass ~/.password-store
git clone https://github.com/joshuarubin/dotfiles ~/.local/share/chezmoi
~/.local/share/chezmoi/scripts/init.sh
```

Don’t forget to edit `~/.config/chezmoi/chezmoi.yaml`
