set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
"

" ~~~ Appearance ~~~
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
" ~~~ git ~~~
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" ~~~ Language support ~~~
Plug 'dearrrfish/vim-applescript'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'eigenfoo/stan-vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'quarto-dev/quarto-vim'
" ~~~ Python ~~~
Plug 'psf/black', { 'for' : 'python' }
Plug 'davidhalter/jedi-vim', { 'for' : 'python' }
Plug 'heavenshell/vim-pydocstring', { 'for' : 'python' }
" ~~~ Julia ~~~
Plug 'JuliaEditorSupport/julia-vim', { 'for' : 'julia' } 
" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
" ~~~ R ~~~
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
" ~~~ Latex ~~~
" Plug 'xuhdev/vim-latex-live-preview', { 'for' : 'tex' }
Plug 'lervag/vimtex'
" Plug 'jalvesaq/zotcite'
" ~~~ REPL ~~~
Plug 'jpalardy/vim-slime'
"Plug 'benmills/vimux'
"Plug 'julienr/vimux-pyutils'
"Plug 'julienr/vim-cellmode'
" Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
" ~~~ Markdown ~~~
Plug 'tpope/vim-markdown'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'craigmac/vim-mermaid'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'plasticboy/vim-markdown'
" ~~~ fzf ~~~
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" ~~ focus ~~~
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lgalke/vim-ernest'
" ~~~ writing ~~~
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-lexical'
" ~~~ tmux ~~~
Plug 'tmux-plugins/vim-tmux'
" ~~~ term ~~~
Plug 'wuelnerdotexe/nerdterm'
" ~~~  Misc ~~~
Plug 'github/copilot.vim'
Plug 'zhou13/vim-easyescape'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'guns/xterm-color-table.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab'
Plug 'moll/vim-bbye'
Plug 'preservim/nerdtree'
Plug 'justinmk/vim-sneak'
Plug 'psliwka/vim-smoothie'
" Plug 'ludovicchabant/vim-gutentags' " - not sure how much I would use this.

" ~~~ Plugins to exlore ~~~
" https://github.com/reedes/vim-thematic
" Plug 'reedes/vim-wheel'
" Plug 'reedes/vim-textobj-sentence' " Can't get this one to work well
" vim-easymotion

call plug#end()            " required

filetype plugin indent on
syntax enable


" ~~~ Colorscheme ~~~
set termguicolors
set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1

" ~~~ General ~~~
let mapleader = " "
let maplocalleader = ","

set splitright

set backspace=indent,eol,start
set scrolloff=8
set breakindent " wrapped lines keep indent
set hidden " hides buffers by default so you can change between buffers without saving

set shiftwidth=4 tabstop=4 expandtab

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


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" ~~~~ Plugin Specific Settings ~~~~"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

" ~~~ lightline ~~~ 
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
set laststatus=2

" ~~~ Jedi ~~~
" Stop popup window during completion.
autocmd FileType python setlocal completeopt-=preview

let g:jedi#goto_command = "<localleader>d"
let g:jedi#goto_assignments_command = "<localleader>g"
let g:jedi#goto_stubs_command = "<localleader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<localleader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<localleader>r"

" ~~~ slime ~~~
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1
" slime key bindings are in python.vim and julia.vim


" jedi-vim
" Unassign this as it collides with vim-slime
let g:jedi#goto_stubs_command = ""

" python-syntax
let g:python_highlight_all=1

" latex-live-preview
" let g:livepreview_previewer = 'open -a Skim'

" ~~~ vimtex ~~~
" Viewer settings
" some settings from https://giograno.me/blog/2020/latex-vim/
let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_automatic = 1
let g:vimtex_view_skim_activate = 0

" Other settings
let g:vimtex_quickfix_autoclose_after_keystrokes=2 
let g:vimtex_quickfix_mode = 2 " set to 0 to disable automatic quickfix window.
let g:vimtex_subfile_start_local = 1 " default to local subfile rather than main.
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_syntax_nospell_comments=1
let g:vimtex_toc_config = { 'layer_status' : { 'content' : 1, 'label' : 0, 'todo' : 0, 'include' : 0 },
			   \'tocdepth' : 1}
let g:vimtex_toc_todo_labels = {'TODO': 'TODO: ', 'FIXME': 'FIXME: ', 'REF': 'REF: '}

set encoding=utf8
nnoremap <localleader>lf :call vimtex#fzf#run()<CR>
nnoremap <localleader>lw :VimtexCountWords<CR>

" use vim as a pager
"let $PAGER=''

" ~~~ which-key ~~~
nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>
set timeoutlen=500
call which_key#register('<Space>', 'g:which_key_map')
call which_key#register(',', 'g:which_key_map_local')
let g:which_key_map = {}
let g:which_key_map_local = {}

" ~~~ Limelight ~~~
nnoremap <leader>L :Limelight!!<CR>

" ~~~ Goyo ~~~
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  syntax on
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <leader>G :Goyo<CR>
let g:goyo_width = "60%"
let g:goyo_height = "80%"

" ~~~ Markdown ~~~
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'julia', 'mermaid', 'json', 'yaml'] 
let g:instant_markdown_autostart = 0
let g:instant_markdown_mathjax = 1

" ~~~ R ~~~
let R_user_maps_only = 1
let R_assign = 0

" ~~~ NERDTree ~~~
let NERDTreeCustomOpenArgs = {'file': {'keepopen':0},'dir':{}} " close NerdTree after <CR> opening file.

" ~~~ pydocstring ~~~
let g:pydocstring_doq_path = "/Users/ghd/miniconda3/bin/doq"
let g:pydocstring_formatter = "google"

" ~~~ Buffergator ~~~
" Manually chooose which keymaps I want to keep
"  see ./vim/mappings.vim for bound keys.
let g:buffergator_suppress_keymaps = 1

" ~~~ Copilot ~~~
"  Recommended settings from: https://codeinthehole.com/tips/vim-and-github-copilot/
"
let g:copilot_filetypes = {
	\ 'gitcommit': v:true,
	\ 'markdown': v:true,
	\ 'yaml': v:true
	\ }

" Disable for very large files.
autocmd BufReadPre *
	\ let f=getfsize(expand("<afile>"))
	\ | if f > 100000 || f == -2
	\ | let b:copilot_enabled = v:false
	\ | endif

" ~~~ Open Url as md ~~~
source ~/.vim/surfdown.vim

" ~~~ Mappings ~~~
source ~/.vim/mappings.vim

" ~~~ Functions ~~~
source ~/.vim/functions.vim

" ~~~ Commands ~~~
source ~/.vim/commands.vim
