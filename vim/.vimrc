set nocompatible
set hlsearch
set backspace=indent,eol,start
set encoding=utf-8
set mouse=a
set splitright
set splitbelow
"set list
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set title
set ignorecase
set smartcase
set incsearch
set number
"set relativenumber
set mouse=a
set ttymouse=xterm2
set background=dark
set clipboard=unnamed
set colorcolumn=0

" Python formatting
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd BufRead *.py setlocal colorcolumn=0

highlight BadWhitespace ctermbg=blue guibg=blue

" install vim-plug if it isnt there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter *   PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'edkolev/tmuxline.vim'
  Plug 'timakro/vim-searchant'

  Plug 'tpope/vim-eunuch'
  Plug 'tweekmonster/django-plus.vim'
  Plug 'flazz/vim-colorschemes'

  Plug 'sheerun/vim-polyglot'

  Plug 'w0rp/ale'
    let ale_python_pylint_options='--max-line-length=120 --load-plugins pylint_django'
    let ale_python_flake8_options='--max-line-length=120 --load-plugins pylint_django'
    let g:ale_lint_on_enter=0


  Plug 'vim-python/python-syntax'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'Raimondi/delimitMate'
  Plug 'scrooloose/nerdtree'
    let g:NERDTreeMouseMode=3
    let NERDTreeShowHidden=1
    let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
    map <silent> <C-\> :NERDTreeToggle<CR>

  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_working_path_mode = 'r'

  Plug 'tpope/vim-fugitive'
  Plug 'idanarye/vim-merginal'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts = 1
    let g:airline_theme='hybrid'

  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

  Plug 'honza/vim-snippets'
  Plug 'ryanoasis/vim-devicons'
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1

  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  Plug 'tpope/vim-surround'
call plug#end()


" General Key mappings !
" for ctrl+s save
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
" move among buffers with CTRL
map <C-n> :bnext<CR>
map <C-b> :bprev<CR>

colorscheme hybrid
