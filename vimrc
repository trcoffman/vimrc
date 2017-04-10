" Put 'source <path to this file>' in your ~/.vimrc to use this file.

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
" Enable 256 colors.
set t_Co=256

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

" Stop highlighting
noremap <leader>n :nohl<CR>

" Paste from * register (OS Clipboard)
noremap <leader>p "*p

" Force-write
noremap <leader>w :w!<CR>

" Insert line below and exit
noremap <leader>o o

" Automatic commands
if has("autocmd")
        " Enable file type detection
        filetype on
        " Treat .json files as .js
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'

Plug 'derekwyatt/vim-scala'

Plug 'ervandew/supertab'

Plug 'christoomey/vim-tmux-navigator'

Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-abolish'

Plug 'rhysd/vim-clang-format'

Plug 'chamindra/marvim'

Plug 'leafgarland/typescript-vim'

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'altercation/vim-colors-solarized'

Plug 'rking/ag.vim'

Plug 'tpope/vim-surround'

Plug 'VoiceCode/vim-voicecode'

call plug#end()

" Plugin options.

" ctrlp.vim ignore .gitignore files
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
elseif executable('git')
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" Vimwiki: use markdown by default
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" MARVim (Macro Repository for Vim)
" This line is needed to activate this vimscript
source ~/.vim/plugged/marvim/marvim.vim

" Used solarized colorscheme
set background=dark
let g:solarized_contrast = "high"
colorscheme solarized

" Use powerline fonts for airline.
let g:airline_powerline_fonts = 1
