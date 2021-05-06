"Compile-Run-Delete macro
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c' " For C 
exec "silent !gcc % -o %<"
exec "!time ./%<"
exec "silent !rm %<"
elseif &filetype == 'cpp' " For C++
exec "!g++ % -o %<"
exec "!time ./%<"
exec "silent !rm %<"
elseif &filetype == 'java' " For Java
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh' " For bashscript
exec "!time bash %"
elseif &filetype == 'python' " For Python
exec "!time python3.7 %"
elseif &filetype == 'html' " For HTML
exec "!firefox % &"
elseif &filetype == 'go' " For Go
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd' " For Markdown
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc

"Dissassembler
nmap <silent> <F6> :call DissassembleGcc()<CR>
func! DissassembleGcc()
exec ":silent! %s/\s\+$//"
if &filetype == 'c' " For C 
exec "silent !gcc -S %:r.c"
exec "silent! tabnew %:r.s"
exec "silent! !rm %:r.s"
endif
endfunc


