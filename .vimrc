" -------------------
" Plugins
" -------------------

" Auto install Vim-Plug if needed.
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a direct for plugins.
call plug#begin('~/.vim/plugged')

" Dracula Theme
" Plug 'dracula/vim', {'name': 'dracula'}

" Molokai Theme (Fatih)
Plug 'fatih/molokai'

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
" let g:dracula_italic = 0
" let g:dracula_colorterm = 0
" colorscheme dracula
colorscheme molokai

" Set color scheme to dark.
set background=dark

" ------------------
"  Settings
" ------------------
set nocompatible                " Enable Vim specific features
filetype off                    " Reset filetype detection
filetype plugin indent on       " Enable filetype detection
set autoindent                  " Enable Autoindent
set number                      " Show line numbers
set showcmd                     " Show cmd I am typing
set splitright                  " Vertical windows split to right
set splitbelow                  " Horizontal windows split to bottom
set colorcolumn=80              " highlight max column length
set encoding=utf-8              " set encoding
set expandtab                   " tabs to spaces

" ------------------
"  Plugin Settings
" ------------------

" vim-go
let g:go_fmt_command = "goimports"
