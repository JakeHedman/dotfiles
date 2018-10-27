" Automatic vim-plug install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'VundleVim/Vundle.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'chriskempson/base16-vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'mxw/vim-jsx'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'pangloss/vim-javascript'
  Plug 'scrooloose/nerdcommenter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-jdaddy'
  Plug 'kchmck/vim-coffee-script'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'simnalamburt/vim-mundo'
  Plug 'roryokane/detectindent'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

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
nnoremap <silent> <Leader>c :set cursorcolumn!<CR>

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

" F12 to toggle gitgutter and line numbers with
map <F12> :set number!<CR>:GitGutterSignsToggle<CR>
inoremap <F12> <Esc>:set number!<CR>:GitGutterSignsToggle<CR>i

" Show line numbers
set number

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

" jklö instead of hjkl
noremap ö l
noremap l k
noremap k j
noremap j h

" Execute selected text with ,b
vnoremap <leader>b :.w !bash

" Don't require .jsx extension for jsx syntax
let g:jsx_ext_required = 0

" Colors
let base16colorspace=256
colorscheme base16-default-dark

" Show undo tree
nnoremap <F5> :MundoToggle<CR>

" Auto reload init.vim on save
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" ,p ,y to PRIMARY yank/paste
function! ClipboardYank()
  call system('xclip -i -selection primary', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection primary')
endfunction

vnoremap <silent> <leader>y y:call ClipboardYank()<cr>
onoremap <silent> <leader>y y:call ClipboardYank()<cr>
nnoremap <silent> <leader>p :call ClipboardPaste()<cr>p

" ctrl-p to search files with fzf
nnoremap <c-p> :Files<cr>

" ,r to search file contents with rg + fzf
nnoremap <leader>r :Rg<cr>
