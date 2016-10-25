if has('nvim')
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

Plug 'ekalinin/Dockerfile.vim'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'morhetz/gruvbox'
Plug 'Valloric/MatchTagAlways'

call plug#end()

" -------------------------------------------------------

:imap jk <Esc>
:imap JK <Esc>

function! Normalstyle()
  set tabstop=2
  set expandtab
  set autoindent
  set smartindent
  set shiftwidth=2
  set softtabstop=2
endfunction

function! Kernelstyle()
  set shiftwidth=8
  set tabstop=8
  set noexpandtab
  set softtabstop=0
endfunction

set ruler
set nowrap
set hlsearch
set backspace=indent,eol,start

set splitright
set splitbelow

" horizontal scrolling
map <C-L> 20zl
map <C-H> 20zh

" keep lines above/below cursor when scrolling
set scrolloff=3

set relativenumber
set number

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

set encoding=utf-8
set fileformats=unix,dos

set title

set backup
if !isdirectory($HOME . '/.vim/.undo')
  call mkdir($HOME . '/.vim/.undo', 'p', 0700)
endif
if !isdirectory($HOME . '/.vim/.backup')
  call mkdir($HOME . '/.vim/.backup', 'p', 0700)
endif
if !isdirectory($HOME . '/.vim/.swp')
  call mkdir($HOME . '/.vim/.swp', 'p', 0700)
endif
set undodir=$HOME/.vim/.undo//
set backupdir=$HOME/.vim/.backup//
set directory=$HOME/.vim/.swp//

" filetypes
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.gradle set filetype=groovy

" trim trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" detect file change, offer reload
au FocusGained,BufEnter,CursorHold * checktime

call Normalstyle()
