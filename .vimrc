" Für Hilfe bei den Bezeichnungen für Tasten -> :help key-notation

" Sonstiges
let mapleader = ' '
set nu rnu
set cursorline
set scrolloff=8

" Pfeiltasten deaktivieren (zum Lernen)
nnoremap <Up> <nop>
vnoremap <Up> <nop>
nnoremap <Right> <nop>
vnoremap <Right> <nop>
nnoremap <Down> <nop>
vnoremap <Down> <nop>
nnoremap <Left> <nop>
vnoremap <Left> <nop>

" Netrw
let g:netrw_liststyle=3

" In einem anderen Projekt diese Datei im vertikalen Split öffnen
nnoremap <leader>ev :vsplit ~/.config/nvim/.vimrc<cr>

" vi Kompatibilität deaktivieren, um Probleme zu minimieren
set nocompatible

" Suche
set incsearch
set ignorecase
set nohlsearch
set showmatch
nnoremap n nzz
nnoremap N Nzz

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" TODO
set showcmd
set showmode
set termguicolors

" Autocomplete
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Halbe Seiten hoch und runter springen
nnoremap <c-k> <c-u>zz
nnoremap <c-j> <c-d>zz
vnoremap <c-k> <c-u>zz
vnoremap <c-j> <c-d>zz

" Einfacher aus insert mode raus wechseln
inoremap jj <Esc>
inoremap <Esc> <nop>

" File Explorer
nnoremap <leader>q :Ex<Enter>

" Code bewegen
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clip Board
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Yee
nnoremap J mzJ`z
nnoremap L :s/ /\r<Enter>

" Void Register
nnoremap <leader>p "_dwP
nnoremap <leader>d "_d
vnoremap <leader>d "_d
