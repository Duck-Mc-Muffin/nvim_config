" Für Hilfe bei den Bezeichnungen für Tasten -> :help key-notation

" In einem anderen Projekt diese Datei im vertikalen Split öffnen
nnoremap <leader>ev :vsplit ~/.config/nvim/.vimrc<cr>

" Sonstiges
let mapleader = ' '
set nu rnu
set cursorline
set scrolloff=8
set showcmd
set showmode
set termguicolors

" Z und Y (vorrübergehend)
inoremap y z
inoremap z y
inoremap Y Z
inoremap Z Y
nnoremap z y
nnoremap zz yy

" Pfeiltasten deaktivieren (zum Lernen)
nnoremap <Up> <nop>
vnoremap <Up> <nop>
nnoremap <Right> <nop>
vnoremap <Right> <nop>
nnoremap <Down> <nop>
vnoremap <Down> <nop>
nnoremap <Left> <nop>
vnoremap <Left> <nop>

" Netrw File Explorer
let g:netrw_liststyle=3
nnoremap <leader>q :Ex<cr>

" vi Kompatibilität deaktivieren, um Probleme zu minimieren
set nocompatible

" Suche
set incsearch
set ignorecase
set nohlsearch
set showmatch
nnoremap n nzz
nnoremap N Nzz
nnoremap <leader>r :s/<C-r><C-w>/<C-r><C-w>/g<left><left>
nnoremap <leader>g :%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

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

" IDE type save mit Strg+s
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>i

" Code bewegen
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clip Board
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Yee
nnoremap J mzJ`z
nnoremap L :s/ /\r<cr>

" Void Register
nnoremap <leader>p "_dwP
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" TODO
" Zeilen auskommentieren
" augroup visual_commenting
"     autocmd!
"     autocmd FileType c,cpp,java,rust  let b:comment_symbol = '//'
"     autocmd FileType vim              let b:comment_symbol = '"'
"     autocmd FileType sh,vim,python    let b:comment_symbol = '#'
"     autocmd FileType tex              let b:comment_symbol = '%'
"     autocmd BufEnter * silent! vnoremap <silent> <C-_> :<C-u>keepp '<,'>s@^@\=b:comment_symbol<CR>
"     autocmd BufEnter * silent! exec 'vnoremap <silent> <C-?> :<C-u>keepp ''<,''>s@^' . b:comment_symbol . '@<CR>'
" augroup END
