" Some maps
"

" ~~~ Panes ~~~
" Resizing
nnoremap <leader><C-l>    :vertical resize -2<CR>
nnoremap <leader><C-h>    :vertical resize +2<CR>
" Navigation 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-w><C-w> <C-\><C-n><C-w>w
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" ~~~ Yank ~~~
nnoremap <S-y> y$

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <silent> <leader>Y :%w !xsel -ib<CR>

" ~~~ Redraw ~~~
nnoremap <leader>r :redraw!<CR>

" ~~~ Spelling ~~~
" 'pick' the first spelling fix.
nnoremap zp 1z=
nnoremap <leader>sp :set spell! spell?<CR>

" ~~~ Move Lines ~~~
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ~~~ Misc ~~~
" Keep cursor in same position when joining lines
nnoremap J mzJ`z

" ~~~ Search ~~~
nnoremap <localleader>ld :lua vim.diagnostic.open_float()<CR>
