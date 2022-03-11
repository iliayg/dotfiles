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
:set ic     " :set colorcolumn=109

map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-h> <c-w>h
map <C-l> <c-w>l
inoremap jk <esc>
map <space><esc> :nohlsearch<cr>
map <C-c> :q!<cr>
map <C-s> :w<cr>

map gn :bn<cr>
map gp :bp<cr>
map gw :Bclose<cr>

nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

map gs :split
map gv :vsplit
set splitbelow      " open new split panes below
syntax enable

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
if !exists('g:vdebug_options')
      let g:vdebug_options = {}
    endif
let g:vdebug_options.on_close = 'stop'
let g:vdebug_options.continuous_mode = 0
let g:vdebug_options.layout = 'horizontal'
let g:vdebug_options.debug_file = './vdebug.log'
let g:vdebug_options.debug_window_level = 0
let g:vdebug_options.debug_file_level = 0

let g:VM_maps = {}
let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'
let g:VM_mouse_mappings = 1

nnoremap <C-t> :call OpenTerminal()<CR>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif      " start terminal in insert modej
function! OpenTerminal()
    split term://zsh
    resize 10
endfunction
autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
let g:Terminal_ExecFileKey = '<F12>'
if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
    tnoremap jk <C-\><C-n>
endif

nnoremap <silent> <F8> :TagbarToggle<cr>
let g:tagbar_indent = 0
let g:tagbar_width = max([30, winwidth(0) / 6])
let g:tagbar_show_data_type = 1
let g:tagbar_show_visibility = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_show_tag_count = 1
let g:tagbar_singleclick = 1
let g:tagbar_use_cache = 1
let g:tagbar_scrolloff = 10
autocmd FileType * nested :call tagbar#autoopen(0)
autocmd VimEnter * nested :call tagbar#autoopen(1)

nnoremap <silent> <C-a> :NERDTreeToggle<CR>
nmap <silent> <C-f> :NERDTreeFind<CR>
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

let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
let g:python3_host_prog='/bin/python3'
let g:loaded_python_provider = 0
autocmd filetype python map <buffer> <f9> :w<cr>:exec '!python3' shellescape(@%, 1)<cr>

source $HOME/.config/nvim/vim-plug/plugins.vim
