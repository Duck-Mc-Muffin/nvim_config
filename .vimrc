" Für Hilfe bei den Bezeichnungen für Tasten -> :help key-notation

" TODO: Windows Stuff
"set fileformats=dos
"match Ignore /\r$/
"autocmd BufNewFile,BufRead *.cshtml set filetype=html.cshtml.razor
"autocmd BufNewFile,BufRead *.razor set filetype=html.cshtml.razor

" Sonstiges
let mapleader=' '
let maplocalleader=' '
set nu rnu
set cursorline
set scrolloff=8
set showcmd
set showmode
set termguicolors

" In einem anderen Projekt diese Datei im vertikalen Split öffnen
nnoremap <leader>ev :vsplit ~/.config/nvim/.vimrc<cr>

" TODO: Splits bewegen
"nnoremap <a-8> <c-w><
"nnoremap <a-9> <c-w>>

" Netrw File Explorer
let g:netrw_liststyle=3
"nnoremap <leader>q :Ex<cr>

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

" X Zeilen hoch und runter springen
nnoremap <a-j> 10j
nnoremap <a-k> 10k

" Sprünge über 10 in zur jump map hinzufügen
nnoremap <expr> k (v:count > 10 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 10 ? "m'" . v:count : '') . 'j'

" Einfacher aus insert mode raus wechseln
inoremap jj <Esc>

" IDE type save mit Strg+s
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>i

" Code bewegen
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Yee
nnoremap J mzJ`z
nnoremap L :s/ /\r<cr>

" Clip Board
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Void Register
nnoremap <leader>s "_diwP
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Leerzeile unterhalb einfügen
nnoremap <leader><leader> o<esc><up>

" Quickfix list
nnoremap <F8> :cn<cr>zz
nnoremap <F7> :cp<cr>zz
augroup qf_mappings
    autocmd!
    " Mit f die Stelle zeigen ohne in das Fenster zu wechseln
    autocmd FileType qf nnoremap <buffer> f <CR><Esc><C-w>w
augroup END

" Ez { ... }
nnoremap <leader>[ o{<CR>}<Up><Right><CR>
