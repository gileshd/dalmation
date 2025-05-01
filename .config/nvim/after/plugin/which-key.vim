nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>
set timeoutlen=500
call which_key#register('<Space>', 'g:which_key_map')
call which_key#register(',', 'g:which_key_map_local')
let g:which_key_map = {}
let g:which_key_map_local = {}
