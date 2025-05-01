" custom python 

nmap <buffer> <LocalLeader>S <Plug>SlimeLineSend
nmap <buffer> <LocalLeader>s <Plug>SlimeParagraphSend
vmap <buffer> <LocalLeader>s <Plug>SlimeRegionSend

" _ now acts as a word separator.
:se iskeyword-=_

setlocal shiftwidth=4 tabstop=4 expandtab
 
