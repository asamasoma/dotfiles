" Custom configuration.
set modelines=0 "CVE-2007-2438

set nocompatible

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

inoremap jk <ESC>

let mapleader = " "

filetype plugin indent on
syntax on
set number
set noswapfile
set ignorecase
set incsearch
set encoding=utf-8
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Easier code folding
set foldmethod=syntax
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set nobackup		" do not keep a backup file, use versions instead

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural-feeling splits
set splitbelow
set splitright

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <leader>vl :VimuxRunLastCommand<CR>

" Zoom the tmux runner pane
map <leader>vz :VimuxZoomRunner<CR>

" Use fzf
set rtp+=/usr/local/opt/fzf

if (has('termguicolors'))
  set termguicolors
endif

" Activate material colorscheme
let g:material_terminal_italics = 1
let g:material_theme_style = 'default' 
let g:airline_theme = 'material'
colorscheme material

" Fix italics in Vim
if !has('nvim')
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif

set updatetime=100

let NERDTreeShowHidden=1

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

map <C-n> :NERDTreeToggle<CR>

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
