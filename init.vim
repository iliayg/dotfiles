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

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

map gn :bn<cr>
map gp :bp<cr>
map gw :bclose<cr>

inoremap jk <esc>
noremap <space><esc> :nohlsearch<cr>
syntax enable

" open new split panes to right and below
set splitbelow

" turn terminal to normal mode with escape
tnoremap <esc> <C-\> <C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+t
function! OpenTerminal()
split term://zsh
resize 10
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>


nnoremap <silent> <C-a> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 1
" Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:python3_host_prog='/usr/bin/python3'
autocmd filetype python map <buffer> <f9> :w<cr>:exec '!python3' shellescape(@%, 1)<cr>

source $HOME/.config/nvim/vim-plug/plugins.vim
