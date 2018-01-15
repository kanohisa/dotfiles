""""""""""""""""""""""""""""""""""""""
" dein_vim
""""""""""""""""""""""""""""""""""""""
if !&compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir)
endif

let &runtimepath = s:dein_repo_dir . ',' . &runtimepath 
let s:toml_file = fnamemodify(expand('<sfile>'), ':h') . '/.vim/rc/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

""""""""""""""""""""""""""""""""""""""
" setting
""""""""""""""""""""""""""""""""""""""
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set virtualedit=onemore
set showmatch
set laststatus=2
set wildmode=list:longest
set autoindent
set smartindent
set tabstop=2 
set shiftwidth=2
set smarttab
set ambiwidth=double
set whichwrap=b,s,h,l,<,>,[,],~
set list
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
syntax on

" indentLine
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '' "use ¦, ┆ or │

