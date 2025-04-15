
" Zyklen
autocmd BufNewFile,BufRead *cs_*.*,*.spf,*.mpf,*.tea,*.def set filetype=nc
autocmd BufNewFile,BufRead *CS_*.*,*SPF,*MPF,*.TEA,*.DEF set filetype=nc
autocmd BufNewFile,BufRead [Pp]\d\+ set filetype=nc
autocmd BufNewFile,BufRead * if getline(1) =~? '_N_' | setf nc | endif
"autocmd BufNewFile,BufRead * if getline(1) =~? '^%' | setf nc | endif

