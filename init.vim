" Syntax
syntax on
set synmaxcol=1000
autocmd BufEnter * :syntax sync fromstart

" Tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab

" Deleting
set backspace=indent,eol,start  " easy delete

" Scrolling
set scrolloff=5
set sidescrolloff=5

" History
set history=500

" Undo
set undofile
set undolevels=1000
set undoreload=10000

" Folding
" set foldenable
" set foldmethod=indent
" set foldlevel=100
set nofoldenable

" Search
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>s :%s//g<Left><Left>

" Mouse
" set mousemodel=popup
set mouse=

" Misc
let mapleader='\'
set fileformats=unix
set encoding=utf-8
set modelines=0 " stop files changing vim setup
set linespace=0 " fix some font spacing
set winminheight=0
set shada=!,'100,<100,:100,s10,%,h "viminfo
set noerrorbells

" Theme
colorscheme pablo
highlight CocFloating guibg=none guifg=none
highlight Pmenu ctermbg=gray guibg=gray

" Spelling
"autocmd BufEnter *.txt :setlocal spell spelllang=en_gb
"autocmd BufEnter *.md :setlocal spell spelllang=en_gb
set nospell

" Status bar
set showmode
set laststatus=1
" set display=
set display+=lastline

" Paste
set textwidth=0

" Spacing
" Highlight problematic whitespace
" set listchars=tab:,.,trail:.,extends:#,nbsp:.
set listchars=
set list
highlight ExtraWhitespace ctermbg=DarkGray
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
let c_space_errors = 1

" Indenting
set autoindent

" Navigation
set nostartofline " Don't jump to first character with page commands.
" move to start end of line using crtl a/e when in :%s/ for example
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Text
set nojoinspaces " Better J joins
au BufWinEnter * set formatoptions-=c formatoptions-=r formatoptions-=o " turn off auto comment markers
au BufWinEnter * set formatoptions+=j " better joins with comments

" Filetypes
" vue
autocmd BufEnter *.vue :syntax sync fromstart
" autocmd BufEnter *.vue :set omnifunc=xmlcomplete#CompleteTags

" blade
augroup blade_ft
  au!
  autocmd BufNewFile,BufRead *.blade.php set syntax=php
  autocmd BufNewFile,BufRead *.blade.php set filetype=html
augroup END

" yaml
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab

" Useful Functions
" remember cursor postion when reopen file
augroup vimrcEx
    au!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'pangloss/vim-javascript' "fix js indenting
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Coc config
let g:coc_global_extensions=[ 'coc-html', 'coc-prettier', 'coc-eslint', 'coc-json', 'coc-css', 'coc-phpls', 'coc-vetur', 'coc-tsserver', 'coc-snippets', 'coc-lists', 'coc-highlight' ]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" airline config
let g:airline_theme='jellybeans'
let g:airline_section_b = '%{strftime("%I:%M %p")}'
let g:airline#extensions#branch#enabled = 1
