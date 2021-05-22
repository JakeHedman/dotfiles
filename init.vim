" Automatic vim-plug install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir -p ~/.vim/autoload
  silent !ln -s ~/.local/share/nvim/site/autoload/plug.vim ~/.vim/autoload/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'joshdick/onedark.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-jdaddy'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'simnalamburt/vim-mundo'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'itchyny/lightline.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'delphinus/vim-firestore'
  Plug 'myint/indent-finder'
  Plug 'rust-lang/rust.vim'
  Plug 'chrisbra/Colorizer'
  Plug 'kamykn/spelunker.vim'
  Plug 'neoclide/vim-jsx-improve'
  Plug 'kamykn/popup-menu.nvim'
call plug#end()


" Colors
let g:onedark_termcolors=256

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
syntax on
colorscheme onedark

" Blues
" light blues
hi xmlTagName guifg=#59ACE5
hi xmlTag guifg=#59ACE5

" dark blues
hi xmlEndTag guifg=#2974a1
hi jsxCloseString guifg=#2974a1
hi htmlTag guifg=#2974a1
hi htmlEndTag guifg=#2974a1
hi htmlTagName guifg=#59ACE5
hi jsxAttrib guifg=#1BD1C1

" cyan
hi Constant guifg=#56B6C2
hi typescriptBraces guifg=#56B6C2
hi typescriptEndColons guifg=#56B6C2
hi typescriptRef guifg=#56B6C2
hi typescriptPropietaryMethods guifg=#56B6C2
hi typescriptEventListenerMethods guifg=#56B6C2
hi typescriptFunction guifg=#56B6C2
hi typescriptVars guifg=#56B6C2
hi typescriptParen guifg=#56B6C2
hi typescriptDotNotation guifg=#56B6C2
hi typescriptBracket guifg=#56B6C2
hi typescriptBlock guifg=#56B6C2
hi typescriptJFunctions guifg=#56B6C2
hi typescriptSFunctions guifg=#56B6C2
hi typescriptInterpolationDelimiter guifg=#56B6C2
hi typescriptIdentifier guifg=#907161 cterm=italic

" javascript
hi jsParens guifg=#56B6C2
hi jsObjectBraces guifg=#C678DD
hi jsFuncBraces guifg=#56B6C2
hi jsObjectFuncName guifg=#D19A66
hi jsObjectKey guifg=#56B6C2

" Auto reload vimrc on save
autocmd! bufwritepost .vimrc,init.vim source %

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

" Center cursor vertically
set scrolloff=999

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

" Show undo tree
nnoremap <F5> :MundoToggle<CR>

" Auto reload init.vim on save
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" Use PRIMARY clipboard
set clipboard=unnamedplus

" Set $SHELL since fzf preview doesn't like xonsh
let $SHELL='/bin/sh'

" leave terminal mode with ,Esc
tnoremap <Leader><Esc> <C-\><C-n>

" vim-coc
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[e` and `]e` to navigate errors
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)

" Use `[w` and `]w` to navigate all diagnostics
nmap <silent> [w <Plug>(coc-diagnostic-prev)
nmap <silent> ]w <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gm <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
\ 'colorscheme': 'onedark',
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ]
\   ],
\   'right': [
\     ['lineinfo'],
\     ['percent'],
\     ['fileformat'],
\     ['fileencoding'],
\     ['filetype'],
\     ['charvaluehex']
\   ]
\ },
\ 'component': {
\   'charvaluehex': '0x%B'
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status',
\   'gitbranch': 'fugitive#head'
\ },
\}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Search files
nnoremap <silent> <space>f  :<C-u>CocList files<CR>
" Grep
nnoremap <silent> <space>g  :<C-u>CocList -I grep<CR>
" Buffers
nnoremap <silent> <space>b  :<C-u>CocList buffers<CR>

set noshowmode

" ,ef eslint fix
nmap <leader>ef :CocCommand eslint.executeAutofix<CR>

" ,oi organize imports
nmap <leader>oi :CocCommand tsserver.organizeImports<CR>

" Close all floaters
nmap <Esc> :call coc#float#close_all() <CR>

" Don't start in replace mode
" https://superuser.com/questions/1284561/why-is-vim-starting-in-replace-mode
set t_u7=

" Colorizer plugin
:let g:colorizer_auto_filetype='css,html,typescript,javascript,typescriptreact,javascriptreact'

" Refactor
nnoremap <silent> <space>r :CocAction refactor<CR>
vnoremap <silent> <space>r :CocAction refactor<CR>

" Function object
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" Class/struct/interface object
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" coc extensions
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-lists',
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-yaml',
  \ 'coc-html',
  \ 'coc-eslint',
  \ 'coc-rls',
  \ 'coc-python',
  \ 'coc-css'
\ ]

" Spellcheck
set spelllang=en,sv

augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md,*.txt,*.ts,*.tsx call spelunker#check()
augroup END
