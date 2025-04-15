set clipboard+=unnamedplus

autocmd BufRead,BufNewFile *.icc set filetype=cpp
autocmd BufRead,BufNewFile Dockerfile set filetype=dockerfile
autocmd BufRead,BufNewFile *.ini set filetype=dosini
autocmd BufRead,BufNewFile *.INI set filetype=dosini

" Python
autocmd BufNewFile,BufRead *.pyw set filetype=python

" PHP
autocmd BufNewFile,BufRead *.sphp set filetype=php

" Embperl
autocmd BufNewFile,BufRead *.epl set filetype=embperl

autocmd BufNewFile,BufRead * if getline(1) =~? '^<' | setf xml | endif

" In text files, always limit the width of text to 78 characters
autocmd BufRead *.txt set tw=78

"
"autocmd BufNewFile,BufRead *.php so $VIMRUNTIME/indent/html.vim | set sw=2 |set noexpandtab

" aspx
autocmd BufNewFile,BufRead *.as?x set filetype=aspnet

autocmd BufRead * if getline(1) =~? 'utf-8' | set fileencoding=utf-8 | endif
autocmd BufRead * if getline(1) =~? '8859-1' | set fileencoding=latin1 | endif
autocmd BufRead * if getline(1) =~? 'latin1' | set fileencoding=latin1 | endif
autocmd BufRead * if getline(1) =~? 'cp850' | set fileencoding=cp850 | endif
autocmd BufRead * if getline(1) =~? 'cp1252' | set fileencoding=cp1252 | endif

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

