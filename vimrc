" General Settings
syntax enable
filetype indent on


" Format Settings
set tabstop=2
set softtabstop=2
set expandtab
set number
set cursorline
set wildmenu
set lazyredraw
" set showmatch
set incsearch
set hlsearch
set laststatus=2
set bs=2
set nocompatible

" Exceptions
autocmd FileType make set noexpandtab 
autocmd FileType make set tabstop=4
autocmd FileType go   set noexpandtab
autocmd FileType go   set tabstop=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Plug Installs
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-scripts/vibrantink'
Plug 'sheerun/vim-polyglot'
call plug#end()


" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" MD Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 0



" Colors
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {'colorscheme': 'wombat', }

colorscheme vibrantink
highlight Comment cterm=italic
