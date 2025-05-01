" Copied from Rmd.vim

" Break lines between words
setlocal linebreak

" remap line movements, move between visual lines rather than newlines 
noremap j gj
noremap k gk
" map the opposite of the command so be able to move between newlines
noremap gj j
noremap gk k

" start of end of line
nnoremap 0 g0
nnoremap g0 0
nnoremap $ g$
nnoremap g$ $
