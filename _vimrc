" My Vimrc file
" Maintainer: www.swaroopch.com/contact/
" Reference: Initially based on http://dev.gentoo.org/~ciaranm/docs/vim-guide/
" License: www.opensource.org/licenses/bsd-license.php

set nocompatible

execute pathogen#infect()
filetype on
filetype plugin on
filetype plugin indent on

"set noswapfile
set backupdir=d:\tmp
set directory=d:\tmp

set hidden
"set list

" Enable syntax highlighting.
syntax on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start 

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Set nowrap
set nowrap

set nojs

" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Minimal number of screen lines to keep above and below the cursor.
" set scrolloff=999

" Use UTF-8.
set encoding=utf-8

hi NonText gui=none

" Status line
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

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Ignore case when searching.
set ignorecase

set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

set fileencodings=utf-8,gk2312,gbk,gb18030
set termencoding=utf-8set
set guifontwide=NSimsun:h12
set guifont=Consolas:h12
set clipboard=unnamed
"set rnu
set nu
let g:ragtag_global_maps = 1


""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""

"nnoremap ; :
"nnoremap : ;

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>
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
set pastetoggle=<F2>

nmap <F5> :NERDTreeToggle documents<CR>

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
nmap <leader>l :set list!<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqip

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:»\ ,trail:~,extends:»,nbsp:· ",eol:¶

runtime bundle/dragvisuals/plugin/dragvisuals.vim

vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
nnoremap <Leader>t :%s:[\r \t]\+$<CR>

if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.ly           setf lilypond
  au! BufNewFile,BufRead *.asciidoc,*.adoc  setf asciidoc
  au! BufRead *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
  au! BufRead *.lyx syntax sync fromstart

  autocmd BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal filetype=asciidoc
        \ textwidth=80 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

augroup END

" Plugin EasyMotion
let g:EasyMotion_grouping = 2
hi link EasyMotionTarget ErrorMsg


