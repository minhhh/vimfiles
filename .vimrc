"  ----------------------------------------------------------------------------
"  Vundle setup
" ----------------------------------------------------------------------------
filetype off      " Required for Vundle

set rtp+=~/.vim/bundle/vundle/  " Add vundle to the RuntimePath
call vundle#rc()

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
"Bundle 'vim-scripts/AutoComplPop' # comment since this seems to slow vim down
"for me
" Bundle 'SirVer/ultisnips'
Bundle 'junegunn/vim-easy-align'
Bundle 'tpope/vim-surround'
Bundle 'jiangmiao/auto-pairs'
" Bundle "MarcWeber/vim-addon-mw-utils"
" Bundle "tomtom/tlib_vim"
" Bundle "garbas/vim-snipmate"
" Bundle "honza/vim-snippets"

" Various editing plugins
" Bundle 'kana/vim-textobj-user'
" Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-unimpaired'
Bundle 'nelstrom/vim-visual-star-search'
" Bundle 'ZoomWin'
" Bundle 'ervandew/supertab'
" Bundle 'tpope/vim-endwise'
" Bundle 'godlygeek/tabular'
" Bundle 'HarnoRanaivo/vim-neatfoldtext'
" Bundle 'maxbrunsfeld/vim-yankstack'

" Comment plugin
Bundle 'tpope/vim-commentary'

" File managers/explorers
Bundle 'kien/ctrlp.vim'

if executable('ack')
  Bundle 'mileszs/ack.vim'
endif

if executable('ag')
  Bundle 'rking/ag.vim'
endif

" Bundle 'mhinz/vim-startify'
Bundle 'chrisbra/Recover.vim'

" Tmux plugins
if executable('tmux')
  " Bundle 'christoomey/vim-tmux-navigator'
  " Bundle 'sjl/vitality.vim'
endif

" Buffer plugins
"Bundle 'bufkill.vim'

" Ruby plugins
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'thoughtbot/vim-rspec'
" Bundle 'tpope/vim-bundler'
" Bundle 'nelstrom/vim-textobj-rubyblock'

" JSON plugins
Bundle 'elzr/vim-json'

" Markdown plugins
Bundle 'tpope/vim-markdown'

" PowerShell plugins
" Bundle 'dougireton/vim-ps1'

" Wiki
" Bundle 'vimwiki'

" Syntax check on buffer save
Bundle 'scrooloose/syntastic'

" Source Control plugins
"Bundle 'tpope/vim-git'
"Bundle 'tpope/vim-fugitive'
"Bundle 'gregsexton/gitv'
"Bundle 'mhinz/vim-signify'

if has('autocmd')
  filetype plugin indent on   " Turn on Filetype detection, plugins, and
                              " indent
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable     " Turn on syntax highlighting
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" load the man plugin for a nice man viewer
runtime! ftplugin/man.vim

" ----------------------------------------------------------------------------
"  moving around, searching and patterns
" ----------------------------------------------------------------------------
set nostartofline     " keep cursor in same column for long-range motion cmds

if exists("+undofile")
  set undodir=/tmp
endif
set dir=~/.vimswap//,/var/tmp//,/tmp//

" ----------------------------------------------------------------------------
"  tags
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  displaying text
" ----------------------------------------------------------------------------
set scrolloff=3       " number of screen lines to show around
" the cursor

set showbreak=↪\ \    " string to put before wrapped screen lines

set sidescrolloff=2   " min # of columns to keep left/right of cursor
set display+=lastline " show last line, even if it doesn't fit in the window

set cmdheight=2       " # of lines for the command window
                      " cmdheight=2 helps avoid 'Press ENTER...' prompts

" Define characters to show when you show formatting
" stolen from https://github.com/tpope/vim-sensible
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif

set number            " show line numbers

" ----------------------------------------------------------------------------
"  syntax, highlighting and spelling
" ----------------------------------------------------------------------------
colorscheme Tomorrow

if exists('+colorcolumn')
  set colorcolumn=80    " display a line in column 80 to show you
                        " where to line break.
endif

" ----------------------------------------------------------------------------
"  multiple windows
" ----------------------------------------------------------------------------
set laststatus=2      " Show a status line, even if there's only one
                      " Vim window

set hidden            " allow switching away from current buffer w/o
                      " writing

set switchbuf=usetab  " Jump to the 1st open window which contains
                      " specified buffer, even if the buffer is in
                      " another tab.
                      " TODO: Add 'split' if you want to split the
                      " current window for a quickfix error window.

" set statusline=
" set statusline+=b%-1.3n\ >                    " buffer number
" set statusline+=\ %{fugitive#statusline()}:
" set statusline+=\ %F
" set statusline+=\ %M
" set statusline+=%R
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%=
" set statusline+=\ %Y
" set statusline+=\ <\ %{&fenc}
" set statusline+=\ <\ %{&ff}
" set statusline+=\ <\ %p%%
" set statusline+=\ %l:
" set statusline+=%02.3c    " cursor line/total lines

set helpheight=30         " Set window height when opening Vim help windows

" ----------------------------------------------------------------------------
"  multiple tab pages
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  terminal
" ----------------------------------------------------------------------------
set ttyfast           " this is the 21st century, people

" ----------------------------------------------------------------------------
"  using the mouse
" ----------------------------------------------------------------------------
set mouse=v
" ----------------------------------------------------------------------------
"  GUI              " Set these options in .gvimrc
" See help for 'setting-guifont' for tips on how to set guifont on Mac vs Windows
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  printing
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  messages and info
" ----------------------------------------------------------------------------

set showcmd         " In the status bar, show incomplete commands
                    " as they are typed

" set noshowmode      " don't display the current mode (Insert, Visual, Replace)
                    " in the status line. This info is already shown in the
                    " Powerline status bar.

set ruler           " Always display the current cursor position in
                    " the Status Bar

set confirm         " Ask to save buffer instead of failing when executing
                    " commands which close buffers

" ----------------------------------------------------------------------------
"  selecting text
" ----------------------------------------------------------------------------

" See http://stackoverflow.com/questions/11404800/fix-vim-tmux-yank-paste-on-unnamed-register
if $TMUX == ""
  set clipboard=unnamed " Yank to the system clipboard by default
endif

" ----------------------------------------------------------------------------
"  editing text     " TODO: look at these options
" ----------------------------------------------------------------------------
set backspace=indent,eol,start  "backspace over everything

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j    " delete comment char on second line when
                          " joining two commented lines
endif

set showmatch             " when inserting a bracket, briefly jump to its
                          " match

set nojoinspaces          " Use only one space after '.' when joining
                          " lines, instead of two

set completeopt+=longest  " better omni-complete menu

set nrformats-=octal      " don't treat numbers with leading zeros as octal
                          " when incrementing/decrementing

" ----------------------------------------------------------------------------
"  tabs and indenting
" ----------------------------------------------------------------------------
set tabstop=4             " tab = 2 spaces
set shiftwidth=4          " autoindent indents 2 spaces
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set softtabstop=4
set nosmartindent
set shiftround            " round to 'shiftwidth' for "<<" and ">>"
set expandtab
set smartcase
set hlsearch
set incsearch         " Highlight pattern matches as you type
set ignorecase        " ignore case when using a search pattern

" ----------------------------------------------------------------------------
"  folding
" ----------------------------------------------------------------------------
if has('folding')
  set nofoldenable        " When opening files, all folds open by default
endif

set foldtext=NeatFoldText()

" ----------------------------------------------------------------------------
"  diff mode
" ----------------------------------------------------------------------------
set diffopt+=vertical       " start diff mode with vertical splits by default
set diffopt+=vertical       " diff mode with vertical splits please

" ----------------------------------------------------------------------------
" Some useful key mappings.
" ----------------------------------------------------------------------------
nnoremap ; :
vnoremap , "s
nnoremap , "s
:nmap <F2> :w<CR>
:imap <F2> <Esc>:w<CR>a
:map - $
:nmap <F4> :q<CR>
:imap <F4> <Esc>:q<CR>a
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
noremap <C-f> :Ack -Q --smart-case

" Map buffer navigation
:let mapleader = "-"
:nmap <leader>n :enew<CR>
:nmap <leader>h :MBEOpen<CR>:MBEFocus<CR>h
:nmap <leader>l :MBEOpen<CR>:MBEFocus<CR>l
:nmap <leader>mo :MBEToggle<CR>
:nmap <leader>mf :MBEFocus<CR>
:nmap <leader>w :MBEbd<CR>
:nmap <leader>q :MBEbd!<CR>
:nmap <leader>u :b#<CR>
:imap <leader>h <Esc>:MBEOpen<CR>:MBEFocus<CR>h
:imap <leader>w <Esc>:MBEbd<CR>
:imap <leader>q <Esc>:MBEbd!<CR>
:imap <leader>u <Esc>:b#<CR>

" Map syntastic
:nmap <leader>b :SyntasticCheck<CR>:Errors<CR>
:nmap <leader>c :silent! cclose<CR>:lclose<CR>

" Map session stuff
:nmap <leader>ss :silent! NERDTreeClose<CR>:silent! MBEClose<CR>:SaveSession!<CR>:silent! NERDTree<CR>:silent! MBEOpen<CR>:silent! wincmd l<CR>
:nmap <leader>sl :silent! NERDTreeClose<CR>:silent! MBEClose<CR>:silent! OpenSession<CR>:silent! NERDTree<CR>:silent! MBEOpen<CR>:wincmd l<CR> " Fix the issue with MBE, reopen NerdTree too
:nmap <leader>sr :silent! MRU<CR>

" Easyalign
vnoremap <silent> <leader>a :EasyAlign<CR>

" CommandP
:nmap <C-p> :CtrlP system("pwd")<CR>
let g:ctrlp_map = ''
let g:ctrlp_cmd = ''
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'

" Convenient key mappings for everyday use
:nmap <leader>al :%s/\s\+$//<CR>
:nmap <leader>ab :retab<CR>
nnoremap <C-j> 5j
nnoremap <C-k> 5k
vnoremap <C-j> 5j
vnoremap <C-k> 5k
:nmap <leader>r :silent! edit<CR>
:imap dw <C-w>

" Disable spelling and wrapline
au BufNewFile,BufRead,BufEnter *.* set nospell
au BufNewFile,BufRead,BufEnter *.* set wrap linebreak textwidth=0

" ----------------------------------------------------------------------------
"  reading and writing files
" ----------------------------------------------------------------------------
set autoread                " Automatically re-read files changed outside
                            " of Vim

" ----------------------------------------------------------------------------
"  the swap file
" ----------------------------------------------------------------------------

" Set swap file, backup and undo directories to sensible locations
" Taken from https://github.com/tpope/vim-sensible
" The trailing double '//' on the filenames cause Vim to create undo, backup,
" and swap filenames using the full path to the file, substituting '%' for
" and swap filenames using the full path to the file, substituting '%' for
" '/', e.g. '%Users%bob%foo.txt'
let s:dir = has('win32') ? '$APPDATA/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif
endif
if exists('+undofile')
  set undofile
endif

" ----------------------------------------------------------------------------
"  command line editing
" ----------------------------------------------------------------------------
set history=200     " Save more commands in history
                    " See Practical Vim, by Drew Neil, pg 68

set wildmode=list:longest,full

" File tab completion ignores these file patterns
set wildignore+=*.exe,*.swp,.DS_Store
set wildmenu

" Add guard around 'wildignorecase' to prevent terminal vim error
if exists('&wildignorecase')
  set wildignorecase
endif

" ----------------------------------------------------------------------------
"  executing external commands
" ----------------------------------------------------------------------------

if has("win32") || has("gui_win32")
  if executable("PowerShell")
    " Set PowerShell as the shell for running external ! commands
    " http://stackoverflow.com/questions/7605917/system-with-powershell-in-vim
    set shell=PowerShell
    set shellcmdflag=-ExecutionPolicy\ RemoteSidned\ -Command
    set shellquote=\"
    " TODO: shellxquote must be a literal space character.
    " Fix my trim trailing whitespace command to not run automatically on save
    set shellxquote=
  endif
endif

" ----------------------------------------------------------------------------
"  running make and jumping to errors
" ----------------------------------------------------------------------------

if executable('grep')
  set grepprg=grep\ --line-number\ -rIH\ --exclude-dir=tmp\ --exclude-dir=.git\ --exclude=tags\ $*\ /dev/null
endif

" ----------------------------------------------------------------------------
"  language specific
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  multi-byte characters
" ----------------------------------------------------------------------------
set encoding=utf-8

" ----------------------------------------------------------------------------
" Autocmds
" ----------------------------------------------------------------------------

" Make gf work on Chef include_recipe lines
" Add all cookbooks/*/recipe dirs to Vim's path variable
autocmd BufRead,BufNewFile */cookbooks/*/recipes/*.rb setlocal path+=recipes;/cookbooks/**1

" ----------------------------------------------------------------------------
" Whitespace stuff
" ----------------------------------------------------------------------------
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" NerdTree settings
:let NERDTreeShowHidden=1
:let NERDTreeShowBookmarks=1
:let g:NERDTreeChDirMode=2
autocmd vimenter * :silent! NERDTree

" ----------------------------------------------------------------------------
" Session stuff
" Update: unfortunately this doesn't work well with MiniBufExplorer
" ----------------------------------------------------------------------------
:let g:session_autosave=0
:let g:session_autoload='no'
:let g:session_default_to_last='yes'
:let g:session_verbose_messages=0

" ----------------------------------------------------------------------------
" Allow overriding these settings
" ----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif