" 精简界面
set guioptions-=m
set guioptions-=r
set guioptions-=T

set nobackup
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set regexpengine=1
set incsearch
set hlsearch

		 " *********************************
		 " *********************************
		   " ******** Vundle Settings ****
		 " *********************************
		 " *********************************

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'OmniSharp/omnisharp-vim'
Plugin 'easymotion/vim-easymotion'
"Plugin 'tpope/vim-dispatch'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
		 " *********************************
		 " *********************************
		   " ******** Vundle End ****
		 " *********************************
		 " *********************************
"

syntax enable
let mapleader = " "
inoremap fd <esc>
nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader>q <c-w>q
nnoremap <c-h> <c-w>h
"nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

imap <c-j> <Plug>snipMateNextOrTrigger
smap <c-j> <Plug>snipMateNextOrTrigger

" ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" jsbeautify config
"map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-a-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-a-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-a-f> :call CSSBeautify()<cr>

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


set background=dark
set number
colorscheme gruvbox
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=light

let g:airline#extensions#tabline#enabled = 1

function! ToggleBackground()
    "if (w:solarized_style=="dark")
    "let w:solarized_style="light"
    if (&background=="dark")
        let &background="light"
        "colorscheme solarized
    else
        "let w:solarized_style="dark"
        let &background="dark"
        "colorscheme solarized
    endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F5> :call ToggleBackground()<CR>
inoremap <F5> <ESC>:call ToggleBackground()<CR>a
vnoremap <F5> <ESC>:call ToggleBackground()<CR>

noremap ;; :%s:::g<Left><Left><Left>
noremap ; :%s:::cg<Left><Left><Left><Left>


