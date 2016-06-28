set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'marijnh/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:SimpylFold_docstring_preview=1

autocmd BufNewFile,BufRead *.py 
			\ set tabstop=4   |
			\ set softtabstop=4  |
			\ set shiftwidth=4  |
			\ set expandtab  |
			\ set autoindent  |
			\ set fileformat=unix

autocmd BufNewFile,BufRead *.cpp 
			\ set tabstop=4   |
			\ set softtabstop=4  |
			\ set shiftwidth=4  |
			\ set expandtab  |
			\ set autoindent  |
			\ set fileformat=unix

autocmd BufNewFile,BufRead *.js
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

autocmd BufNewFile,BufRead *.html
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

autocmd BufNewFile,BufRead *.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" space-g will goto definition of whatever I’m currently on
let g:ycm_autoclose_preview_window_after_completion=1
map <C-c>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

" if has('gui_running')
" 	set background=dark
" 	colorscheme solarized
" else
" 	colorscheme zenburn
" endif
call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:nerdtree_tabs_open_on_gui_startup=0
" Open NERDTree on gvim/macvim startup

let g:nerdtree_tabs_open_on_console_startup=0
" Open NERDTree on console vim startup

let g:nerdtree_tabs_no_startup_for_diff=1
" Do not open NERDTree if vim starts in diff mode

let g:nerdtree_tabs_smart_startup_focus=1
" On startup, focus NERDTree if opening a directory, focus file if opening a file. (When set to 2, always focus file window after startup).

let g:nerdtree_tabs_open_on_new_tab=1
" Open NERDTree on new tab creation (if NERDTree was globally opened by :NERDTreeTabsToggle)

let g:nerdtree_tabs_meaningful_tab_names=1
" Unfocus NERDTree when leaving a tab for descriptive tab names

let g:nerdtree_tabs_autoclose=1
" Close current tab if there is only one window in it and it's NERDTree

let g:nerdtree_tabs_synchronize_view=1
" Synchronize view of all NERDTree windows (scroll and cursor position)

let g:nerdtree_tabs_synchronize_focus=1
" Synchronize focus when switching windows (focus NERDTree after tab switch if and only if it was focused before tab switch)

let g:nerdtree_tabs_focus_on_files=1
" When switching into a tab, make sure that focus is on the file window, not in the NERDTree window. (Note that this can get annoying if you use NERDTree's feature \"open in new tab silently\", as you will lose focus on the NERDTree.)

let g:nerdtree_tabs_startup_cd=1
" When given a directory name as a command line parameter when launching Vim, :cd into it.

let g:nerdtree_tabs_autofind=1
" Automatically find and select currently opened file in NERDTree.

set clipboard=unnamed
set nomodeline

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

set nu

nnoremap <space> za
vnoremap <space> zf

let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1

let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set pastetoggle=<F2>


" MCLS
"
" No numbering on MCLS as we need to be able to cut-n-paste visually when
" executing them.
autocmd BufRead ~/linkedin/doc/tools/mcl/* setlocal nonu
" Use template on new MCLS
autocmd BufNewFile ~/linkedin/doc/tools/mcl/*.txt 0r ~/.vim/skeleton.mcl
" Conf syntax highlights script bits and comments nicely.
autocmd BufRead,BufNewFile ~/linkedin/doc/tools/mcl/*.txt set syntax=conf
" No need to get crazy with tabs of 8 here.
autocmd BufNewFile ~/linkedin/doc/tools/mcl/*.txt set tabstop=4


