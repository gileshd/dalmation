" Some maps
"
" filetype specific maps can be found in .vim/after/ftplugin/

" ~~~ Panes ~~~
" Resizing
nnoremap <leader><C-l>    :vertical resize -2<CR>
nnoremap <leader><C-h>    :vertical resize +2<CR>
" Navigation 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ~~~ Yank ~~~
nnoremap <S-y> y$

nnoremap <leader>y "+y
vnoremap <leader>y "+y
let g:which_key_map.y = 'Yank to clipboard'

nnoremap <silent> <leader>Y :%w !pbcopy<CR>
let g:which_key_map.Y = 'Yank buffer contents to clipboard'

" ~~~ Redraw ~~~
nnoremap <leader>r :redraw!<CR>

" ~~~ Spelling ~~~
" 'pick' the first spelling fix.
nnoremap zp 1z=
nnoremap <leader>sp :set spell! spell?<CR>
let g:which_key_map.s = { 'name' : '+spelling' }
let g:which_key_map.s.p = 'toggle spelling'

" ~~~ Move Lines ~~~
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ~~~ Misc ~~~
" Keep cursor in same position when joining lines
nnoremap J mzJ`z

" ~~~~~~~~~~~~~~~ 
" ~~~ PLUGINS ~~~
" ~~~~~~~~~~~~~~~

" ~~~ Buffergator ~~~
nnoremap <leader>b :BuffergatorOpen<CR>

" ~~~ fzf ~~~
nnoremap <leader>F :FZF<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>H :Helptags<CR>
nnoremap <leader>B :Buffers<CR>

" ~~~ NERDTree ~~~
nnoremap <leader>n :NERDTreeToggle<CR>

" ~~~ NERDTerm ~~~
nnoremap <leader>t <Plug>(NERDTermToggle)
let g:which_key_map.t = 'Toggle NERDterm'

" ~~~ Silver Searcher ~~~
nnoremap <leader>a :Ag<CR>
nnoremap <leader>A :Ag<CR>

" ~~~ Git ~~~
noremap <localleader>gg :GBrowse<cr>
noremap <localleader>gb :Git blame<cr>
let g:which_key_map_local.g = { 'name' : '+git' }
let g:which_key_map_local.g.g = 'git browse'
let g:which_key_map_local.g.b = 'git blame'

" ~~~ Copilot ~~~
" Toggle copilot on/off, overrides the filetype option
nnoremap <localleader>cc :call ToggleCopilot()<CR>
let g:which_key_map_local.c = { 'name' : '+copilot' }
let g:which_key_map_local.c.c = 'toggle copilot'

