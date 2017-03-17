set encoding=utf-8
scriptencoding utf-8
set ambiwidth=double
set fileencoding=utf-8
set ambiwidth=double
set number
set title
set list
set incsearch
set hlsearch
set cursorline
set whichwrap=b,s,h,l,<,>,[,],~
set backspace=indent,eol,start
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set wildmenu
set history=5000 
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/halcyon/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/halcyon/.vim/bundle')
  call dein#begin('/home/halcyon/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/home/halcyon/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('tpope/vim-surround')


  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif


