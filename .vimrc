" -------------------
" Plugins
" -------------------

" Specify a direct for plugins.
call plug#begin('~/.vim/plugged')

" Dracula Theme
Plug 'dracula/vim', {'name': 'dracula'}

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" ------------------
"  Color settings
" ------------------

" Enable syntax highlighting
syntax on
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" Set color theme.
let g:dracula_italic = 0
let g:dracula_colorterm = 0
colorscheme dracula

" Set color scheme to dark.
set background=dark

filetype plugin indent on

set colorcolumn=80 " highlight max column length
set encoding=utf-8 " set encoding
set expandtab " tabs to spaces
set number " show line numbers

