let $PYTHONPATH="/usr/lib/python3.3/site-packages"
set nocompatible
set encoding=utf-8

" Settings {{{
"-------------------------------------------------
" File Detection
filetype plugin indent on
syntax on
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

set backspace=2         "backspace over everything
set fcs=vert:│,fold:-   " solid instead of broken line for vert splits
set hidden              " hide when switching buffers, don't unload
set laststatus=2
set mouse=a             " enable mouse in all modes
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set spelllang=en_us
set title
set wildmenu
set wildmode=full
set nowrap

" folding
set foldignore=
set foldlevelstart=99
set foldmethod=marker
set fdc=2

" Tabs
set autoindent
set expandtab
set shiftwidth=2        " Num of spaces to use for each (auto)indent.
set smarttab
set softtabstop=2
set tabstop=2

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Status line
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" }}}
" LaTeX Suite {{{
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
let g:Tex_ViewRule_dvi = 'xdvi'
" }}}

" From gtmanfred {{{
let g:netrw_http_cmd='curl -sL'
let g:netrw_http_xcmd='-o'
let g:netrw_silent=1
let g:clang_library_path = "/usr/lib"
let g:clang_auto_select = 1
let g:tar_cmd = 'bsdtar'
" }}}

" YCM {{{
let g:ycm_extra_conf_globlist = [ '~/git/KaiSforza/*', '*' ]
" }}}

set backup              " keep a backup file
set history=50          " keep 50 lines of command line history
set number              " display line numbers

"Color scheme
set background=dark
colo darkZ2

" Tlist Commands and variables
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :TlistUpdate<CR>
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Auto_Open = 1
let Tlist_Max_Submenu_Items = 20
"let Tlist_Display_Prototype = 1

" PDF Stuff
"command Rpdf :r !pdftotext -nopgbrk <q-args> -
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END

" Convenient command to see the difference between the current buffer and
" the file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" Version specific stuffs{{{
if version >= 703
  "This stuff doesn't like working with old versions, I think 7.3 was when
  "this was included.
  autocmd FileType text setlocal textwidth=78 colorcolumn=78
  au FileType python setlocal tabstop=4 expandtab shiftwidth=4
        \ softtabstop=4 textwidth=79  colorcolumn=79
  set colorcolumn=76
  hi ColorColumn ctermbg=1 guibg=1
else
  autocmd FileType text setlocal textwidth=78
  au FileType python setlocal tabstop=4 expandtab shiftwidth=4
        \ softtabstop=4 textwidth=79
endif "}}}

"au FileType java setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
"au FileType java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
"au FileType java set makeprg=/usr/bin/javac\ -d\ ../bin\ %
au FileType PKGBUILD set makeprg=/usr/bin/makepkg

au BufNewFile,BufRead *.t2t set ft=txt2tags
au BufNewFile,BufRead *.md  set ft=markdown tw=76
au BufNewFile,BufRead *.rst set tw=76
au BufNewFile,BufRead *.asm set tabstop=4 expandtab shiftwidth=4
      \ softtabstop=4
au FileType haskell setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

