" Syntax
syntax on
set synmaxcol=1000
autocmd BufEnter * :syntax sync fromstart

" Plugins
call plug#begin('~/.vim/plugged')
    " Language specfic
    " PHP
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
    Plug 'noahfrederick/vim-composer', { 'for': 'php' }
    Plug 'noahfrederick/vim-laravel', { 'for': 'php' }
    " Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Nginx
    Plug 'chr4/nginx.vim', { 'for': 'nginx' }
    " Terraform
    Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app && yarn install'  }

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'rhysd/committia.vim'
    Plug 'tpope/vim-fugitive'

    " LSP & Code completion
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    " vim-vsnip required for nvim-cmp & adds parentheses on completion
    " other snippet plugins also work with nvim-cmp
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'ray-x/lsp_signature.nvim'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Different color brackets
    Plug 'p00f/nvim-ts-rainbow'

    " Utils
    Plug 'Yggdroot/indentLine'
    Plug 'ctrlpvim/ctrlp.vim'
    " still need vim-snippets?
    Plug 'honza/vim-snippets'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-dispatch'
    " Session management Save sessions with :Obsession & restore with vi -S
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-surround'
    Plug 'folke/which-key.nvim'
    Plug 'tpope/vim-projectionist'
    " Highlight whitespaces
    Plug 'dozyio/vim-better-whitespace'
    " floating terminal with F12
    Plug 'voldikss/vim-floaterm'
    Plug 'phaazon/hop.nvim'

    " Testing
    Plug 'janko-m/vim-test'

    " Footers
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    " Buffers
    Plug 'akinsho/nvim-bufferline.lua'

    " Colour Scheme & Icons
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" project specific config files
set exrc
set secure

" " Tabs
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
"set nofoldenable

" Search
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
nmap <Leader><space> :nohlsearch<cr>

" Mouse
" set mousemodel=popup
"set mouse=n
set mouse=

" Misc
let mapleader='\'
set fileformats=unix
set encoding=utf-8
set modelines=0 " stop files changing vim setup
"set linespace=0 " fix some font spacing
set winminheight=0
set shada=!,'100,<100,:100,s10,%,h "viminfo
set noerrorbells

" Theme
set termguicolors
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_transparent = 1
colorscheme tokyonight

" Theme overrides
hi Normal guifg=#fa9500
hi SignColumn guibg=#3b4261
" @TODO fix bufferline colours
hi BufferLineFill guifg=White guibg=#16161e
hi BufferLineBackground guifg=DarkGrey guibg=#16161e
hi BufferLineBufferSelected guifg=LightGrey guibg=DarkGreen

" Spelling
set nospell

" Search & Replace current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Title bar
set title

" Copy & Paste
" whole file to system buffer
nmap <Leader>y :%y+<cr>
" visual selected to system buffer
vmap <silent> <Leader>c "+y<cr>
set textwidth=0

" Spacing
set listchars=
set nolist

let c_space_errors = 1

" Gutter
" Always show the signcolumn, otherwise it would shift the text each time
set signcolumn=yes
set updatetime=100

" Indenting
set autoindent
set smartindent

" Navigation
" Allow navigation between buffers without saving
set hidden
" Don't jump to first character with page commands.
set nostartofline
" move to start end of line using crtl a/e when in :%s/ for example
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" navigate buffers
map <silent><nowait> <C-Left> :bprevious<CR>
map <silent><nowait> <C-Right> :bnext<CR>
" navigate windows
nmap <silent><nowait> <A-Up> :wincmd k<CR>
nmap <silent><nowait> <A-Down> :wincmd j<CR>
nmap <silent><nowait> <A-Left> :wincmd h<CR>
nmap <silent><nowait> <A-Right> :wincmd l<CR>
" navigate in terminal
tnoremap <silent><nowait> <C-Left> <C-\><C-N>:bprevious<CR>
tnoremap <silent><nowait> <C-Right> <C-\><C-N>:bnext<CR>
" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
" navigate hunks
nmap <silent><nowait> <C-]> <Plug>(GitGutterNextHunk)
nmap <silent><nowait> <C-[> <Plug>(GitGutterPrevHunk)

" close buffer / window
nmap <silent> <C-x> :bd<CR>

" Netrw
nmap <silent><nowait> <leader>n :Vexplore<CR>

" Git diff
nmap <silent><nowait><leader>g :Gdiffsplit!<CR>

" Numbering
nmap <silent> <C-n> :set invrelativenumber<CR>
nmap <silent> <C-l> :set invnumber<CR>

" Terminal
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_winblend = 0
let g:floaterm_title = ''
let g:floaterm_autoclose = 1
let g:floaterm_shell = 'bash --login'
hi FloatermBorder guifg=orange

" Text
set nojoinspaces " Better J joins
autocmd BufWinEnter * set formatoptions+=j " better joins with comments

" Filetypes
autocmd BufRead,BufNewFile *.js,*.ts,*.vue set tabstop=2
autocmd BufRead,BufNewFile *.js,*.ts,*.vue set shiftwidth=2
autocmd BufRead,BufNewFile *.js,*.vue set noexpandtab
autocmd BufRead,BufNewFile *.ts set expandtab

autocmd BufRead,BufNewFile *.yml,*.yaml,*.hcl set tabstop=2
autocmd BufRead,BufNewFile *.yml,*.yaml,*.hcl set shiftwidth=2
autocmd BufRead,BufNewFile *.yml,*.yaml,*.hcl set expandtab

autocmd BufRead,BufNewFile *.py set tabstop=2
autocmd BufRead,BufNewFile *.py set shiftwidth=2
autocmd BufRead,BufNewFile *.py set noexpandtab

" vue
autocmd BufEnter *.vue :syntax sync fromstart

" blade
augroup blade_ft
  autocmd!
  autocmd BufNewFile,BufRead *.blade.php set syntax=php
  autocmd BufNewFile,BufRead *.blade.php set filetype=html
augroup END

" Go / Hugo Templates
function DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        set filetype=gohtml
        set syntax=gohtmltmpl
    endif
endfunction

augroup filetypedetect
    au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
augroup END

" yaml
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab

" html
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

" css
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab

" php
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 expandtab
let g:php_cs_fixer_rules = "@PSR12"
nnoremap <silent><leader>b :call PhpCsFixerFixFile()<CR>

" go
augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go let g:go_highlight_extra_types = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_structs = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_functions = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_function_calls = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_function_parameters = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_types = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_fields = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_operators = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_build_constraints = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_generate_tags = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_variable_declarations = 1
  autocmd BufNewFile,BufRead *.go let g:go_highlight_variable_assignments = 1
  autocmd BufNewFile,BufRead *.go nmap <Leader><space> :nohlsearch<cr>:GoCoverageClear<cr>
  autocmd BufNewFile,BufRead *.go let g:go_fmt_command = "goimports"
augroup END

" Useful Functions
" remember cursor postion when reopen file
augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END


" Coc config
" Deprecated
if exists('g:plugs["coc.nvim"]')
    let g:coc_global_extensions=[ 'coc-html', 'coc-prettier', 'coc-eslint', 'coc-eslint8', 'coc-json', 'coc-css', 'coc-vetur', 'coc-tsserver', 'coc-lists', 'coc-highlight', 'coc-go', 'coc-python', 'coc-lua' ]

    inoremap <silent><expr> <TAB>
          \ pumvisible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    nmap <silent><c-down> <Plug>(coc-diagnostic-next)
    nmap <silent><c-up> <Plug>(coc-diagnostic-prev)
    nmap <silent><nowait> <leader>e :<C-u>CocList diagnostics<cr>
    nmap <silent><leader>f <Plug>(coc-codeaction)

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
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
endif


" Close quickfix list on enter
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>:lclose<CR>

" Reduce height of quickfix to minimum of 3 lines, max 10 lines
autocmd FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" CtrlP config
if exists('g:plugs["ctrlp.vim"]')
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.git/*,*/vendor/*,*/node_modules/*,*/phpunit/*
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|tests/coverage)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }
    let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'
    let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
    if executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMRU'
endif

" Testing
let test#strategy = "neovim"
let test#neovim#term_position = "vert botright"
let test#php#phpunit#executable = "vendor/bin/paratest"
nmap <leader>t :w<CR> :let test#php#phpunit#executable = 'vendor/bin/paratest'<CR> :TestFile<CR>
nmap <leader>T :w<CR> :let test#php#phpunit#executable = 'vendor/bin/paratest'<CR> :TestSuite<CR>
nmap <leader>c :w<CR> :let test#php#phpunit#executable = 'vendor/bin/phpunit'<CR> :TestNearest<CR>
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Projectionist
nmap <leader>a :A<CR>

" Dispatch shortcuts
nmap <leader>m :w<CR> :Make<CR>

" Indent guides config - off by default
let g:indentLine_enabled = 0
autocmd BufRead,BufNewFile *.yml,*.yaml,*.py let g:indentLine_enabled = 1
let g:indentLine_char_list = ['⎸']
nmap <leader>i :IndentLinesToggle<CR>

" terraform config
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" vim-easy-align config
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <silent><leader>= vipga=

vmap <silent> <C-s> :sort<CR>

" Prettier
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
" Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
vmap <leader>p :CocCommand prettier.formatFile<CR>
nmap <leader>p :CocCommand prettier.formatFile<CR>
autocmd InsertLeave *.js,*.jsx Prettier

" Reload vim config
nmap <silent> <leader>v :so $MYVIMRC<CR>


set completeopt=menu,menuone,noinsert
set shortmess+=c

nnoremap <silent> <cmd>lua vim.lsp.buf.hover()<CR>
nmap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent><c-up> <cmd>lua vim.diagnostic.goto_prev()<CR>
nmap <silent><c-down> <cmd>lua vim.diagnostic.goto_next()<CR>
nmap <silent><leader>f <cmd>lua vim.lsp.buf.code_action()<CR>
autocmd User CompeConfirmDone :lua vim.lsp.buf.signature_help()

" Lua settings
lua require('settings')
