set encoding=utf-8
scriptencoding utf-8
set ambiwidth=double
set fileencoding=utf-8
set number
set title
set list
set incsearch
set hlsearch
set ignorecase
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set cursorline
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
set backspace=indent,eol,start
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set wildmenu
set history=10000
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
set t_Co=256
"----------------------------------------------------------
" CtrlPの設定
"----------------------------------------------------------
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky', 'commandline'] " CtrlPの拡張として「funky」と「commandline」を使用

" CtrlPCommandLineの有効化
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())

" CtrlPFunkyの有効化
let g:ctrlp_funky_matchtype = 'path'
" Vim-LaTeX
set shellslash
set grepprg=grep\ -nH\ $*
let tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_FormatDependency_pdf='dvi,pdf'
let g:Tex_CompileRule_dvi='platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf='dvipdfm $*.dvi'
let g:Tex_ViewRule_pdf='evince'
augroup PrevimSettings
let g:previm_open_cmd='evince'
    autocmd!
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mark*} set filetype=markdown
let g:vimtex_view_general_viewer = 'markdown'
augroup END
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
  call dein#add('Shougo/unite.vim')
  call dein#add('itchyny/lightline.vim') " 情報を見やすく
  call dein#add('nathanaelkane/vim-indent-guides') " インデントを色分け
  call dein#add('Townk/vim-autoclose') " カッコを自動で締めてくれる
  call dein#add('carakan/new-railscasts-theme')
  call dein#add('bronson/vim-trailing-whitespace') "無駄な空白検知
  call dein#add('plasticboy/vim-markdown')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('tacahiroy/ctrlp-funky')
  call dein#add('suy/vim-ctrlp-commandline')
  call dein#add('rhysd/accelerated-jk')
  call dein#add('anekos/felis-cat-igirisu-toast-express')
  call dein#add('kannokanno/previm')
  call dein#add('vim-latex/vim-latex')
  call dein#add('lervag/vimtex')
  call dein#add('suan/vim-instant-markdown')
  call dein#add('thinca/vim-quickrun')
  call dein#add('valloric/youcompleteme')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('ervandew/supertab')
  call dein#add('scrooloose/nerdtree')
  call dein#add('')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax on
syntax enable
set autoindent
set tabstop=4



" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

noremap <C-e> <esc>
noremap! <C-e> <esc>
noremap <CR> o<esc>
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
" colorscheme周り
set background=dark
colorscheme new-railscasts

let g:instant_markdown_slow = 1
set clipboard=unnamedplus
let g:tex_flavor = "latex"
let g:vimtex_latexmk_enabled = 1
let g:vimtex_latexmk_options = ' -pvc -pdfdvi'
let g:latex_latexmk_continuous = 1
let g:latex_latexmk_background = 1
let g:vimtex_latexmk_callback = 1
let g:previm_enable_realtime = 1
let g:vimtex_fold_envs = 0
let g:latex_view_method = 'general'
let g:latex_view_general_viewer = 'evince'
let g:vimtex_view_general_viewer = 'evince'
function! Tex_ForwardSearchLaTeX()
  let cmd = 'evince_forward_search ' . fnamemodify(Tex_GetMainFileName(), ":p:r") .  '.pdf ' . line(".") . ' ' . expand("%:p")
  let output = system(cmd)
endfunction
augroup filetype
  autocmd!
  " tex file (I always use latex)
  autocmd BufRead,BufNewFile *.tex set filetype=tex
augroup END

" disable the conceal function
let g:tex_conceal=''
let g:latex_latexmk_options = '-pvc -pdfdvi'
"半透明化の設定
"  autocmd vimrc_loading VimEnter,ColorScheme * highlight Normal ctermbg=NONE
"  autocmd vimrc_loading VimEnter,ColorScheme * highlight NonText ctermbg=NONE
"  autocmd vimrc_loading VimEnter,ColorScheme * highlight TablineSel ctermbg=NONE
"  autocmd vimrc_loading VimEnter,ColorScheme * highlight LineNr ctermbg=NONE
"  autocmd vimrc_loading VimEnter,ColorScheme * highlight CursorLineNr ctermbg=NONE
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight TablineSel ctermbg=NONE
highlight LineNr ctermbg=NONE
highlight CursorLineNr ctermbg=NONE
" nathanaelkane/vim-indent-guidesの設定
let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
" config around quickrun(especially latex)
let g:quickrun_config = {}
let g:quickrun_config = {
\   "_" :{
\         "runner" : "vimproc",
\         "runner/vimproc/updatetime" : 1
\         },
\   "tex" : {
\       'command' : 'latexmk',
\       "outputter/buffer/split" : ":botright 8sp",
\       'outputter/error/error' : 'quickfix',
\       'hook/cd/directory': '%S:h',
\       'exec': '%c %s'
\   },
\}

augroup myLaTeXQuickrun
    au!
    au BufEnter *.tex call <SID>SetLaTeXMainSource()
    au BufEnter *.tex nnoremap <Leader>v :call <SID>TexPdfView() <CR>
augroup END
function! s:SetLaTeXMainSource()
    let currentFileDirectory = expand('%:p:h').'\'
    let latexmain = glob(currentFileDirectory.'*.latexmain')
    let g:quickrun_config['tex']['srcfile'] = fnamemodify(latexmain, ':r')
    if latexmain == ''
        unlet g:quickrun_config['tex']['srcfile']
    endif
endfunction
function! s:TexPdfView()
    let texPdfFilename = expand('%')
    if exists("g:quickrun_config['tex']['srcfile']")
        let texPdfFilename = fnamemodify(g:quickrun_config['tex']['srcfile'], ':.:r') . '.pdf'
    endif
    if has('win32')
        let g:TexPdfViewCommand = '!start '.
                    \             '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance '.
                    \             texPdfFilename
    endif
    if has('unix')
        let g:TexPdfViewCommand = '! '.
                    \             'evince'.
                    \             texPdfFilename
    endif
    execute g:TexPdfViewCommand
endfunction
