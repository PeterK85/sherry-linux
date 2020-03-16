set nocompatible
"------------------------------------------------------------------------------------
" Author: Peter Kurtz
" This is config file for Peter's Vim editor.
" Description: This vimrc always for creating a 1337 hackerman experience while 
" writing hardcore scripts to hack into the NSA.
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
" Tabs
"------------------------------------------------------------------------------------
" Changes the tab character to spaces
set expandtab

" Set the amount of spaces for a tab character to 4
set tabstop=4

" Indenting is 4 spaces
set shiftwidth=4

" Turn on line numbers by default
set number

" Turns on autoindentation for new lines
set autoindent

"------------------------------------------------------------------------------------
" Scrolling
"------------------------------------------------------------------------------------

"Set the scroll to EOF so always show 10 lines about it
set scrolloff=15

"------------------------------------------------------------------------------------
" Auto-Complete
"------------------------------------------------------------------------------------
"Multiple Line comments
abbr /* /* */<Left><Left><Left>

"Multitple line curly braces
abbr { { }<Left><Left>

"() with three spaces inbetween them
"abbr ( ( )<Left><Left>

"------------------------------------------------------------------------------------
" Status Line
"------------------------------------------------------------------------------------
set laststatus=2

set statusline=
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0

"------------------------------------------------------------------------------------
" Syntax Highlighting
"------------------------------------------------------------------------------------

syntax on
colo industry
hi Normal guibg=NONE ctermbg=NONE

"------------------------------------------------------------------------------------
" Last known location
"------------------------------------------------------------------------------------

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"------------------------------------------------------------------------------------
" Misc.
"------------------------------------------------------------------------------------
source ~/.vim/mappings.vim

" Highlighting
" source ~/.vim/highlighting.vim

set history=0
set showcmd
set wildmenu
set scrolloff=8
set laststatus=2
set rtp+=/usr/lib/python3.8/site-packages/powerline/bindings/vim

