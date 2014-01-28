" My local .vimrc file
" Maintained by: Dauren Dauletov
" daur1kz@gmail.com
" http://tedd1.com
" Based on:
"   Jeffrey Way's (jeffrey@jeffrey-way.com) version
"   gmarik (https://github.com/gmarik/vimfiles/blob/master/vimrc)
"

" Remove compatibility with Vi.
set nocompatible

" Number of things to remember in history
set history=256

set t_Co=256

syntax on           " Enable sytax

" Write the old file out when switching between files
set autowrite
set autoread

" Display current cursor position in lower right corner
set ruler
set colorcolumn=80

" Lower the timeout lag after typing the leader key + command
set timeoutlen=250

" Switch between buffers without saving
set hidden

" Set font type and size. Depends on the resolution. Larger screens prefer h15
" set guifont=Ubuntu\ Mono\ 12

" Tabs stuff
set tabstop=4
set shiftwidth=4
set shiftround      " round indent to multiple of 'shiftwidth'
set softtabstop=4
set expandtab
set smarttab

" Backspace
set backspace=indent
set backspace+=eol
set backspace+=start

" Show command in bottom right portion of the screen
set shortmess=atI
set showcmd

" Show line numbers relative
set number
set relativenumber

" Indent stuff
set smartindent
set autoindent
set cindent
set indentkeys-=0#      " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

" Always show the status line
set laststatus=2

" Custom status line
set statusline=%<%f\
set stl+=[%{&ff}]
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

" Prefer a slightly higher line height?
" set linespace=3

" Don't wrap lines by default
set nowrap
set textwidth=0

" Formatting
set fo+=o       " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal model
set fo-=r       " Do not automatically insert a comment leader after an enter
set fo-=t       " Do no auto-wrap text using textwidth (does not apply to comments)

" Set incremental searching
set incsearch

" Highlight search
set hlsearch!
nnoremap <F3> :set hlsearch!<cr>

" Case insensitive search
set ignorecase
set smartcase

" Set custom leader and local leader
" let mapleader=','
let maplocalleader='    '

" Hide MacVim toolbar by default
set go-=T

" Hard-wrap paragraphs of text
nnoremap <leader>q gqip

" Enable code folding
set foldenable
set foldmethod=marker
set foldlevel=100
set foldopen=block,hor,tag
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block

" Hide mouse when typing
set mouse=a         " enable mouse in GUI mode
set mousehide

" Show matching brackets
set showmatch
set matchtime=2     " braket blinking

" At command line, complete longest common string, then list alternatives
set wildmode=longest,list

" Disable blinking, sounds
set novisualbell        " no blinking
set noerrorbells        " no noise
set vb t_vb=            " disable any beeps or flashes on error

set completeopt+=preview

" Shortcut to fold tags with leader + ft
nnoremap <leader>ft Vatzf

" Create dictionary for custom expansions
set dictionary+=~/.vim/dict.txt

" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

" Split windows below the current window
set splitbelow
set splitright

" Disable unprintable characters F12 - switches
set list
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<cr>
set invlist

" Disable backup
set nobackup
set nowritebackup
set directory=/tmp//
set noswapfile

" Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

" Shortcut for editing .vimrc file in a new tab
nmap ,ev :tabedit $MYVIMRC<cr>

" Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

" Faster shortcut for commenting. Requires T-Comment plugin
map ,c <c-_><c-_>

" Saves time; maps the semicolon to colon
nnoremap ; :
vnoremap ; :

" Map code completion to , + tab
imap ,<tab> <C-x><C-o>

" Map escape key to jk -- much faster
imap jk <esc>

" Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1, " . bufnr('$') . "bd"<cr>

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the .vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

if has('gui_running')
    set guioptions=cMg      " console dialogs, do not show menu and toolbar

    " Fonts
    " :set guifont=*        " to launch a GUI dialog
    if has('mac')
        set guifont=Andale\ Mono:h13
    else
        set guifont=Terminus:h16
    end

    if has('mac')
        set noantialias
        " set fullscreen
    endif
endif

"------------------------"
" Key bindings
"------------------------"
" Duplication
nnoremap <leader>c mz"dyy"dp`z
vnoremap <leader>c "dymz"dP`z

" Tabs
nnoremap <A-h> :tabprev<cr>
nnoremap <A-l> :tabnext<cr>

" Buffers
nnoremap <localleader>- :bd<CR>
nnoremap <localleader>-- :bd!<CR>

" copy filename 
map <silent> <leader>. :let @+=expand('%:p').':'.line('.')<CR>
" copy path
map <silent> <leader>/ :let @+=expand('%:p:h')<CR>

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> <C-k> <C-W><C-k>
nmap <silent> <C-j> <C-W><C-j>
nmap <silent> <C-h> <C-W><C-h>
nmap <silent> <C-l> <C-W><C-l>

" vertical paragraph-movement
" nmap <C-J> {
" nmap <C-K> }

"------------------------"
" Scripts and plugins
"------------------------"
filetype off        " Required by Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Required by vundle
Bundle 'gmarik/vundle'

" Git wrapper for vim
Bundle 'tpope/vim-fugitive'

" Syntax and error highlighter for Vim
Bundle 'Syntastic'

" The silver searcher
Bundle 'rking/ag.vim'

" ctrlp.vim
Bundle 'kien/ctrlp.vim'

" Powerful Vim undo
Bundle 'mbbill/undotree'
nnoremap <F5> :UndotreeToggle<cr>

" Quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

" Comment Vim plugin
Bundle 'tomtom/tcomment_vim'

" For text filtering and alignment
Bundle 'godlygeek/tabular'

" ctrlp c matching
Bundle 'JazzCore/ctrlp-cmatcher'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" status bar for vim
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts=1

Bundle 'scrooloose/nerdtree.git'
nmap ,nt :NERDTreeToggle<cr>

" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" Autoopen NERDTree and focus cursor in new document
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

Bundle 'Rykka/colorv.vim'
" needed for fetching schemes online.
Bundle 'mattn/webapi-vim'

" Color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'zeis/vim-kolor'
Bundle 'morhetz/gruvbox'

filetype plugin indent on

" Spelling correction. Add yours below.
iab teh the
iab Teh The

set background=dark
colorscheme kolor

