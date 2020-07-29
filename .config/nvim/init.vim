"===============================================
"### Plugins
"===============================================
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'digitaltoad/vim-pug'
"===============================================
"### Themes
"===============================================
Plug 'sainnhe/gruvbox-material', { 'as': 'gruvbox-material' }
Plug 'atahabaki/archman-vim', { 'as': 'archman' }
Plug 'franbach/miramare', { 'as': 'miramare' }
Plug 'flrnd/candid.vim', { 'as': 'candid' }
call plug#end()
"===============================================
"### General Configs
"===============================================
set ts=2 sw=2
set autoindent smartindent
set number numberwidth=1 relativenumber
set encoding=utf-8
syntax on
"for advanced searching...
set path+=**
"set wildmenu
set termguicolors
set background=dark
set nocompatible          "for milenium era...
set showmatch             "show matching brackets etc...
set ignorecase            "case insensitive searching
set hlsearch              "higlight search 
set wildmode=longest,list "get bash-like tab complete
filetype plugin indent on "get file-type specific indents...
syntax on
color gruvbox-material
"===============================================
"### Keybindings
"===============================================
let mapleader=';'
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>rs :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>gs :call CocAction('jumpDefinition', 'vsplit')
nnoremap <F3> :set hlsearch!<CR>
nnoremap <Leader>rt :vs ~/Documents/Dox/tasx.md<CR>
"===============================================
"### PythonX
"===============================================
set pyxversion=3
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"
