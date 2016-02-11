"if exists("g:ListChars")
   "finish
"endif

" show tab and trailing spaces
" Ctrl+v, u, unicode hex code
" "
" " tab chars
" " 21E2 ⇢
" " 21E5 ⇥
" " 21E8 ⇨
" " 2192 → (rightwards arrow, &rarr;)
" " 21D2 ⇒ (rightwards double arrow, &rArr;)
" " 25B8 ▸ (TextMate style)
" "→ 
" " trail chars
" " 25CF ●
" " 2639 ☹ (frowning face)
" " 267A ♺ (recycling symbol)
" " 261F ☟ (hand pointing down)
" " F8FF  (apple logo)
" "
" " eol chars
" " 21B2 ↲
" " 21B5 ↵ (carriage return, &crarr;)
" " 21A9 ↩
" " 23CE ⏎ (return symbol)
" " 00AC ¬ (TextMate style)

" Hide/display invisible characters
let b:current_listchar = 0
"\"trail:·,tab:→\ ,eol:↲,precedes:<,extends:>", 
        "  d sds         
let g:listchar_formats=[ 
   \"trail:·",
   \"tab:»·,eol:↲,nbsp:␣,extends:…,space:␣,precedes:<,extends:>,trail:·",
   \"tab:»·,nbsp:↲,trail:↲"
   \]

"trail:·,extends:❯,precedes:❮,n
" Vimscript lists are zero-indexed
" could use pyfile to write that plugin in python
" lists are 0 indexed
function! ToggleInvisibleChar()
   " l => local to the function

   let l:len = len(g:listchar_formats)

   "echom "Current=" . b:current_listchar . "with length" . l:len
   let b:current_listchar = b:current_listchar + 1
   "echo l:listchar_formats[b:current_listchar]

   if b:current_listchar >= l:len
      set nolist
      let b:current_listchar = -1
   else
      "echom "index=".b:current_listchar." format=".g:listchar_formats[b:current_listchar]
      set list
      execute "set listchars=".g:listchar_formats[b:current_listchar]
   endif
endfunction


command! ToggleListchars call ToggleInvisibleChar()
noremap <silent> <Plug>(ToggleListchars) :ToggleListchars<CR>

