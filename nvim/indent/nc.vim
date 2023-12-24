" Description:	NC-Zyklen Einruecken
" Author:	Peter Kaiser <ksp@heller.de>
" Last Change:	08.02.2002

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=NCGetIndent(v:lnum)
setlocal indentkeys&
setlocal indentkeys+=!^F,o,O,=else,=endif,=endwhile,=endfor,=endloop,=until<:>
" setlocal indentkeys-=0#


" Only define the function once.
if exists("*NCGetIndent")
  finish
endif


fun! NCGetIndent(lnum)
  " labels and preprocessor get zero indent immediately
  let this_line = getline(a:lnum)
  let LABELS_OR_PREPROC = '^\s*\(\<\k\+\>:\s*$\|#.*\)'
  if this_line =~? LABELS_OR_PREPROC
    return 0
  endif

  " Find a non-blank line above the current line.
  " Skip over labels and preprocessor directives.
  let lnum = a:lnum
  while lnum > 0
    let lnum = prevnonblank(lnum - 1)
    let previous_line = getline(lnum)
    if previous_line !~? LABELS_OR_PREPROC
      break
    endif
  endwhile

  " Hit the start of the file, use zero indent.
  if lnum == 0
    return 0
  endif

  let ind = indent(lnum)

  " Add
  if previous_line =~? '^\s*\<\(if\|else\|repeat\|for\|while\|\loop\)'
    let ind = ind + &sw
  endif
 
  " Add
  if previous_line =~? '^\s*_scel(.*"\(SUB\|ADD\|MUL\)"'
    let ind = ind + &sw
  endif

  " Subtract
  if previous_line =~? '^\s*\<if\>.*\<goto[bf]\>'
    let ind = ind - &sw
  endif
  if this_line =~? '^\s*\<\(endif\|else\|until\|endloop\|endfor\|endwhile\)\>'
    let ind = ind - &sw
  endif
  if this_line =~? '^\s*_scel(.*"END".*);'
    let ind = ind - &sw
  endif

  return ind
endfun

" vim:tw=78:ts=8:sw=2:
