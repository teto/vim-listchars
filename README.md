vim-listchars
===

(Neo)vim plugin that allows to cycle through different listchars configurations and when you finished
cycling between configurations disables display of invisible chars. 
Next activation will reenable it and start cycling again from your first entry.

To install
===
For vim-plug:
```
Plug 'teto/vim-listchars'
```

How to configure
===

If you don't like the default values, you can setup your own list of configurations
```vim
let g:listchar_formats=[ 
   \"trail:·",
   \"tab:»·,eol:↲,nbsp:␣,extends:…,space:␣,precedes:<,extends:>,trail:·",
   \"tab:»·,nbsp:↲,trail:↲"
   \]
```

There is no default mapping, you have to add it yourself, for instance:

```noremap <F11> <Plug>(ToggleListchars)```


Related:
- https://github.com/tjdevries/cyclist.vim
