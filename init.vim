" Required for vundle
set nocompatible
filetype off
set shell=/bin/bash

" Automatic Vundle install
let firstRun=0
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let firstRun=1
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-jdaddy'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'simnalamburt/vim-mundo'
Plugin 'roryokane/detectindent'

if firstRun == 1
  echo "Installing Bundles, please ignore key map error messages"
  :PluginInstall
endif

" Toggle paste mode (no auto indent) with f2
set pastetoggle=<f2>

" , as extra modifier key (Leader)
let mapleader = ","

" Leader-h to show hidden chars
nmap <leader>h :set list!<CR>

" Arrow keys to resize splits
map <Up> <C-W>+
map <Down> <C-W>-
map <Left> <C-W><
map <Right> <C-W>>

" §j §k §l §ö to navigate splits
map §j <C-W>h
map §k <C-W>j
map §l <C-W>k
map §ö <C-W>l

" Leader-s to sort selected lines e.g. to sort lines alphabetically
vnoremap <Leader>s :sort<CR> 

" Q wraps paragraph
vmap Q gq
nmap Q gqap

" Do not deselect when indenting
vnoremap < <gv
vnoremap > >gv

" Syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Don't wrap lines
set nowrap

" Hilight line 80
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=5

" Indent with 2 spaces
set softtabstop=2 expandtab
set shiftwidth=2

" Longer undo history
set undolevels=20000

" Highlight all search results
set hlsearch

" ,l redraws the screen and removes any search highlighting
nnoremap <silent> <Leader>l :nohl<CR>

" Search while typing
set incsearch

" Smart case search (case sensitive i any capital letter in pattern)
set ignorecase
set smartcase

" UTF-8
if &modifiable
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8
endif

" No beeping
set vb t_vb=

" Center cursor vertically (toggle with ,z)
set scrolloff=999
nnoremap <silent> <Leader>z :let &scrolloff=999-&scrolloff<CR>

" Hilight current line
set cursorline

" Toggle column hilight with ,c
nnoremap <Silent> <Leader>c :set cursorcolumn!<CR>

" swapfiles in ~/.vim/swap
set directory^=$HOME/.vim/swap/

" Normal backspace in insert mode
set backspace=2

" Disable paste mode when leaving Insert Mode
au InsertLeave * set nopaste

" Open new splits to the right/bottom
set splitright splitbelow

" Always show statusline
set laststatus=2

" bash-like bindings for vim's command line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" ...
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Statusline
" %F - Longer path
" %r readonly flag
" %m modified flag
" %y filetype
" %c column
" %l line
" %L number of lines
" %P percentage through buffer
" %= right side
set statusline=%F%r%m\ %y%=%{fugitive#head()}\ 0x%B\ %c\ %l/%L\ %P

" Disable double leader in EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

" Don't delete multiple cursors when trying to enter normal mode
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0

" Hide gitgutter and line numbers and toggle with f12
let g:gitgutter_enabled = 0
map <F12> :set number!<CR>:GitGutterToggle<CR>
inoremap <F12> <Esc>:set number!<CR>:GitGutterToggle<CR>i

" Better tab completion in command line
set wildmenu

" ,t for new tab
nnoremap <leader>t <Esc>:tabnew<CR>

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 1
set wildignore+=*bower_components,node_modules,webroot,tmp

" Syntastic
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_javascript_checkers = ['jscs', 'jshint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_aggregate_errors = 1

" Title
set title
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gbr :Git branch<Space>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" ,o to close all splits except focused
nnoremap <leader>o :only<CR>

" jklö instead of hjkl
noremap ö l
noremap l k
noremap k j
noremap j h

" Yank to system clipboard
set clipboard=unnamedplus

" Execute selected text with ,b
vnoremap <leader>b :.w !bash

" Don't require .jsx extension for jsx syntax
let g:jsx_ext_required = 0

" Colors
let base16colorspace=256
colorscheme base16-default-dark

" Show undo tree
nnoremap <F5> :MundoToggle<CR>

" Esc delay
set timeout
set ttimeout
set timeoutlen=1
set ttimeoutlen=1