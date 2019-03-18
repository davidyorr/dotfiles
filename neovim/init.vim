" python integration
let g:python_host_prog = '$HOME/.local/bin/python'
let g:python3_host_prog = '$HOME/.local/bin/python3'

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc