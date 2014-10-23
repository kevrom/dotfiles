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

" Color schemes
Plugin 'desert256.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'goatslacker/mango.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'wombat256.vim'
Plugin 'tomasr/molokai'

" Template
Plugin 'digitaltoad/vim-jade'
Plugin 'mustache/vim-mustache-handlebars'

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

" End plugin list
call vundle#end()
filetype plugin indent on

set t_Co=256

" Set color scheme
set background=dark
colorscheme molokai

" Color scheme options
let g:solarized_termcolors=256
let g:rehash256=1

syntax on	" turn on syntax
let mapleader=","

" au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown

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

" Close NERDTree if no other buffers present
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Set up backup and temp dirs
set backupdir=$VIMTEMP//
set directory=$VIMTEMP//

" Remaps
noremap <C-n> :NERDTreeToggle<CR>
map <S-l> gt
map <S-h> gT
" ctrl-p
nmap ; :CtrlPBuffer<CR>
nmap <F8> :TagbarToggle<CR>


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


" Remap CtrlP to open in tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Ignore certain directories with CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'


" A way to toggle PASTE mode
set pastetoggle=<F10>


" Enable airline tabs
let g:airline#extensions#tabline#enabled = 1

" Enable glyphs for powerline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

