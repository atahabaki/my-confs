"===============================================
"### Plugins
"===============================================
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'digitaltoad/vim-pug'
Plug 'rust-lang/rust.vim'
Plug 'ollykel/v-vim'
"===============================================
"### Themes
"===============================================
Plug 'sjl/badwolf', { 'as': 'badwolf' }
Plug 'sainnhe/gruvbox-material', { 'as': 'gruvbox-material' }
Plug 'atahabaki/archman-vim', { 'as': 'archman' }
Plug 'franbach/miramare', { 'as': 'miramare' }
Plug 'flrnd/candid.vim', { 'as': 'candid' }
Plug 'sainnhe/sonokai', {'as': 'sonokai'} 
Plug 'embark-theme/vim', { 'as': 'embark' }
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
if has('termguicolors')
	set termguicolors
endif
set background=dark
set nocompatible          "for milenium era...
set showmatch             "show matching brackets etc...
set ignorecase            "case insensitive searching
set hlsearch              "higlight search 
set wildmode=longest,list "get bash-like tab complete
filetype plugin indent on "get file-type specific indents...
syntax on
"===============================================
"### Themes (BadWolf)
"===============================================
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 0
let g:badwolf_css_props_highlight = 1
"===============================================
"### Themes (Sonokai)
"===============================================
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
"===============================================
"### Themes (Embark)
"===============================================
let g:embark_terminal_italics = 1
"===============================================
color sonokai
"===============================================
"### Keybindings
"===============================================
let mapleader=';'
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>rs :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>gs :call CocAction('jumpDefinition', 'vsplit')
nnoremap <F3> :set hlsearch!<CR>
nnoremap <Leader>rt :vs ~/Documents/Dox/tasx.md<CR>
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, -1)\<cr>" : "\<Left>"
"===============================================
"### PythonX
"===============================================
set pyxversion=3
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"
"===============================================
"### Rust
"===============================================
let g:rustfmt_autosave = 1
"===============================================
"### Status Line
"===============================================
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'   '.l:branchname.' ': ''
endfunction

set statusline=
set statusline+=%#htmlH1#
set statusline+=%{StatuslineGit()}
set statusline+=%#htmlH2#
set statusline+=\ %f
set statusline+=\ 
set statusline+=%m
set statusline+=%=
set statusline+=%#htmlH3#
set statusline+=\ %y
set statusline+=%#htmlH4#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=%#htmlH5#
set statusline+=\ %p%%
set statusline+=%#htmlH6#
set statusline+=\ %l:%c
set statusline+=\ 
