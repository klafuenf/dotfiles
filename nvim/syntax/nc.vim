" Vim syntax file
" Language:     NC-Zyklen 
" Maintainer:   Peter Kaiser <ksp@heller.de>
" Last Change:  Tue Sep 14 14:24:23 BST 1999

" This syntax file not a complete implementation yet.  Send suggestions to the


" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case ignore               
" A bunch of useful nc keywords
syn keyword ncStatement define as def proc save displof sblof

syn keyword ncTypeSpecifier int real bool char string axis frame

syn match ncNCVar           "\$\w\+"
syn keyword ncNCVar         ax
syn match ncNCVar           "\<R\d\+\>"

syn match ncLabel           "^\w*:"
syn match ncLabel           "^N\d\+"

syn match ncTypeSpecifier   "\<AX\d\+\>"
syn match ncTypeSpecifier   "\<DR\d\+\>"
syn match ncTypeSpecifier   "\<MA_\w\+\>"
syn match ncTypeSpecifier   "\<P\d\+\>"

syn keyword ncFunction      abs axname stopre newconf strlen msg spos velolim jerklim acc
syn keyword ncFunction      sin cos tan asin acos atan2 sqrt pot trunc round ln exp delete write read isfile

syn match ncFunction        "\<[GMFSDQ]\d\+"

syn keyword ncTodo          contained TODO FIXME XXX

syn keyword ncRepeat        while endwhile for to endfor repeat until loop endloop
syn keyword ncStatement     gotof gotob ret break

syn keyword ncConditional   if else endif

"integer number, or floating point number without a dot.
syn match  ncNumber         "\<\d\+\>"
syn match  ncNumber         "'B[01]\+'"
syn match  ncNumber         "'H[0-9A-F]\+'"
syn match  ncNumber         "'[0-9A-F]\+'"
"floating point number, with dot
syn match  ncFloat          "\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  ncFloat          "\.\d\+\>"
"integer number, or floating point number without a dot and with "f".
syn match	cNumbers	display transparent "\<\d\|\.\d" contains=cNumber,cFloat,cOctalError,cOctal
" Same, but without octal error (for comments)
syn match	cNumbersCom	display contained transparent "\<\d\|\.\d" contains=cNumber,cFloat,cOctal
syn match	cNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	cNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	cOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=cOctalZero
syn match	cOctalZero	display contained "\<0"
syn match	cFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	cFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	cFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	cFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"
if !exists("c_no_c99")
  "hexadecimal floating point number, optional leading digits, with dot, with exponent
  syn match	cFloat		display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
  "hexadecimal floating point number, with leading digits, optional dot, with exponent
  syn match	cFloat		display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
endif

" flag an octal number with wrong digits
syn match	cOctalError	display contained "0\o*[89]\d*"

"boolean
syn keyword ncBoolean       true false

" String and Character contstants
syn match   ncSpecial contained "\\\d\d\d\|\\."
syn match   ncSpecial "^%_N_.*$"

syn region  ncString        start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=ncSpecial

syn region  ncComment       start=";" end="$" contains=ncTodo
syn region  ncComment       start="/" end="$" contains=ncTodo
syn region  ncLineNumber    start="^\d" end="\s"
"syn match   ncTypeSpecifier "[a-zA-Z0-9][\$%&!#]"ms=s+1
syn sync ccomment ncComment
" syn match   ncMathsOperator "[<>+\*^/\\=-]"
syn match   ncMathsOperator   "-\|=\|[:<>+\*^/\\]"
syn keyword ncMathsOperator   and or not xor b_or b_and div mod
syn match ncDelimiter "[()\[\]]"
syn region	ncDefine		start="^\s*#\s*\(define\|undef\)\>" skip="\\$" end="$" end="//"me=s-1 contains=ALLBUT,@cPreProcGroup
syn region	ncPreCondit	start="^\s*#\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" end="//"me=s-1 
" contains=cComment,cCppString,cCharacter,cCppParen,cParenError,cNumbers,cCommentError,cSpaceError
syn match	ncPreCondit	display "^\s*#\s*\(else\|endif\)\>"

" catch errors caused by wrong parenthesis
syn region  ncParen            transparent start="(" end=")" contains=ALL
" syn match   ncParenError       ")"

" Define the default highlighting.
command -nargs=+ HiLink hi def link <args>

HiLink ncBoolean       Boolean
HiLink ncLabel         Label
HiLink ncConditional   Conditional
HiLink ncRepeat        Repeat
HiLink ncLineNumber    Comment
HiLink cNumbers        Number
HiLink ncFloat         Float 
HiLink ncError         Error
HiLink ncStatement     Statement
HiLink ncString        String
HiLink ncComment       Comment
HiLink ncSpecial       Special
HiLink ncTodo          Todo
HiLink ncFunction      Function
HiLink ncTypeSpecifier Type
HiLink ncMathsOperator Operator
HiLink ncStructure     Structure
HiLink ncNCVar         Identifier
HiLink ncDelimiter     Delimiter
HiLink ncPreCondit      PreCondit
HiLink ncDefine	       Macro
HiLink ncParenError    ncError

delcommand HiLink

let b:current_syntax = "nc"

" vim: ts=8
