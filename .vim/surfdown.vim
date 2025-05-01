" ~~~ Url to markdown ~~~
"
" Read webpage in new buffer as markdown
" 
" There are two options to get html into vim:
" - :put =system("curl -s http://example.com")
" - :0r !curl -s http://example.com 
"
" Then convert to markdown using html2md (https://github.com/suntong/html2md)
" Can also use pandoc: `pandoc -f html -t gfm`
"  But this includes a bunch of weird html tags.
" 
" TODOs:
" - Handling urls:
"   	- relative urls
"   		- 'foo/' should probably be treated as '/foo/'
"   		- trim trailing '#...' 
" - Implement more sophisticated parsing of <cfile> so that I can follow
"   relative links.
"   - Maybe something like this:
"     - let baseurl = substitute(url, ".*@\\(.*\\):", "\\1/", "")
"        - where url might be `b:buffer_url`
"     - if <c-file> starts with '/' then a:url = baseurl . <c-file>
"     - elif <c-file> starts with './' then a:url = head_dir(b:buffer_url) . <c-file>
"     - elif while baseurl starts with '../' then baseurl = head_dir(b:buffer_url) 
"     	- recursive like.
" - Handle pdfs?
"
" NOTES: 
" - It looks like 'buftype=nofile' might stop from changing the buffer name?
"   - Hmm maybe not?
" - See https://www.arp242.net/effective-vimscript.html for useful vimscript
"   tips.
"
" www.example.com
" https://80000hours.org
"
" NOTE: 
" - You can get functionality a bit like this using the built-in netrw system
"   - `let g:netrw_http_cmd = 'curl -sL'`
"   - `let g:netrw_http_xcmd = ' | html2md -i --opt-em-delimiter="*"' > `
"     - The approach taken by netrw is to write this to a /tmp/ file and then open
"	that file in a new buffer.
" - This allows you to use gf to open the link under the cursor.
" - However,
"   - you still need to add set the filetype to markdown.
"   - you need custom logic to follow incomplete urls (e.g. /foo -> www.example.com/foo)
"   	- maybe you can overload gf command in the special buffertype corresponding to a
"   	  surfdown buffer?

function! GetBaseUrl(url)
	let pat =  "\\(http[s]\\=:\/\/\\)\\=\\(www.\\)\\=\\([^\/]\\+\\)\/*.*"
	let sub =  "\\1\\2\\3"
	let base_url = substitute(a:url, pat, sub, "")
	return base_url
endfunction

" Parse the url to get the url path.
function! ParseUrlPath(url_path)
	if a:url_path =~ '^/'
		let baseurl = GetBaseUrl(b:buffer_url)
		let url = baseurl . a:url_path
	elseif a:url_path =~ '^./'	
		let url_path = trim(a:url_path, '.')
		let baseurl = fnamemodify(b:buffer_url, ':h')
		let url = baseurl . url_path
	elseif a:url_path =~ '^../'
		let baseurl = fnamemodify(b:buffer_url, ':h')
		let url_path = a:url_path
		while url_path =~ '^../'
			let baseurl = fnamemodify(baseurl, ':h')
			let url_path = substitute(url_path, '^../', '', '')
		endwhile
		let url = baseurl . '/' . url_path
	else
		let url = a:url_path
	endif
	return url
endfunction


" Add some headers to make the website think we're a browser.
let s:curl_command = "curl -sL -A 'Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0' "
" Use html2md to convert to markdown.
let s:html2md_command = "html2md -i --opt-em-delimiter='*'"

function! OpenUrlMd(url)
	let url = ParseUrlPath(a:url)
	ene | execute "0r !" . s:curl_command .  url . " | " . s:html2md_command
       	setlocal buftype=nofile bufhidden=hide noswapfile filetype=markdown
	let b:buffer_url = url
	" Set filename to url.
	silent! execute "keepalt noautocmd file " . url
	normal gg
endfunction

nnoremap <silent> gm :call OpenUrlMd(expand('<cfile>'))<CR>
command! -nargs=1 OpenUrlMd call OpenUrlMd(<args>)

" With thanks to https://stackoverflow.com/a/6271254
function! GetVisualSelection()
    " Why is this not a built-in Vimscript function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

vnoremap <silent> gm :call OpenUrlMd(GetVisualSelection())<CR>


