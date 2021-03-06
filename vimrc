try
    set runtimepath+=~/.Vim-Base-01
    set encoding=utf-8
    set viewdir=~/.Vim-Base-01/temp/viewdir
    set undodir=~/.Vim-Base-01/temp/undodir
    set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""
" LOADS PLUGINS USING PATHOGEN AND PLUG
""""""""""""""""""""""""""""""""""""""""""""""""""

execute pathogen#infect()

call plug#begin('~/.Vim-Base-01/plugged')

Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine' 
Plug 'sheerun/vim-polyglot' 
Plug 'w0rp/ale'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

let g:python3_host_prog = "/usr/local/bin/python3"
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start
filetype plugin on
filetype indent on
syntax enable

" available: gruvbox, vimhardaway, zenburn
colorscheme gruvbox
set background=dark
set t_Co=256

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set copyindent
set smartindent

set number relativenumber
set showcmd
set ruler
set nowrap
set hlsearch
set incsearch
set ignorecase
set history=500
set undolevels=1000
set hidden
set nobackup
set noswapfile
set autoread
set autowrite
set autowriteall
set pastetoggle=<F2>
set wildignore+=*/vendor/**

set spell
let g:PHP_outdentphpescape = 0

nnoremap ; :
nnoremap j gj
nnoremap k gk
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nmap <silent> ,/ :nohlsearch<CR>
map <leader>ss :setlocal spell!<cr>

" Save as sudo using :W
command W w !sudo tee % > /dev/null

set foldmethod=indent   
set foldnestmax=10
set foldlevel=1
set nofoldenable

" Save All Folds to temp/viewdir
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""
" SET FILETYPE FOR CUSTOM FILE EXTENSION
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set filetype to HTML is extension is .blade.php
" autocmd BufRead,BufNewFile *.blade.php set filetype=ht
" autocmd BufRead,BufNewFile *.vue set filetype=vue.html.javascript.css

""""""""""""""""""""""""""""""""""""""""""""""""""
" CONFIGURE PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd vimenter * NERDTree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=25
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = {
            \ 'dir':'\v[\/](boostrap|config|node_modules|public|storage|vendor)'
            \ }

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

let g:php_cs_fixer_rules = "@PSR2"   
