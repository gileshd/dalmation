" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" GHD: Did this to get the markdown checkboxes - who knows if it is sensible
set runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
"
" ~~~ Colorscheme ~~~
set termguicolors
set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1

" ~~~ General ~~~
let mapleader = " "
let maplocalleader = ","

" I think this is already done in my ftplugin files
" autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
" autocmd FileType julia setlocal shiftwidth=4 tabstop=4 expandtab
" autocmd FileType sh setlocal shiftwidth=4 tabstop=4 expandtab

" Set default indentation settings
set shiftwidth=4 tabstop=4 expandtab

set splitright

set backspace=indent,eol,start
set scrolloff=8
set breakindent " wrapped lines keep indent
set hidden " hides buffers by default so you can change between buffers without saving

set incsearch
" Only perform case-sensitive search if there is a capital letter in the
" search
set ignorecase
set smartcase

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~ Keep Buffer Scroll Position ~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Ensure that the scroll position is not reset when you switch away
" from and then back to a buffer.
" Solution from: 
"    https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" colorscheme palenight

" ~~~~~~~~~~~~~~~~~~~~~~
" ~~~~ Commands ~~~~
" ~~~~~~~~~~~~~~~~~~~~~~
" Some custom commands.
"
" ~~~ Write ~~~
command! W w
command! Wq wq

" Add which_key dicts so that we don't complain
let g:which_key_map_local = {}
let g:which_key_map = {}

" ~~~~~~~~~~~~~~~~~~~~~
" ~~~~ Functions ~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~

source ~/.vim/functions.vim

source ~/.vim/surfdown.vim

" ~~~~~~~~~~~~~~~~~~~~~
" ~~~ nvim specific ~~~
" ~~~~~~~~~~~~~~~~~~~~~

" Make my cursor behave like vim.
set guicursor=

" For God's sake turn off highlighting for searches
set nohlsearch

" lua require('plugins')


