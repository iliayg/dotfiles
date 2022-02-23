:set encoding=utf-8
:set number
:set autoindent
:set shiftwidth=4
:set smarttab
:set tabstop=4
:set softtabstop=4
:set expandtab
:set mouse=a
:set fileformat=unix
:set clipboard+=unnamedplus
:set scrolloff=7
:set backspace=indent,eol,start
:set colorcolumn=109
:set pastetoggle=<F2>

nmap <F8> :TagbarToggle<CR>

let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'

let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

inoremap jk <esc>
noremap <space><esc> :nohlsearch<cr>
syntax enable

map gs :split
map <silent> gv :vsplit
" open new split panes below
set splitbelow

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+t
function! OpenTerminal()
split term://zsh
resize 10
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif

nnoremap <silent> <C-a> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeWinSize = 24

autocmd StdinReadPre * let s:std_in=1
" Start NERDTree when Vim is started without file arguments.
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:python3_host_prog='/bin/python3'
autocmd filetype python map <buffer> <f9> :w<cr>:exec '!python3' shellescape(@%, 1)<cr>

source $HOME/.config/nvim/vim-plug/plugins.vim
