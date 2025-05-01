
" ~~~ Giles ~~~
" Copy the title of the image inside the brackets, edit to make it suitable
" for a path and append to end of line.
" TODO: remove non alphanumeric characters from title.
function MakeScreenshotPath()
	call setreg('s', '')
	normal! "syi[
	let title = getreg('s')
	let title = tolower(title)
	let title = join(split(title),"_")
	let img_path = "./images/" . title . ".png"
	let md_img_path = "(" . img_path . ")"
	call setreg('s', md_img_path)
	echom getreg('s')
	normal! $"spF(fi
endfunction

" To be more fancy - just define the dest_dir at the dir of the file being
"  edited.
function! RecentScreenshot(dest_path)
	let screenshot_folder = "/Users/ghd/Documents/Screenshots/"
	let recent_files = systemlist("find " . screenshot_folder . " -type f -mmin -10")
	if len(recent_files) == 0
		echom "No new files in the last 10 mins!"
		return 1
	endif
	let most_recent_file = screenshot_folder . trim(system("ls -t " . screenshot_folder . " | head -n1"))
	let destination = a:dest_path
	let dest_dir = join(slice(split(destination,"/"),0,-1),"/")
	if isdirectory(dest_dir)
		call rename(most_recent_file, destination)
		echom "Moving " . most_recent_file . " to " . destination
	else
		echom "Destination directory: " . dest_dir . " does not exist!"
	endif
endfunction

" autocmd FileType markdown nnoremap <localleader>s :call RecentScreenshot(expand("<cfile>"))<CR>
" autocmd FileType markdown nnoremap <localleader>t :call MakeScreenshotPath()<CR>


" ~~~ Open urls ~~~
" from https://github.com/vim/vim/issues/4738#issuecomment-714609892
if has('macunix')
  function! OpenURLUnderCursor()
    let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;()]*')
    let s:uri = shellescape(s:uri, 1)
    if s:uri != ''
      silent exec "!open '".s:uri."'"
      :redraw!
    endif
  endfunction
  nnoremap gx :call OpenURLUnderCursor()<CR>
endif

" ~~~ Search Synonym ~~~
function! GoogleSynonym(word)
	silent exec "!open 'https://www.google.com/search?q=".a:word."+synonym'"
	:redraw!
endfunction

autocmd FileType markdown nnoremap <localleader>y :call GoogleSynonym("<cword>")<CR>
autocmd FileType tex nnoremap <localleader>y :call GoogleSynonym("<cword>")<CR>


" ~~~ Copilot ~~~
" Toggles on/off copilot for the current buffer, overriding the filtype
" setting.
" Written with the kind supports of copilot itself, it is good to see it is
" willing to turn itself off.
function! ToggleCopilot()
	" check if b:copilot_enabled=v:true
	if !exists("b:copilot_enabled") || !b:copilot_enabled
		" if it isn't, set it to v:true
		let b:copilot_enabled = v:true
 		echom "Copilot enabled"
	elseif exists("b:copilot_enabled") && b:copilot_enabled
		" if it is, set it to v:false
		let b:copilot_enabled = v:false
 		echom "Copilot disabled"
	endif 
endfunction

" ~~~ Scratch Buffer ~~~
function! Scratch()
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    " TODO: This opens a file/dir 'scratch' if it exists
    file scratch
    set filetype=markdown
    cabbrev <buffer> w silent %w ! pbcopy
    " TODO: This newline stripping isn't working on macOS - maybe the \n is
    " diff?
    autocmd BufUnload <buffer> silent %w ! sed '$ s/\n$//' | pbcopy
endfunction

nnoremap <Leader>S :call Scratch()<CR>
let g:which_key_map.S = 'Open scratch buffer'


" ~~~ vscode ~~~
function! OpenInVscode()
	silent exec "!code ".expand("%")
	:redraw!
endfunction

nnoremap <localleader>vo :call OpenInVscode()<CR>
let g:which_key_map_local.v = { 'name' : '+vscode' }
let g:which_key_map_local.v.o = 'Open current file in vscode'

" ~~~ cursor ~~~
function! OpenInCursor()
	silent exec "!cursor ".expand("%")
	:redraw!
endfunction

nnoremap <localleader>vco :call OpenInCursor()<CR>
let g:which_key_map_local.v.c = { 'name' : '+cursor' }
let g:which_key_map_local.v.c.o = 'Open current file in cursor'

" ~~~ arvix ~~~

function! GetArxivTitle()
    let url = expand("<cWORD>")
    let url = substitute(url, '/pdf/', '/abs/', '')
    let cmd = "curl -s " . shellescape(url) . " | sed -n 's/.*<meta name=\"citation_title\" content=\"\\([^\"]*\\)\".*/\\1/p'"
    let title = system(cmd)
    let title = substitute(title, '\n$', '', '')
    return title
endfunction

nnoremap <localleader>Gat :let @a = '[' . GetArxivTitle() . '](' . expand("<cWORD>") . ')'<CR>"_diW"ap

" ~~~ daily notes ~~~
" function! SearchDailyTodos()
"     let date = strftime("%Y-%m")
"     let search_cmd = "vimgrep /- \\[ \\]/j daily-notes/" . date . "-*.md"
"     execute search_cmd
"     copen
" endfunction
function! SearchDailyTodos(ask_date_input)
   if a:ask_date_input
       call inputsave()
       let date = input('Enter date (YYYY-mm): ', strftime("%Y-%m"))
       call inputrestore()
   else
       let date = strftime("%Y-%m")
   endif
   let search_cmd = "vimgrep /- \\[ \\]/j daily-notes/" . date . "-*.md"
   execute search_cmd
   copen
endfunction


autocmd FileType markdown nnoremap <localleader>dt :call SearchDailyTodos(0)<CR>
autocmd FileType markdown nnoremap <localleader>dT :call SearchDailyTodos(1)<CR>
autocmd FileType markdown let g:which_key_map_local.d = {'name': '+daily-notes'}
autocmd FileType markdown let g:which_key_map_local.d.t = 'Search for TODOS'

