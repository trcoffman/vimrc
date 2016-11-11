" Make Vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
        set undodir=~/.vim/undo
endif

" Indentation.
" TODO: change indentation based on the file type.
"       OR consider matching based on the current file.
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent

" Smart split resizing.
set winheight=30
set winminheight=5
set winwidth=104
set winminwidth=25

set viminfo+=! " make sure vim history works
" Enable syntax highlighting
syntax on
" Highlight current line
" set cursorline
" Enable line numbers
set number
set relativenumber

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
" Highlight searches
set hlsearch
" Ignore case of searches
"set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Respect modeline in files
set modeline
set modelines=4
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
        " Enable file type detection
        filetype on
        " Treat .json files as .js
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'

Plug 'derekwyatt/vim-scala'

Plug 'ervandew/supertab'

Plug 'christoomey/vim-tmux-navigator'

" Thinking of removing this plugin soon if I don't use it much.
Plug 'wkentaro/conque.vim'

call plug#end()
