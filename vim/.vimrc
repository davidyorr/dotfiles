if has('nvim')
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/xoria256.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Valloric/MatchTagAlways'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'suan/vim-instant-markdown'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

if filereadable(expand('$HOME/.dotfiles/.machine/.vimrc.plugins'))
	source $HOME/.dotfiles/.machine/.vimrc.plugins
endif

call plug#end()

" -------------------------------------------------------

:imap jk <Esc>
:imap JK <Esc>

" disable mouse
set mouse=

set laststatus=2 " needed for lightline

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
" highlight current line
set cursorline

" MatchTagAlways for different filetypes
let g:mta_filetypes = { 'html': 1, 'xhtml': 1, 'xml': 1, 'jinja': 1, 'javascript.jsx': 1 }

" flowtype syntax highlighting
let g:javascript_plugin_flow = 1

" extend the color scheme's background color to the whole terminal screen
" http://serverfault.com/a/485732
set t_ut=

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" color scheme
if has('nvim')
  silent! colorscheme base16-gruvbox-light-medium
else
	silent! colorscheme xoria256
endif

set encoding=utf-8
set fileformats=unix,dos

" don't force files to end with a newline character
set noendofline
set nofixendofline

set title

set backupcopy=yes
" set backup
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

" fzf
let $FZF_DEFAULT_COMMAND= 'ag -g "" --hidden'
nnoremap <silent> <C-p> :FZF -m<CR>

" nerdtree
nnoremap <F2> :NERDTreeToggle<CR>

" set path to the root of the git repository or the current directory
let git_root_dir = get(systemlist('git rev-parse --show-toplevel'), 0, $PWD)
if !v:shell_error
	let &path=git_root_dir . '/**'
else
	set path=$PWD/**
endif

" fix cursor in neovim
if has('nvim')
	set guicursor=
endif

" paste buffer into current word
nnoremap <C-j> ciw<C-R>0<ESC>

call Normalstyle()

if filereadable(expand('$HOME/.dotfiles/.machine/.vimrc'))
	source $HOME/.dotfiles/.machine/.vimrc
endif