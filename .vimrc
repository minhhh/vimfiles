"  ----------------------------------------------------------------------------
"  Vundle setup
" ----------------------------------------------------------------------------
filetype off      " Required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim  " Add vundle to the RuntimePath
call vundle#begin()
" Let Vundle manage Vundle. Required!
Plugin 'VundleVim/Vundle.vim'
" Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'xolox/vim-session'
Plugin 'tpope/vim-obsession'
Plugin 'xolox/vim-misc'
Plugin 'brailsmt/vim-plugin-minibufexpl'
" Plugin 'zefei/vim-wintabs'
" Plugin 'Shougo/neocomplcache.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'Raimondi/delimitMate'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'minhhh/vim-snippets'

" Various editing plugins
" Plugin 'kana/vim-textobj-user'
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-unimpaired'
Plugin 'bronson/vim-visual-star-search'
" Plugin 'ZoomWin'
" Plugin 'ervandew/supertab'
" Plugin 'tpope/vim-endwise'
" Plugin 'HarnoRanaivo/vim-neatfoldtext'
" Plugin 'maxbrunsfeld/vim-yankstack'

Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/closetag.vim'
Plugin 'vim-scripts/taglist.vim'
" Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'MarcWeber/vim-addon-local-vimrc'
" Plugin 'jpalardy/vim-slime'
Plugin 'eiginn/netrw'
" Plugin 'vim-scripts/DrawIt'


" Comment plugin
" Plugin 'tpope/vim-commentary'
Plugin 'tomtom/tcomment_vim'

" File managers/explorers
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wincent/command-t'

if executable('ack')
  Plugin 'mileszs/ack.vim'
endif

if executable('ag')
  Plugin 'rking/ag.vim'
endif

" Plugin 'mhinz/vim-startify'
" Plugin 'chrisbra/Recover.vim'

" Tmux plugins
if executable('tmux')
  " Plugin 'christoomey/vim-tmux-navigator'
  " Plugin 'sjl/vitality.vim'
endif

" Buffer plugins
"Plugin 'bufkill.vim'

" Ruby plugins
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'thoughtbot/vim-rspec'
" Plugin 'tpope/vim-bundler'
" Plugin 'nelstrom/vim-textobj-rubyblock'

" JSON plugins
" Plugin 'elzr/vim-json'

" Markdown plugins
" Plugin 'tpope/vim-markdown'
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'preservim/vim-markdown'

" PowerShell plugins
" Plugin 'dougireton/vim-ps1'

" Syntax check on buffer save
" Plugin 'scrooloose/syntastic'

" Clojure
" Plugin 'tpope/vim-fireplace'
" Plugin 'tpope/vim-leiningen'
" Plugin 'guns/vim-clojure-static'
" Plugin 'guns/vim-sexp'
" Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Python
" Plugin 'ivanov/vim-ipython'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'davidhalter/jedi-vim' " doesn't work nicely with Mutiple buffer

" Javascript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'

" C Sharp
" Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'

" Source Control plugins
"Plugin 'tpope/vim-git'
"Plugin 'tpope/vim-fugitive'
"Plugin 'gregsexton/gitv'
"Plugin 'mhinz/vim-signify'
"

call vundle#end()
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

" fix crontab: temp file must be edited in place
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

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
"" search first in current directory then file directory for tag file
set tags=tags,./tags

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
  set colorcolumn=110    " display a line in column 80 to show you
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

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }

function! LightLineFilename()
  return expand('%')
endfunction

let g:airline_extensions = []
" let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#tabline#enabled = 0
let g:airline_theme='tomorrow'

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
" if $TMUX == ""
  set clipboard=unnamed " Yank to the system clipboard by default
" endif

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
au FileType javascript call JavaScriptFold()

" ----------------------------------------------------------------------------
"  diff mode
" ----------------------------------------------------------------------------
if &diff
  set diffopt-=internal
  set diffopt+=vertical
endif



" ----------------------------------------------------------------------------
" Some useful key mappings.
" :Error
" ----------------------------------------------------------------------------
:let mapleader = "-"

nnoremap , "s
nnoremap ; :
vnoremap , "s
nnoremap , "s
:nmap <F2> :w<CR>
:imap <F2> <Esc>:w<CR>a
vnoremap <F3> :w !pbcopy<CR><CR><Esc>
:nmap <F4> :q<CR>:q<CR>
:imap <F4> <Esc>:q<CR>a
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Map buffer navigation
:nmap <leader>n :enew<CR>
:nmap <leader>u :b#<CR>
:nmap <leader>h :MBEOpen<CR>:MBEFocus<CR>h
:nmap <leader>l :MBEOpen<CR>:MBEFocus<CR>l
:nmap <leader>j :MBEOpen<CR>:MBEFocus<CR>h<CR>
:nmap <leader>k :MBEOpen<CR>:MBEFocus<CR>l<CR>
:nmap <leader>q :MBEbd!<CR>

" Switch to previous buffer
:imap <leader>h <Esc>:MBEOpen<CR>:MBEFocus<CR>h
:imap <leader>l <Esc>:MBEOpen<CR>:MBEFocus<CR>l
:imap <leader>q <Esc>:MBEbd!<CR>
let g:miniBufExplBRSplit = 0

" map <C-H> <Plug>(wintabs_previous)
" map <C-L> <Plug>(wintabs_next)
" nmap <leader>1 :WintabsGo 1<CR>
" nmap <leader>2 :WintabsGo 2<CR>
" nmap <leader>3 :WintabsGo 3<CR>
" nmap <leader>4 :WintabsGo 4<CR>
" nmap <leader>5 :WintabsGo 5<CR>
" nmap <leader>6 :WintabsGo 6<CR>
" nmap <leader>7 :WintabsGo 7<CR>
" nmap <leader>8 :WintabsGo 8<CR>
" nmap <leader>9 :WintabsGo 9<CR>
" map <leader>q :Bclose!<CR>

" Map syntastic
let g:syntastic_python_checkers = ['pylint']
:nmap <leader>b :SyntasticCheck<CR>:Errors<CR>
:nmap <leader>c :silent! cclose<CR>:lclose<CR>

" Map session stuff
" :nmap <leader>ss :silent! NERDTreeClose<CR>:silent! MBEClose<CR>:SaveSession!<CR>:silent! NERDTree<CR>:silent! MBEOpen<CR>:silent! wincmd l<CR>
" :nmap <leader>sl :silent! NERDTreeClose<CR>:silent! MBEClose<CR>:silent! OpenSession<CR>:silent! NERDTree<CR>:silent! MBEOpen<CR>:wincmd l<CR>
" :nmap <leader>sr :silent! MRU<CR>

" Easyalign
vnoremap <silent> <leader>a :EasyAlign<CR>

" CommandP
:nmap <C-p> :CtrlP system("pwd")<CR>
let g:ctrlp_map = ''
let g:ctrlp_cmd = ''
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
let g:ctrlp_lazy_update = 250
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
endif

" Convenient key mappings for everyday use
:nmap <leader>al :%s/\s\+$//<CR>
:nmap <leader>ab :retab<CR>
nnoremap <C-j> 2j
nnoremap <C-k> 2k
vnoremap <C-j> 2j
vnoremap <C-k> 2k
:nmap <leader>r :silent! edit<CR>
nnoremap [[ [{
nnoremap ]] ]}
vnoremap [[ [{
vnoremap ]] ]}
" :vmap <leader>f !tidy -qicbn -asxhtml -config ~/.dotfiles/.tidyconfig<CR><CR>
vnoremap <leader>f !astyle <CR>

" Convenient key to move lines and blocks up and down
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
"
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
"
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

autocmd FileType javascript vnoremap <buffer>  <C-f> :call RangeJsBeautify()<CR>
autocmd FileType javascript :nmap <C-f> gg V G :call RangeJsBeautify()<CR>
autocmd FileType json vnoremap <buffer> <C-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <C-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <C-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <C-f> :call RangeCSSBeautify()<cr>

" Map convenient mark with capital letter for it to work cross files
" let g:bookmark_highlight_lines = 1
" nnoremap ms :silent! BookmarkSave /tmp/.vim-bookmarks<CR>
" nnoremap ml :silent! BookmarkLoad /tmp/.vim-bookmarks<CR><CR>

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

" ----------------------------------------------------------------------------
" NerdTree settings
" ----------------------------------------------------------------------------
:let NERDTreeShowHidden=1
:let NERDTreeShowBookmarks=1
:let g:NERDTreeChDirMode=2
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=0
autocmd vimenter * :silent! NERDTree

" let g:bookmark_no_default_key_mappings = 1
" function! BookmarkMapKeys()
"     nmap mm :BookmarkToggle<CR>
"     nmap mi :BookmarkAnnotate<CR>
"     nmap mn :BookmarkNext<CR>
"     nmap mp :BookmarkPrev<CR>
"     nmap ma :BookmarkShowAll<CR>
"     nmap mc :BookmarkClear<CR>
"     nmap mx :BookmarkClearAll<CR>
" endfunction
" function! BookmarkUnmapKeys()
"     unmap mm
"     unmap mi
"     unmap mn
"     unmap mp
"     unmap ma
"     unmap mc
"     unmap mx
" endfunction
" autocmd BufEnter * :call BookmarkMapKeys()
" autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

" ----------------------------------------------------------------------------
" Session stuff
" ----------------------------------------------------------------------------
:let g:session_autosave=0
:let g:session_autoload='no'
:let g:session_default_to_last='no'
:let g:session_verbose_messages=0

" ----------------------------------------------------------------------------
" Qargs: Run command on quickfix results
" ----------------------------------------------------------------------------
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" ----------------------------------------------------------------------------
" Some useful abbr
" ----------------------------------------------------------------------------
source ~/.vim/.vimrc.abbr

" ----------------------------------------------------------------------------
" Markdown
" ----------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
set mmp=1000000 " Sometimes we have error in markdown file https://github.com/gu-fan/riv.vim/issues/144

" ----------------------------------------------------------------------------
" Omnisharp
" ----------------------------------------------------------------------------
" OmniSharp won't work without this setting
" filetype plugin on
"
" "This is the default value, setting it isn't actually necessary
" let g:OmniSharp_host = "http://localhost:2000"
"
" "Set the type lookup function to use the preview window instead of the status line
" "let g:OmniSharp_typeLookupInPreview = 1
"
" "Timeout in seconds to wait for a response from the server
" let g:OmniSharp_timeout = 1
"
" "Showmatch significantly slows down omnicomplete
" "when the first match contains parentheses.
" set noshowmatch
"
" "Super tab settings - uncomment the next 4 lines
" let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
" let g:SuperTabClosePreviewOnPopupClose = 1
"
" "don't autoselect first item in omnicomplete, show if only one item (for preview)
" "remove preview if you don't want to see any documentation whatsoever.
" set completeopt=longest,menuone,preview
" " Fetch full documentation during omnicomplete requests.
" " There is a performance penalty with this (especially on Mono)
" " By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" " you need it with the :OmniSharpDocumentation command.
" " let g:omnicomplete_fetch_documentation=1
"
" "Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
" "You might also want to look at the echodoc plugin
" set splitbelow
"
" " Get Code Issues and syntax errors
" let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" " If you are using the omnisharp-roslyn backend, use the following
" " let g:syntastic_cs_checkers = ['code_checker']
" augroup omnisharp_commands
"     autocmd!
"
"     "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
"     autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
"
"     " Synchronous build (blocks Vim)
"     "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
"     " Builds can also run asynchronously with vim-dispatch installed
"     autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
"     " automatic syntax check on events (TextChanged requires Vim 7.4)
"     " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
"
"     " Automatically add new cs files to the nearest project on save
"     autocmd BufWritePost *.cs call OmniSharp#AddToProject()
"
"     "show type information automatically when the cursor stops moving
"     " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"
"     "The following commands are contextual, based on the current cursor position.
"
"     autocmd FileType cs nnoremap <leader>og :OmniSharpGotoDefinition<cr>
"     autocmd FileType cs nnoremap <leader>of :OmniSharpFindUsages<cr>
"     " autocmd FileType cs nnoremap <leader>ofi :OmniSharpFindImplementations<cr>
"     " autocmd FileType cs nnoremap <leader>oft :OmniSharpFindType<cr>
"     " autocmd FileType cs nnoremap <leader>ofs :OmniSharpFindSymbol<cr>
"     "finds members in the current buffer
"     " autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
"     " cursor can be anywhere on the line containing an issue
"     autocmd FileType cs nnoremap <leader>ox  :OmniSharpFixIssue<cr>
"     autocmd FileType cs nnoremap <leader>ou :OmniSharpFixUsings<cr>
"     " autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
"     autocmd FileType cs nnoremap <leader>od :OmniSharpDocumentation<cr>
"     "navigate up by method/property/field
"     " autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
"     "navigate down by method/property/field
"     " autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
"
" augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
" set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" " rename with dialog
" nnoremap <leader>or :OmniSharpRename<cr>
" " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
" command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
"
" " Force OmniSharp to reload the solution. Useful when switching branches etc.
" nnoremap <leader>ol :OmniSharpReloadSolution<cr>
" nnoremap <leader>oc :OmniSharpCodeFormat<cr>
" " Load the current .cs file to the nearest project
" nnoremap <leader>otp :OmniSharpAddToProject<cr>
"
" " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
" nnoremap <leader>oss :OmniSharpStartServer<cr>
" nnoremap <leader>osp :OmniSharpStopServer<cr>
"
" " Add syntax highlighting for types and interfaces
" " nnoremap <leader>th :OmniSharpHighlightTypes<cr>
" "Don't ask to save when changing buffers (i.e. when jumping to a type definition)
" set hidden

" ----------------------------------------------------------------------------
" Bclose
" ----------------------------------------------------------------------------
" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute ':confirm :bdelete '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')

" ----------------------------------------------------------------------------
" Local vimrc
" ----------------------------------------------------------------------------
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}

" ----------------------------------------------------------------------------
" Allow overriding these settings
" ----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

