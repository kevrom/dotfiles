set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Manage vundle
Plugin 'gmarik/Vundle.vim'

" General
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/CSApprox'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

" Color schemes
Plugin 'desert256.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'goatslacker/mango.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'wombat256.vim'
Plugin 'tomasr/molokai'
Plugin 'freeo/vim-kalisi'

" Template
Plugin 'digitaltoad/vim-jade'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'briancollins/vim-jst'

" HTML
Plugin 'mattn/emmet-vim'

" Javascript / JSON
Plugin 'walm/jshint.vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'

" Go
Plugin 'fatih/vim-go'
Plugin 'jstemmer/gotags'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'

" End plugin list
call vundle#end()
filetype plugin indent on

set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Set color scheme
set background=dark
colorscheme molokai

" Color scheme options
let g:solarized_termcolors=256
let g:rehash256=1

" Emmet options
let g:user_emmet_leader_key='<C-x>'

syntax on	" turn on syntax
let mapleader=" "
nnoremap <SPACE> <Nop>

augroup filetypedetect
	autocmd BufRead,BufNewFile *.md :set filetype=markdown
	autocmd BufRead,BufNewFile *.tag :set filetype=html
augroup END

set mouse=a	" enable mouse support if available

set tabstop=4
set shiftwidth=4
set showmatch
set ignorecase
set smartcase
set autoindent
set textwidth=0
set wrapmargin=0

set backspace=indent,eol,start

set modeline
set scrolljump=5

set undolevels=1000
set nowrap

set history=3000
set noexpandtab
set ruler
set noerrorbells visualbell t_vb=
set number

set scrolloff=3
set showcmd
set showfulltag
set showmode
set title
set laststatus=2
set cursorline
set nohlsearch
set incsearch
set clipboard^=unnamed
set hidden

" Close NERDTree if no other buffers present
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Set up backup and temp dirs
set backupdir=$VIMTEMP//
set directory=$VIMTEMP//

nnoremap <S-l> :bn<CR>
nnoremap <S-h> :bp<CR>

" Remaps
noremap <C-n> :NERDTreeToggle<CR>
" ctrl-p
nmap ; :CtrlPBuffer<CR>
nmap <F8> :TagbarToggle<CR>
inoremap {<CR> {<CR>}<C-o>O

nnoremap <Down> :m .+1<CR>==
nnoremap <Up> :m .-2<CR>==
inoremap <Down> <Esc>:m .+1<CR>==gi
inoremap <Up> <Esc>:m .-2<CR>==gi
vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv

" Golang tagbar config
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" Ignore certain directories with CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'


" A way to toggle PASTE mode
set pastetoggle=<F10>

" Retab
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

" Enable glyphs for powerline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

