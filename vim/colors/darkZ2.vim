" darkZ2 1.1 (Vim color file)
" Created by KaiSforza

if version > 580
    hi clear
    if exists("syntax_on")
      syntax reset
    endif
endif

"set cursorline
let g:colors_name="darkZ2"

hi SpecialKey   ctermfg=red
hi NonText      ctermfg=darkblue
hi Directory    ctermfg=darkcyan
hi ErrorMsg     ctermfg=7         ctermbg=1
hi IncSearch    cterm=NONE          ctermfg=yellow    ctermbg=green
hi Search       cterm=NONE          ctermfg=white     ctermbg=grey
hi MoreMsg      ctermfg=darkgreen
hi ModeMsg      cterm=NONE          ctermfg=brown
hi LineNr       ctermfg=3
hi Question     ctermfg=green
hi StatusLine   cterm=reverse
hi StatusLineNC cterm=reverse
hi VertSplit    cterm=reverse
hi Title        ctermfg=5
hi Visual       cterm=reverse
hi VisualNOS    cterm=underline
hi WarningMsg   ctermfg=1
hi WildMenu     ctermfg=0           ctermbg=3
hi Folded       ctermfg=darkgrey    ctermbg=NONE
hi FoldColumn   ctermfg=darkgrey    ctermbg=NONE
hi DiffAdd      ctermbg=darkcyan    ctermfg=black
hi DiffChange   ctermbg=black       ctermfg=darkcyan
hi DiffDelete   ctermfg=4         ctermbg=6
hi DiffText     ctermbg=1

hi Comment      ctermfg=darkgrey
hi Constant     ctermfg=9
hi Special      ctermfg=5
hi Identifier   cterm=NONE          ctermfg=6
hi Function     ctermfg=green
hi Statement    ctermfg=3
hi PreProc      ctermfg=lightblue
hi Type         ctermfg=2
hi Underlined   cterm=underline     ctermfg=5
hi Ignore       ctermfg=darkgrey
hi Error        ctermfg=7         ctermbg=1

