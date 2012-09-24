"vundle setup
filetype off
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" vundle managed plugins & scripts
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rails'
Bundle 'rainux/vim-desert-warm-256'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'chrisbra/NrrwRgn'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/StatusLineHighlight'
Bundle 'rson/vim-conque'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/rubycomplete.vim'
Bundle 'tpope/vim-endwise'
Bundle 'vim-scripts/Rename'
Bundle 'vim-scripts/simplefold'

filetype plugin indent on
" END of vundle
" set up for vim-textobj-ruby-block
runtime macros/matchit.vim

" color and visual
set term=xterm-256color
colorscheme desert-warm-256   
set gfn=Bitstream\ Vera\ Sans\ Mono\ 10
set tabstop=3
set shiftwidth=3
set showcmd
set laststatus=2

" custom mappings
" Change modes with ;;
imap ;; <Esc>
map ;; <Esc>
" un-indent with shift-tab [not working]
" imap <s-tab> <C-d>
" change leader key from '\' to ','
let mapleader = ","
" new lines without entering insert mode
map <CR>k O<Esc>j
map <CR>j o<Esc>k
map <leader>nt :NERDTree<CR>
" Window managment [not working]
"map - <C-W>-
"map + <C-W>
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_+
" Maps <esc> to remove highlighting
nnoremap <Bslash> :noh<return><esc>
"Helpeful abbreviations
nmap <space> :

" Mappings for Eclim
" http://eclim.org/vim/java/index.html#features
" Search for the javadocs of the element under the cursor with <leader>d.
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
" Perform a context sensitive search of the element under the cursor with <CR>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

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

"Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this
"- http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
	let string=a:string
	let string = escape(string, '^$.*\/~[]')
	let string = substitute(string, '\n', '\\n', 'g')
	return string
endfunction
" Get the current visual block for search and replaces
" This function passed the visual block through a string escape
" Based on this
"- http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
	let reg_save = getreg('"')
	let regtype_save = getregtype('"')
	let cb_save = &clipboard
	set clipboard&
	let selection = getreg('"')
	call setreg('"', reg_save, regtype_save)
	let &clipboard = cb_save
	let escaped_selection = EscapeString(selection)
	return escaped_selection
endfunction
" Start the find and replace command across the entire file
vmap <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>/

" Bubble single lines
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
	execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
	execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
 autocmd InsertLeave * set iminsert=0
" Misc.
au FocusLost * :wa " save when term window looses focus 
"set showmatch " show matching brackets [annoying]
set splitbelow
"folding
set foldmethod=syntax
set foldnestmax=3
set nofoldenable
set foldlevel=1
" Not exactly sure what these do...
set wildmenu
set nu
set wildmode=list:longest
set completeopt=longest,menuone
