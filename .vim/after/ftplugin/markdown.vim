" Copied from tex.vim

" Break lines between words
setlocal linebreak

" Set tabs
setlocal shiftwidth=4 tabstop=4 expandtab " remap line movements, move between visual lines rather than newlines 
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

" ~~~ Map custom functions ~~~
nnoremap <localleader>s :call RecentScreenshot(expand("<cfile>"))<CR>
nnoremap <localleader>t :call MakeScreenshotPath()<CR>

" ~~~ Map Substitutions ~~~

" ~ Strikethrough ~
" nnoremap <localleader>gs :.s/\(^\s\+-\s\).\(.\+\)/\1\~\~\2\~\~/<CR>
nnoremap <localleader>bs :.s/^\(\s*-\=\d*\.\=\s\=\)\(.\+\)/\1\~\~\2\~\~/<CR>
vnoremap <localleader>bs :s/^\(\s*-\=\d*\.\=\s\=\)\(.\+\)/\1\~\~\2\~\~/<CR>

" ~ Checkboxes ~
let g:which_key_map_local.x = {'name': '+checkbox'}

" * -> [ ]
function! EmptyCheckbox()
   let line = getline('.')
   if match(line, '^\s*$') >= 0
       s/^\s*$/- [ ] /
       startinsert!
   elseif match(line, '- \[.\]') >= 0
       s/- \[.\]/- \[ ]/
   else
       try 
           s/\(\s*\)-/\1- [ ]/
       catch
           echo "EmptyCheckbox() Pattern not found."
       endtry
   endif
endfunction

" nnoremap <localleader>x<Space> :.s/- \[.\]/- \[ \]/<CR>
nnoremap <localleader>x<Space> :call EmptyCheckbox()<CR>
vnoremap <localleader>x<Space> :s/- \[.\]/- \[ \]/<CR>
let g:which_key_map_local.x['SPC'] = '[.] -> [ ]'

" [ ] -> [x]
nnoremap <localleader>xx :.s/- \[ \]/- \[x\]/<CR>
vnoremap <localleader>xx :s/- \[ \]/- \[x\]/<CR>
let g:which_key_map_local.x.x = "[ ] -> [x]"

" [ ] -> [>]
nnoremap <localleader>x> :.s/- \[ \]/- \[>\]/<CR>
vnoremap <localleader>x> :s/- \[ \]/- \[>\]/<CR>
let g:which_key_map_local.x['>'] = "[ ] -> [>]"


" let b:ale_linters = ['markdownlint', 'vale']
" let b:ale_fixers = ['prettier']
" let b:ale_linters = ['vale']

" Turn word into link and enter insert mode in between link-target brackets
nmap <localleader>k ysiW]f]a()<ESC>i
let g:which_key_map_local.k = 'Convert word to link'

