" Giles' tex specific settings
" 14-11-19

" Break lines between words
setlocal linebreak

" remap line movements, move between visual lines rather than newlines 
noremap j gj
noremap k gk
" map the opposite of the command so be able to move between newlines
noremap gj j
noremap gk k


" Function to remove space after abbreviation.
" Taken from Vim abbreviate docs.
func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

" abbreviations
iabbr s{ \section{}<Left><C-R>=Eatchar('\s')<CR>
iabbr ss{ \subsection{}<Left><C-R>=Eatchar('\s')<CR>
iabbr sss{ \subsubsection{}<Left><C-R>=Eatchar('\s')<CR>
iabbr s*{ \section*{}<Left><C-R>=Eatchar('\s')<CR>
iabbr ss*{ \subsection*{}<Left><C-R>=Eatchar('\s')<CR>
iabbr sss*{ \subsubsection*{}<Left><C-R>=Eatchar('\s')<CR>

iabbr e{ \emph{}<Left><C-R>=Eatchar('\s')<CR>

iabbr \b \begin{}<Left><C-R>=Eatchar('\s')<CR>
"iabbr \e \end{}<Left><C-R>=Eatchar('\s')<CR>


" " For cool unicode rendering of equations - which sort of works.
" " see https://castel.dev/post/lecture-notes-1/
" set conceallevel=1
" let g:tex_conceal='abdmg'
