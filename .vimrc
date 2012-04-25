"vundle setup
filetype off
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" vundle managed plugins & scripts
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'rainux/vim-desert-warm-256'
Bundle 'comments.vim'

filetype plugin indent on
" END of vundle

" color and visual
set term=xterm-256color
colorscheme desert-warm-256   
set gfn=Bitstream\ Vera\ Sans\ Mono\ 10
set tabstop=3
set shiftwidth=3

" custom mappings
" Change modes with ;;
imap ;; <Esc>
" un-indent with shift-tab
imap <leader><tab> <C-x><C-o>

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
nmap <space> :

" better wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

" syntax coloring and auto-indenting
filetype plugin on
filetype indent on
" filetype on " Can't be one because of vundle
syntax enable
set syntax=automatic
set autoindent
fixdel

" search options
set hlsearch
set ignorecase
set smartcase

" Bubble single lines
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv


"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Misc.
au FocusLost * :wa " save when term window looses focus 
set showmatch " show matching brackets
set foldenable
set splitbelow
" Not exactly sure what these do...
set wildmenu
set nu
set wildmode=list:longest
set completeopt=longest,menuone