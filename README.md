Vimfiles
========

**Vim** files for OSX, Windows and Linux

## First time install for Mac OS X
1. Clone this repository:

        $ git clone git@github.com:minhhh/vimfiles.git ~/.vim
        $ cd ~/.vim && git submodule init
        $ git submodule update --recursive

2. Create symlinks to .vimrc and .gvimrc:

        $ ln -s ~/.vim/.vimrc ~/.vimrc

3. Install configured bundles:

Launch `vim` or `mvim`, run `:BundleInstall`

(or `vim +BundleInstall +qall` for CLI lovers)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/minhhh/vimfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

