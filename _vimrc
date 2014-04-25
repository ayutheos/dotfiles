﻿" My Vimrc file
" Maintainer: www.swaroopch.com/contact/
" Reference: Initially based on http://dev.gentoo.org/~ciaranm/docs/vim-guide/
" License: www.opensource.org/licenses/bsd-license.php

"-----------------------------------
" Important
"-----------------------------------
set nocompatible

execute pathogen#infect()
filetype on
filetype plugin on
filetype plugin indent on

if has("gui_running")
    "source C:\Users\user\_vimrc
endif

"-----------------------------------
" Options
"-----------------------------------
"" Moving around, searching & patterns:
"set hlsearch                   " Highlight all matches for the last used search pattern
set incsearch                  " Search as you type
set ignorecase                 " Ignore case when searching
set smartcase                  " Ignore case if search pattern is all lowercase,
                               " case-sensitive otherwise

"" Buffers
set hidden

"" Backup & swapfile:
"set noswapfile
set backupdir=d:\tmp
set directory=d:\tmp

"" Displaying text
"set list

"" Insert (Edit) Options:
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set autoindent
set nopaste
set pastetoggle=<F2>
set nojoinspaces               " Don't insert 2 spaces when joining lines after ? . !

"" Status / Command Line Options:
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

"" Interface options:
set relativenumber
set number
set visualbell                               " Error bells are displayed visually
set ruler                                    " Show line number, cursor position

"" Tabs and indenting:
" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent " Automatically indent when adding a curly bracket, etc.

"" Displaying text:
set nowrap
set listchars=tab:»\ ,trail:~,extends:»,nbsp:· ",eol:¶ " Use the same symbols as TextMate for tabstops and EOLs
set encoding=utf-8                                     " Use UTF-8
set fileencodings=utf-8,gk2312,gbk,gb18030
set termencoding=utf-8set
set guifontwide=NSimsun:h12
set guifont=Consolas:h12
set clipboard=unnamed

let g:ragtag_global_maps = 1
hi NonText gui=none






"-----------------------------------
" Syntax, highlighting & spelling
"-----------------------------------

"-----------------------------------
" Multiple tab pages
"-----------------------------------

"-----------------------------------
" Selecting text
"-----------------------------------

syntax on " Enable syntax highlighting

" Minimal number of screen lines to keep above and below the cursor.
" set scrolloff=999



"-----------------------------------
" Mappings
"-----------------------------------

" change the mapleader from \ to ,
let mapleader=","

"nnoremap ; :
"nnoremap : ;

" F1 to be a context sensitive keyword-under-cursor lookup
nnoremap <F1> :help <C-R><C-W><CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>
nmap <silent> <leader>gv :tabe $MYGVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Indent in normal mode using Tab
nmap <tab> >>

" Unindent using shift-tab
nmap <S-Tab> <<
imap <S-Tab> <C-o><<

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y.%m.%d %a %I:%M%p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y.%m.%d %a %I:%M%p")<CR>

" To save, press ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" To paste, press ctrl-v.
imap <c-v> <Esc>"+gpi

nmap <F5> :NERDTreeToggle<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
nnoremap <esc>       :noh<return><esc>
imap     zz          <esc>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>:set nopaste<CR>

" Shift-k split line before cursor
nnoremap <S-k>      i<CR><esc>

"Dokuwiki mapping
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

"Reselect after indent so it can easily be repeated
vnoremap < <gv
vnoremap > >gv

" Shortcut to rapidly toggle `set list`
"nmap <leader>l :set list!<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqip

vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
nnoremap <Leader>t :%s:[\r \t]\+$<CR>

" Delete buffer
nmap <leader>bd :bp<bar>sp<bar>bn<bar>bd

" change to directory of current file
nmap <leader>cd :cd %:h<cr>

"-----------------------------------
" Auto commands
"-----------------------------------
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.ly
        \ setf lilypond
        \ filetype off
        \ set runtimepath+='C:\Program Files (x86)\LilyPond\usr\share\lilypond\current\vim'
        \ filetype on
        \ syntax on
  au! BufNewFile,BufRead *.asciidoc,*.adoc  setf asciidoc
  au! BufRead *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
  au! BufRead *.lyx syntax sync fromstart

  autocmd! BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal filetype=asciidoc
        \ textwidth=80 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

augroup END

au! BufWritePost .vimrc source %
au! BufWritePost _vimrc source %

"-----------------------------------
" Plugins
"-----------------------------------

" Plugin dragvisuals
"-----------------------
runtime bundle/dragvisuals/plugin/dragvisuals.vim

" Plugin EasyMotion
let g:EasyMotion_grouping = 2
hi link EasyMotionTarget ErrorMsg


