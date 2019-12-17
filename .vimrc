" Basic Stuff
set nocompatible
set directory^=$HOME/.config/nvim/swap// "swap dir
set clipboard+=unnamed " Enable paste from clipboard
set encoding=utf-8
set wildmode=longest,list,full " Enable autocompletion
set number relativenumber
set textwidth=88
set wrap linebreak nolist
set autoindent
set hidden
set path=**
colo default
autocmd BufWritePre * %s/\s\+$//e " Automatically deletes all trailing whitespace on save.
syntax enable
filetype plugin on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables autocommenting on newline
set autoindent
set smartindent
set cindent

" vim-plug
call plug#begin('~/.config/nvim/plugged')
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdtree'
	Plug 'junegunn/goyo.vim'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'jreybert/vimagit'
	Plug 'tpope/vim-commentary'
	Plug 'kovetskiy/sxhkd-vim'
	Plug 'vim-ctrlspace/vim-ctrlspace'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Plug 'LucHermitte/lh-vim-lib'
	" Plug 'LucHermitte/lh-tags'
	" Plug 'LucHermitte/lh-dev'
	" Plug 'LucHermitte/lh-style'
	" Plug 'LucHermitte/lh-brackets'
	Plug 'LucHermitte/vim-refactor'
	" todo Eclim
call plug#end()

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Vim airline
let g:airline#extensions#tabline#enabled = 1 " tab ext
let g:airline_theme='deus'

" func to change background
function! ReverseBackground()
	let Mysyn=&syntax
	if &bg=="light"
		se bg=dark
		highlight Normal guibg=black guifg=white
	else
		se bg=light
		highlight Normal guibg=white guifg=black
	endif
	syn on
	exe "set syntax=" . Mysyn
	" echo "now syntax is "&syntax
endfunction
command! Invbg call ReverseBackground()
noremap <F11> :Invbg<CR>
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" end func

" Finding Files: Search down into subfolders and provides tab-completion &&
" display all matching files when tab complete
set path+=**
set wildmenu

" - Hit tab to :find by partial match (:ls to list files)
" - Use * to make it fuzzy
" - :b lets you autocomplete any open buffer


" Tag Jumping: create `tags` file (ctags)
command! MakeTags !ctags -R .

" - Ctlr+] to jump to tag under cursor
" - g+Ctrl+] for amgiguous tags
" - Ctrl+t to jump back the tag stack
" - Ctrl+t goes back through tags you jumped


" Autocomplete: documented in |ins-completion|
" - Ctrl+x+Ctrl+n = just this file
" - Ctrl+x+Ctrl+f = filenames (work with path trick)
" - Ctrl+x+Ctrl+] = tags only
" - Ctrl+n = anything
" Use Ctrl+n and Ctrl+p to go back and forth in suggestions menu

" File Browsing:
" let g:netrw_banner=0
" let g:netrw_browse_split=4
" let g:netrw_altv=1
" let g:netrw_liststyle=3
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" - :edit a folder to open a file browser
" - <CR>/v/t to open in a h-split/v-split/tab (<CR> = enter)
" - check |netrw-browse-maps| for more mappings

" Snippets: Type something you always type with fewer key strokes.


" Basic noremaps:
nnoremap <Tab> a<Tab><Esc>
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap "" ""
inoremap ( ()<Esc>i
inoremap () ()
inoremap (<Space> ()<Space>
inoremap [ []<Esc>i
inoremap [] []
inoremap [<Space> []<Space>
inoremap [[ [][]
inoremap { {}<Esc>i
inoremap {} {}
inoremap {<Space> {}<Space>
inoremap {<CR> {<Enter>}<Esc>k$o

" Java maps:
autocmd FileType java inoremap ;sys System.out.println();<Esc>hi
autocmd FileType java inoremap ;get public get() {<Enter>return ; <Enter>}<Esc>kk0fca<Space>
autocmd FileType java inoremap ;set public void set( ) {<Enter>this. = ;<Enter>}<Esc>kk0fta
autocmd FileType java inoremap ;pc public class <C-R>% {<Enter>}<Esc>kf.5x$o
autocmd FileType java inoremap ;p% public <C-R>%() {<Enter>}<Esc>k0f.5xa
autocmd FileType java inoremap ;main public static void main (String[] args) {<Enter>}<Esc>k$o

" Shell maps
autocmd FileType sh inoremap [[ [[]]<Esc>hi
