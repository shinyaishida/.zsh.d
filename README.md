zsh
====

## Install

```bash
% mkdir <somewhere/you/wanna/put/it>
% cd !$
% git clone git@github.com:shinyaishida/zsh.git
% cd
% ln -s <somewhere/you/wanna/put/it>/zsh .zsh.d
% ls -s .zsh.d/zprofile .zprofile
% ln -s .zsh.d/zshenv .zshenv
% ln -s .zsh.d/zshrc .zshrc
```

## Usage

Edit ```.zsh.d/common``` to specify snippets to be loaded from ```.zshrc```. Snippets are stores in files named ```zsh_*```.

## License

[GPLv3](LICENSE)

## Author

[shinyaishida](https://github.com/shinyaishida)
