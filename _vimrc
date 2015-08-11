" My Vimrc file
" Maintainer: www.swaroopch.com/contact/
" Reference: Initially based on http://dev.gentoo.org/~ciaranm/docs/vim-guide/
" License: www.opensource.org/licenses/bsd-license.php

"-----------------------------------
" Important {{{
"-----------------------------------
set nocompatible

execute pathogen#infect()
filetype on
filetype plugin on
filetype plugin indent on

"if has("gui_running")
"    source $USERPROFILE\_vimrc
"endif

" }}}

"-----------------------------------
" Options {{{
"-----------------------------------
"" Moving around, searching & patterns: {{{2
"set hlsearch                   " Highlight all matches for the last used search pattern
set incsearch                  " Search as you type
set ignorecase                 " Ignore case when searching
set smartcase                  " Ignore case if search pattern is all lowercase,
                               " case-sensitive otherwise
" }}}

"" Buffers {{{2
set hidden
" }}}

"" Backup & swapfile: {{{2
"set noswapfile
set backupdir=d:\tmp
set directory=d:\tmp
" }}}

"" Displaying text: {{{2
set encoding=utf-8                                     " Use UTF-8
set termencoding=utf-8set
set fileencodings=utf-8,gk2312,gbk,gb18030

set nowrap
set listchars=tab:»\ ,trail:~,extends:»,nbsp:· ",eol:¶ " Use the same symbols as TextMate for tabstops and EOLs
set guifontwide=NSimsun:h12
set guifont=Consolas:h12
set clipboard=unnamed
set foldlevelstart=3

let g:ragtag_global_maps = 1
hi NonText gui=none
" }}}

"" Insert (Edit) Options: {{{2
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set autoindent
set nopaste
set pastetoggle=<F2>
set nojoinspaces               " Don't insert 2 spaces when joining lines after ? . !
" }}}

"" Status / Command Line Options: {{{2
set wildmenu                                 " Show autocomplete menus
set showmode                                 " Show editing mode
set showcmd                                  " Display incomplete commands
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
"set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
" }}}

"" Interface options: {{{2
set relativenumber
set number
set visualbell                               " Error bells are displayed visually
set noruler                                  " Show line number, cursor position
set rulerformat=%15(%c%V\ %p%%%)
set scrolloff=1
" }}}

"" Tabs and indenting: {{{2
" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent " Automatically indent when adding a curly bracket, etc.
" }}}

"" Print settings: {{{2
set printoptions=top:4pc,right:4pc,bottom:4pc,left:4pc
set printfont=Courier_New:h9
" }}}

" }}}

"-----------------------------------
" Syntax, highlighting & spelling
"-----------------------------------

"-----------------------------------
" Multiple tab pages
"-----------------------------------

"-----------------------------------
" Selecting text {{{
"-----------------------------------

syntax on " Enable syntax highlighting

" Minimal number of screen lines to keep above and below the cursor.
" set scrolloff=999

" }}}

"-----------------------------------
" Mappings {{{
"-----------------------------------

" change the mapleader from \ to ,
let mapleader=","

"nnoremap ; :
"nnoremap : ;

nnoremap ` '
nnoremap ' `

" F1 to be a context sensitive keyword-under-cursor lookup
nnoremap <F1> :help <C-R><C-W><CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>gv :tabe $MYGVIMRC<CR>
nnoremap <silent> <leader>so :so %<CR>

" Indent in normal mode using Tab
nnoremap <tab> >>

" Unindent using shift-tab
nnoremap <S-Tab> <<
"inoremap <S-Tab> <C-o><<

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y.%m.%d %a %I:%M%p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y.%m.%d %a %I:%M%p")<CR>

" To save, press ctrl-s.
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" To paste, press ctrl-v.
inoremap <c-v> <c-o>"+gp

" Map spacebar to toggle folds
"nnoremap <Space> zazt
nnoremap <Space> za

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Select to the last non-blank character of the current line
"vnoremap $ g_

"inoremap <M-o>       <Esc>o
"inoremap <C-j>       <Down>

" Remap <esc> to ;;
nnoremap <esc>        :noh<return><esc>
inoremap ;;           <esc>
inoremap <S-CR>       <esc>
cnoremap ;;           <C-c>
vnoremap ;;           <C-c>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
"nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>:set nopaste<CR>

" Shift-k split line before cursor
nnoremap <S-k>      i<CR><esc>

" Dokuwiki mapping
" Increase heading by one level
nnoremap == 0i=<end>=<esc>0

" Decrease heading by one level
nnoremap =- 0x$x0

inoremap ,,h1 <home>====== ======<CR><esc>bi
inoremap ,,h2 <home>===== =====<CR><esc>bi
inoremap ,,h3 <home>==== ====<CR><esc>bi
inoremap ,,h4 <home>=== ===<CR><esc>bi
inoremap ,,h5 <home>== ==<CR><esc>bi

nnoremap ,,h1 I====== <esc>A ======<esc>0
nnoremap ,,h2 I===== <esc>A =====<esc>0
nnoremap ,,h3 I==== <esc>A ====<esc>0
nnoremap ,,h4 I=== <esc>A ===<esc>0
nnoremap ,,h5 I== <esc>A ==<esc>0

" Reselect after indent so it can easily be repeated
vnoremap < <gv
vnoremap > >gv

" Shortcut to rapidly toggle `set list`
"nmap <leader>l :set list!<CR>

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqip

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
nnoremap <Leader>t :%s:[\r \t]\+$<CR>

" Delete buffer and loads next buffer in list
nmap <leader>bd :bp<bar>sp<bar>bn<bar>bd

" Change to directory of current file
nnoremap <leader>cd :cd %:h<cr>

" Toggle case
nnoremap \ ~<left>
vnoremap \ ~

" provide a mapping to fold on an already-performed search
nnoremap <leader>z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A

" }}}

"-----------------------------------
" Auto commands {{{
"-----------------------------------
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
    autocmd! BufNewFile,BufRead *.ly
       \ setf lilypond
       \ filetype off
       \ set runtimepath+='C:\Program Files (x86)\LilyPond\usr\share\lilypond\current\vim'
       \ filetype on
       \ syntax on
    autocmd! BufNewFile,BufRead *.asciidoc,*.adoc  setf asciidoc
    autocmd! BufRead *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
    autocmd! BufRead *.lyx syntax sync fromstart

    autocmd! BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
       \ setlocal filetype=asciidoc
       \ textwidth=80 wrap formatoptions=tcqn
       \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
       \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
augroup END

augroup vimrc
    au! BufWritePost .vimrc source $MYVIMRC
    au! BufWritePost _vimrc source $MYVIMRC
augroup END

" }}}

"-----------------------------------
" Plugins {{{
"-----------------------------------

" Plugin EasyMotion {{{
"-----------------------
let g:EasyMotion_re_anywhere = '\v' .
    \       '(<.|^$)' . '|' .
    \       '(.>|^$)' . '|' .
    \       '(\l)\zs(\u)' . '|' .
    \       '(_\zs.)' . '|' .
    \       '(#\zs.)'

hi link EasyMotionTarget        WarningMsg
hi link EasyMotionShade         WarningMsg
hi link EasyMotionTarget2First  MatchParen
hi link EasyMotionTarget2Second MatchParen
hi link EasyMotionMoveHL Search

" Turn on case sensitive feature for target keys
let g:EasyMotion_smartcase = 1

" keep cursor colum when JK motion
let g:EasyMotion_startofline = 0 

let g:EasyMotion_grouping = 1

let g:EasyMotion_keys='l,rcpgyf;zqvjwkmasonetuh'
" default 'asdghklqwertyuiopzxcvbnmfj;'

let g:EasyMotion_do_shade = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
" }}}

" Plugin incsearch.vim {{{
"-----------------------
" }}}

" Plugin Goyo {{{
"-----------------------
"let g:goyo_width = 85             " (default: 80)
"let g:goyo_margin_top = 1    " (default: 4)
"let g:goyo_margin_bottom = 1 " (default: 4)
" }}}


" }}}

"-----------------------------------
" Plugin list {{{
"-----------------------------------
ctrlp.vim            https://github.com/ctrlpvim/ctrlp.vim.git
delimitMate          https://github.com/Raimondi/delimitMate.git
gruvbox              https://github.com/morhetz/gruvbox.git
jellybeans.vim       https://github.com/nanotech/jellybeans.vim.git
lightline.vim        https://github.com/itchyny/lightline.vim.git
nerdcommenter        https://github.com/scrooloose/nerdcommenter.git
nerdtree             https://github.com/scrooloose/nerdtree.git
renamer.vim          https://github.com/vim-scripts/renamer.vim.git
tlib_vim             https://github.com/tomtom/tlib_vim.git
vim-abolish          https://github.com/tpope/vim-abolish.git
vim-addon-mw-utils   https://github.com/MarcWeber/vim-addon-mw-utils.git
vim-asciidoc         https://github.com/mjakl/vim-asciidoc.git
vim-choosewin        https://github.com/t9md/vim-choosewin.git
vim-colors-solarized https://github.com/altercation/vim-colors-solarized.git
vim-dokuwiki         https://github.com/nblock/vim-dokuwiki.git
vim-easy-align       https://github.com/junegunn/vim-easy-align.git
vim-easymotion       https://github.com/Lokaltog/vim-easymotion.git
vim-exchange         https://github.com/tommcdo/vim-exchange.git
vim-expand-region    https://github.com/terryma/vim-expand-region.git
vim-fugitive         https://github.com/tpope/vim-fugitive.git
vim-hybrid           https://github.com/w0ng/vim-hybrid.git
vim-kolor            https://github.com/zeis/vim-kolor.git
vim-lilypond         https://github.com/cg433n/vim-lilypond.git
vim-lucius           https://github.com/jonathanfilip/vim-lucius.git
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-repeat           https://github.com/tpope/vim-repeat.git
vim-snipmate         https://github.com/garbas/vim-snipmate.git
vim-snippets         https://github.com/honza/vim-snippets.git
vim-speeddating      https://github.com/tpope/vim-speeddating
vim-surround         https://github.com/tpope/vim-surround.git
vim-tomorrow-theme   https://github.com/chriskempson/vim-tomorrow-theme.git
vim-unimpaired       https://github.com/tpope/vim-unimpaired.git
vim-vinegar          https://github.com/tpope/vim-vinegar.git
wikidpad
workflowish          https://github.com/lukaszkorecki/workflowish.git
vim-foldsearch       https://github.com/embear/vim-foldsearch

" }}}


" vim: set foldmethod=marker foldlevel=0 :
