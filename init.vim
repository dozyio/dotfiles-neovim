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

" autocmd BufRead,BufNewFile *.js,*.yml,*.yaml,*.py set tabstop=2
" autocmd BufRead,BufNewFile *.js,*.yml,*.yaml,*.py set shiftwidth=2

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
set mouse=i

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

" Copy
" whole file to system buffer
nmap <Leader>y :%y+<cr>
" visual selected to system buffer
vmap <Leader>c "+y<cr>

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
set smartindent

" Navigation
set nostartofline " Don't jump to first character with page commands.
" move to start end of line using crtl a/e when in :%s/ for example
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Buffer navigation
map <silent> <C-Left> :bprevious<CR>
map <silent> <C-Right> :bnext<CR>

" Numbering
nmap <silent> <C-N> :set invrelativenumber<CR>

" Text
set nojoinspaces " Better J joins
au BufWinEnter * set formatoptions-=c formatoptions-=r formatoptions-=o " turn off auto comment markers
au BufWinEnter * set formatoptions+=j " better joins with comments

" Filetypes
" vue
autocmd BufEnter *.vue :syntax sync fromstart
" autocmd BufEnter *.vue :set omnifunc=xmlcomplete#CompleteTags

" Shortcuts


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
    Plug 'posva/vim-vue'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'chr4/nginx.vim'
    Plug 'tpope/vim-dispatch'
    Plug 'Yggdroot/indentLine'
call plug#end()

" Coc config
let g:coc_global_extensions=[ 'coc-html', 'coc-prettier', 'coc-eslint', 'coc-json', 'coc-css', 'coc-phpls', 'coc-vetur', 'coc-tsserver', 'coc-snippets', 'coc-lists', 'coc-highlight' ]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

nmap <silent><c-down> <Plug>(coc-diagnostic-next)
nmap <silent><c-up> <Plug>(coc-diagnostic-prev)
nnoremap  :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_node_path = '/usr/local/bin/node'

" airline config
let g:airline_theme='jellybeans'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2

" CtrlP config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.git/*,*/vendor/*,*/node_modules/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Dispatch shortcuts
nmap <leader>m :w<CR> :Make<CR>

" indent guides off by default
let g:indentLine_enabled = 0
autocmd BufRead,BufNewFile *.yml,*.yaml,*.py let g:indentLine_enabled = 1
let g:indentLine_char_list = ['⎸']
nmap <leader>i :IndentLinesToggle<CR>

