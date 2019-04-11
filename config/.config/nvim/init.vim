"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
" Config for Neovim
" Author: Max Storr
" Date: 11.04.2019

" Plugins {{{
"" Plugins managed by junegunn/vim-plug.
"" Auto-installation for vim-plug.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Begin plugins.
call plug#begin('~/.config/nvim/plugged/')
    Plug 'altercation/vim-colors-solarized'
    Plug 'tpope/vim-surround'
    Plug 'ying17zi/vim-live-latex-preview'
    Plug 'junegunn/goyo.vim'
call plug#end()
" }}}

" Colourscheme {{{
set background=dark
colorscheme solarized
" }}}

" Key Remapping {{{
"" Cntrl + vim directional key to navigate splits.
nnoremap <C-J> <C-W><C-j>
nnoremap <C-K> <C-W><C-k>
nnoremap <C-L> <C-W><C-l>
nnoremap <C-H> <C-W><C-h>

"" Traverse wrapped lines correctly.
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

"" Navigating with guides:
"" Double-press semicolon in any mode to jump to the next guide.
inoremap ;; <Esc>/<++><Enter>"_c4l
vnoremap ;; <Esc>/<++><Enter>"_c4l
map ;; <Esc>/<++><Enter>"_c4l

"" Better indendation of code blocks.
vnoremap < <gv
vnoremap > >gv

"" Easier command mode.
noremap ; :
"" Tab to fold code blocks.
nnoremap <tab> za
"" jk is easier to reach than esc.
inoremap jk <esc>
" }}}

" UI Settings {{{
"" Dynamic number lines.
set number
set relativenumber

"" Filetype specific plugins, syntax highlighting, and indentation.
filetype on
syntax on

"" Stop colourscheme from altering GNOME-Terminal opacity settings.
highlight Normal ctermbg=none
highlight NonText ctermbg=none

"" Misc.
set lazyredraw
set nowrap
set colorcolumn=80
set noerrorbells
set showmatch
set encoding=utf-8
" }}}

" Misc. Settings {{{
"" Split methods.
set splitbelow
set splitright

"" Indentation settings.
set tabstop=8           " Maximum width of a tab character.
set shiftwidth=4        " Size of an indent.
set expandtab           " Tab button types spaces.

"" Fold settings.
set foldmethod=syntax
set foldlevel=3         " Fold any blocks deeper than 3 indents.

set conceallevel=2      " Conceal useful for markdown/latex notes.
" }}}

" Netrw Settings {{{
"" This is Vim's built-in file explorer.
let g:netrw_banner = 0          " Hide the banner in netrw file explorer.
let g:netrw_liststyle = 3
let g:netrw_winsize = 15        " Netrw takes up 15% of the current split.
let g:netrw_browse_split = 2    " Opened files go to new vertical split.
"}}}

" Tex File Autocommands {{{
augroup latex_code_snippets
    autocmd!
    autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i|
        \ inoremap ;bf \textbf{}<++><Esc>T{i|
        \ inoremap ;it \textit{}<++><Esc>T{i|
        \ inoremap ;ct \textcite{}<++><Esc>T{i|
        \ inoremap ;cc \cite{}<++><Esc>T{i|
        \ inoremap ;cp \parencite{}<++><Esc>T{i|
        \ inoremap ;ref \ref{}<++><Esc>T{i|
        \ inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i|
        \ inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i|
        \ inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i|
        \ inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0/DELRN<Enter>cgn|
        \ inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>|
        \ inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>|
        \ set spell|
        \ set wrap
        \ set spell
augroup END
" }}}

" Vimrc Fold Method {{{
set modelines=1
" vim:foldmethod=marker:foldlevel=0
