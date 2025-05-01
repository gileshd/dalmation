" R specifc settings

" Starting/Stopping R
nnoremap <buffer> <localleader>rs :call StartR('R')<CR>
nnoremap <buffer> <localleader>rq :call RQuit('nosave')<CR>

" Sending code
nnoremap <buffer> <localleader><S-s> :call SendLineToR("down")<CR>
nnoremap <buffer> <localleader>s :call SendParagraphToR("echo", "down")<CR>
vnoremap <buffer> <localleader>s :<C-u>call SendSelectionToR("echo", "down")<CR>

" Help
nnoremap <buffer> <localleader>rh :call RAction("help")<CR>




