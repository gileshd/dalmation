" Add STATUS to comment keywords
" syn case ignore
" syn keyword texCommentTodo	contained	status
" syn case match

" change colour to red
" hi link texTodo Error

" This doesn't work and it is now bedtime.
"syn match texStatusOrange "orange"hs=s+2 containedin=@texTodo
"syn keyword texStatusOrange orange containedin=@texCommentGroup
"hi link texStatusOrange spellCap

" " ~~~ Syntax ~~~
" " Todo and similar within comments
" syntax case ignore
" syntax keyword texCommentTodo combak fixme todo xxx
" \ containedin=texComment contained
" syntax case match

" ~~~ Spelling ~~~
" Stop spell check on contents of braces or square brackets.
syntax match citePlaceholder /\[[^\]]\+\]/ contains=@NoSpell
"syntax match citePlaceholder /{\w}/ contains=@NoSpell
