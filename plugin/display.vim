" Vim global plugin for cycling through nolist/list/different listchars
" configurations
" Last Change:	February 2016
" Maintainer:	Matthieu Coudron
" License:	This file is placed in the public domain
scriptencoding utf8

if exists("ToggleInvisibleChar")
   finish
endif

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

let g:current_listchar_id = 0


"\"trail:·,tab:→\ ,eol:↲,precedes:<,extends:>", 
        "  d sds         
let g:listchar_formats=[ 
   \"trail:·",
   \"tab:»·,eol:↲,nbsp:␣,extends:…,space:␣,precedes:<,extends:>,trail:·",
   \"tab:»·,nbsp:↲,trail:↲"
   \]

" lists are 0 indexed
function! ToggleInvisibleChar()

   " l => local to the function
   let l:len = len(g:listchar_formats)

   "echom "Current=" . g:current_listchar_id . "with length" . l:len
   let g:current_listchar_id += 1

   if g:current_listchar_id >= l:len
      set nolist
      let g:current_listchar_id = -1
   else
      "echom "index=".g:current_listchar_id." format=".g:listchar_formats[g:current_listchar_id]
      " list is local to window while listchars is global
      set list
      execute "set listchars=".g:listchar_formats[g:current_listchar_id]
   endif
endfunction


command! ToggleListchars call ToggleInvisibleChar()
map <silent> <Plug>(ToggleListchars) :ToggleListchars<CR>

