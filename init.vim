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
:set ic

let g:vdebug_keymap = {
    \    "get_context" : "<F5>",
    \    "run" : "<F10>",
    \    "run_to_cursor" : "<F9>",
    \    "step_over" : "<F2>",
    \    "step_into" : "<F3>",
    \    "step_out" : "<F4>",
    \    "close" : "<F6>",
    \    "detach" : "<F7>",
    \    "set_breakpoint" : "<F1>",
    \    "eval_under_cursor" : "<F12>",
    \    "eval_visual" : "<Leader>e",
    \}
let g:VM_maps = {}
let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_default_mappings = 0
let g:VM_mouse_mappings = 1

syntax enable
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l
inoremap jk <esc>
noremap <space><esc> :nohlsearch<cr>
map <C-c> :q!<cr>
map <C-s> :w<cr>

nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

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
let g:Terminal_CWInsert = 1

nnoremap <silent> <F8> :TagbarToggle<CR>
" let g:tagbar_indent = 0
let g:tagbar_width = max([25, winwidth(0) / 6])
let g:tagbar_autofocus = 1
let g:tagbar_show_data_type = 1
let g:tagbar_show_visibility = 1
let g:tagbar_show_linenumbers = 1
" let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_show_tag_count = 1
let g:tagbar_singleclick = 1
let g:tagbar_use_cache = 0
" let g:tagbar_wrap = 2
let g:tagbar_scrolloff = 10
" " autocmd BufEnter * nested :call tagbar#autoopen(0)

nnoremap <silent> <C-a> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeWinSize = 27

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
