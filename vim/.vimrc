" vundle (plugin manager) - https://github.com/gmarik/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ekalinin/Dockerfile.vim'
Bundle 'digitaltoad/vim-jade'
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'
set laststatus=2 " needed for lightline
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|\v[\/]\.(git)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_show_hidden = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -------------------------------------------------------

:imap jk <Esc>
:imap JK <Esc>

fu! Normalstyle()
set tabstop=4
set expandtab
set autoindent
set si
set shiftwidth=4
endf

fu! Kernelstyle()
set sw=8
set ts=8
set noexpandtab
endf

set ruler
set nowrap
set hlsearch
set backspace=indent,eol,start

set splitright
set splitbelow

" horizontal scrolling
map <C-L> 20zl
map <C-H> 20zh

" extend the color scheme's background color to the whole terminal screen
" http://serverfault.com/a/485732
set t_ut=

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

syntax on
colorscheme desert
if filereadable( expand("~/.vim/bundle/vim-colorschemes/colors/xoria256.vim") )
    colorscheme xoria256
endif

" keep lines above/below cursor when scrolling
set scrolloff=3

set relativenumber
set number

set encoding=utf-8
set fileformats=unix,dos

set title

set backup
if !isdirectory("~/.vim/.undo")
  call mkdir("~/.vim/.undo", "p", 0700)
endif
if !isdirectory("~/.vim/.backup")
  call mkdir("~/.vim/.backup", "p", 0700)
endif
if !isdirectory("~/.vim/.swp")
  call mkdir("~/.vim/.swp", "p", 0700)
endif
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" filetypes
au BufRead,BufNewFile *.rs set filetype=rust

" trim trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" detect file change, offer reload
au FocusGained,BufEnter,CursorHold * checktime

call Normalstyle()
