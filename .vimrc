set nocompatible

" Automatically download `plug` if it is not present.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Managing Plugins.
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
" Snippets
Plug 'honza/vim-snippets'

" vim-lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'sheerun/vim-wombat-scheme'
Plug 'rafi/awesome-vim-colorschemes'

" TODO: is the workaround still needed?
Plug 'junegunn/fzf', {'do': { -> fzf#install() }, 'commit': '3f75a83' }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'

Plug 'preservim/tagbar'
Plug 'ctrlpvim/ctrlp.vim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
call plug#end()
" the glaive#Install() should go after the "call plug#end()"
call glaive#Install()

" Automatically install missing plugins on startup.
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

let mapleader=","

augroup autoformat_settings
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType python AutoFormatBuffer yapf
augroup END


" TODO: learn nerdcommenter
" TODO: learn tagbar

" ctrl-p
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'c'

colorscheme wombat

" Tab and indent settings
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set colorcolumn=80
set ignorecase
set number

" Incremental searching.
set incsearch
set hlsearch

" History list.
set history=5000
" Show column and row position of cursor.
set ruler
" Display incomplete commands.
set showcmd
set showmode
set noro
" Set text width for auto break line.
set textwidth=80

" Allow backspacing over everything in insert mode indent: over autoindent
" eol: over end of line start: over the start of insert.
set backspace=indent,eol,start
" do bash style <tab> completion
set wildmode=longest,list,full
set wildmenu

"------------------
" Backup settings
"------------------
if has("vms")
  "don't keep backup file, use versions
  set nobackup		
else
  " keep a backup file
  set backup		
endif
" Put them in a place together.
set backupdir-=.
set backupdir^=/tmp

"----------------
" mouse setting
"----------------
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

