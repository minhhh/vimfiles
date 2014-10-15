Vimfiles
========

Vim files for OSX, Windows and Linux

## First time install for Mac OS X
1. Clone this repository:

        $ git clone git@bitbucket.org:minhhh/vimfiles.git ~/.vim
        $ git submodule init
        $ git submodule update --recursive

2. Create symlinks to .vimrc and .gvimrc:

        $ ln -s ~/.vim/vimrc ~/.vimrc

3. Install configured bundles:

Launch `vim` or `mvim`, run `:BundleInstall`

(or `mvim +BundleInstall +qall` for CLI lovers)
