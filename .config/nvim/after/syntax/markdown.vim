" My markdown syntax additions

highlight! link markdownItalic htmlItalic
" The option below will color italics purple (which I think is defined in palenight.vim)
" highlight markdownItalic cterm=italic gui=italic
set conceallevel=2

" Change syntax definition
syntax match markdownBlockquote /^>\+ .*/

" Change list syntax to match multiple indents
" done by adding `\+` after the match group (which matches either a tab or {0,4} spaces)
" also stipulate that the pattern must begin at start of line using `^`
syntax match markdownOrderedListMarker /^\%(\t\| \{0,4}\)\+\<\d\+\.\%(\s\+\S\)\@=/
syntax match markdownListMarker /^\%(\t\| \{0,4\}\)\+[-*+]\%(\s\+\S\)\@=/

" Ignore LaTeX math syntax
syntax region markdownLaTeX start="\$" end="\$" keepend contains=@NoSpell
syntax region markdownLaTeX start="\$\$" end="\$\$" keepend contains=@NoSpell

" Ensure LaTeX math is not treated as italics or bold
syntax cluster markdownInline remove=markdownItalic,markdownBold