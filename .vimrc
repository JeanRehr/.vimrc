" Basic Stuff
set nocompatible
set clipboard+=unnamed " Enable paste from clipboard
set encoding=utf-8
set wildmode=longest,list,full " Enable autocompletion
set number relativenumber
set textwidth=88
set wrap linebreak nolist
set autoindent
syntax enable
filetype plugin on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Disables autocommenting on newline


" Finding Files: Search down into subfolders and provides tab-completion &&
" display all matching files when we tab complete

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
" - ctrl+t goes back through tags you jumped


" Autocomplete: documented in |ins-completion|
" - Ctrl+x+Ctrl+n = just this file
" - Ctrl+x+Ctrl+f = filenames (work with path trick)
" - Ctrl+x+Ctrl+] = tags only
" - Ctrl+n = anything
" Use Ctrl+n and Ctrl+p to go back and forth in suggestions menu

" File Browsing:

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" - :edit a folder to open a file browser
" - <CR>/v/t to open in a h-split/v-split/tab (<CR> = enter)
" - check |netrw-browse-maps| for more mappings

" Snippets: Type something you always type with fewer key strokes.



" Basic noremaps:
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<Enter><Enter>}<Esc>kddk$a<CR>
inoremap ` ``<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" prevents <Esc> from del indentation
noremap <silent> <Esc> <C-O>:stopinsert<CR>
nnoremap o ox<BS>
nnoremap O Ox<BS>
nnoremap <CR> ox<BS>
inoremap <CR> <Esc>ox<BS>
" prevents <Esc> from del indentation


" Java noremaps:

inoremap ;sys System.out.println();<Esc>hi
inoremap ;pc public class  {<Enter><Enter>}<Esc>kddk$a<Enter><Esc>k$hi
inoremap ;main public static void main (String args[]) {<Enter><Enter>}<Esc>kddk$a<CR>


" C-like languages
set autoindent
set smartindent
set cindent
