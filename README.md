### Installation

Requires vim and python 3. On mac:

```
$ brew install macvim python3
$ pip3 install --user pynvim

```

Or neovim with python 3 support:
```
$ brew install neovim python3
$ pip3 install --upgrade neovim
```

`git clone git://github.com/robinclowers/vimfiles.git ~/.vim && ~/.vim/setup.sh`

Switched the Ack plugin to use
[Ripgrep](https://github.com/BurntSushi/ripgrep)
Install OSX: `brew install ripgrep`

For xmpfilter:

```
$ gem install rcodetools fastri
```

Uses a different [matcher for
ctrlp](https://github.com/JazzCore/ctrlp-cmatcher) that is written in C. The
`setup.sh` will build it, but you should have `python-dev` installed if you do
not.

### Attributions

Most of this config was built by [Aaron Jensen](https://github.com/aaronjensen).
Inconsolata-g was originally from http://leonardo-m.livejournal.com/77079.html
Many things stolen from Gary Bernhardt: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
