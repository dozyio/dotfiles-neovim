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
    " View history
    Plug 'junegunn/gv.vim'

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

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

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

    " Testing
    Plug 'janko-m/vim-test'

    " Footers
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    " Buffers
    Plug 'akinsho/nvim-bufferline.lua'

    " Undo
    Plug 'mbbill/undotree'

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
set scrolloff=8
set sidescrolloff=5

" History
set history=500

" Undo
set undofile
set undolevels=1000
set undoreload=10000
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_HelpLine = 0
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1

" Folding
"set nofoldenable
"
" Search
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
nnoremap <Leader><space> :nohlsearch<cr>
" Keep cursor centered when searching
nnoremap n nzzzv
nnoremap N Nzzzv
" Search & Replace current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Mouse
" set mousemodel=popup
"set mouse=n
set mouse=

" Cursor - block cursor in insert mode
set guicursor=

" 80 Column
set colorcolumn=80

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
hi SignColumn guibg=#15161E

" Spelling
set nospell

" Title bar
set title

" Copy & Paste
" whole file to system buffer
nnoremap <Leader>y :%y+<cr>
" visual selected to system buffer
vnoremap <silent> <Leader>c "+y<cr>
" Don't line break pastes
set textwidth=0
" Blackhole delete - doesn't add to register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Visual move
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Spacing
set listchars=
set nolist
let c_space_errors = 1

" Gutter
" Always show the signcolumn, otherwise it would shift the text each time
set signcolumn=yes

" used with some plugin apparently
set updatetime=50

" Indenting
set autoindent
set smartindent

" Navigation
" Allow navigation between buffers without saving
set hidden
" Don't jump to first character with page commands.
set nostartofline
" Move to start/end of line using crtl a/e when in :%s/ for example
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" Navigate buffers
noremap <silent><nowait> <C-Left> :bprevious<CR>
noremap <silent><nowait> <C-Right> :bnext<CR>
" Navigate windows - seems broke?
nnoremap <silent><nowait> <A-Up> :wincmd k<CR>
nnoremap <silent><nowait> <A-Down> :wincmd j<CR>
nnoremap <silent><nowait> <A-Left> :wincmd h<CR>
nnoremap <silent><nowait> <A-Right> :wincmd l<CR>
" Navigate in terminal
tnoremap <silent><nowait> <C-Left> <C-\><C-N>:bprevious<CR>
tnoremap <silent><nowait> <C-Right> <C-\><C-N>:bnext<CR>
" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
" Navigate hunks
nnoremap <silent><nowait> <C-]> <Plug>(GitGutterNextHunk)
nnoremap <silent><nowait> <C-[> <Plug>(GitGutterPrevHunk)

" close buffer / window
nnoremap <silent> <C-x> :bd<CR>

" Resize split
nnoremap <leader>, :vertical resize +5<CR>
nnoremap <leader>. :vertical resize -5<CR>

" Netrw
nnoremap <silent><nowait> <leader>n :Vexplore<CR>
" open file in new buffer
let g:netrw_browse_split=3
let g:netrw_banner=0
let g:netrw_winsize=25

" Git
" Diff
nnoremap <silent><nowait><leader>gd :Gdiffsplit!<CR>
" History
nnoremap <silent><nowait><leader>gh :GV<CR>
" History current file
nnoremap <silent><nowait><leader>gc :GV!<CR>

" Numbering
set relativenumber
set number
nnoremap <silent> <C-n> :set invrelativenumber<CR>
nnoremap <silent> <C-l> :set invnumber<CR>

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

" Vue
autocmd BufEnter *.vue :syntax sync fromstart

" Blade
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

" YAML
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab

" HTML
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

" CSS
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab

" PHP
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 expandtab
let g:php_cs_fixer_rules = "@PSR12"
nnoremap <silent><leader>b :call PhpCsFixerFixFile()<CR>

" Go
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
  autocmd BufNewFile,BufRead *.go nnoremap <Leader><space> :nohlsearch<cr>:GoCoverageClear<cr>
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

    nnoremap <silent><c-down> <Plug>(coc-diagnostic-next)
    nnoremap <silent><c-up> <Plug>(coc-diagnostic-prev)
    nnoremap <silent><nowait> <leader>e :<C-u>CocList diagnostics<cr>
    nnoremap <silent><leader>f <Plug>(coc-codeaction)

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
    nnoremap <silent> gd <Plug>(coc-definition)
    nnoremap <silent> gy <Plug>(coc-type-definition)
    nnoremap <silent> gi <Plug>(coc-implementation)
    nnoremap <silent> gr <Plug>(coc-references)
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
nnoremap <leader>t :w<CR> :let test#php#phpunit#executable = 'vendor/bin/paratest'<CR> :TestFile<CR>
nnoremap <leader>T :w<CR> :let test#php#phpunit#executable = 'vendor/bin/paratest'<CR> :TestSuite<CR>
nnoremap <leader>c :w<CR> :let test#php#phpunit#executable = 'vendor/bin/phpunit'<CR> :TestNearest<CR>
if has('nvim')
  tnoremap <C-o> <C-\><C-n>
endif

" Projectionist
nnoremap <leader>a :A<CR>

" Dispatch shortcuts
nnoremap <leader>m :w<CR> :Make<CR>

" Indent guides config - off by default
let g:indentLine_enabled = 0
autocmd BufRead,BufNewFile *.yml,*.yaml,*.py let g:indentLine_enabled = 1
let g:indentLine_char_list = ['⎸']
nnoremap <leader>i :IndentLinesToggle<CR>

" terraform config
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" vim-easy-align config
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)
nnoremap <silent><leader>= vipga=

vnoremap <silent> <C-s> :sort<CR>

" Prettier
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
" Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
vnoremap <leader>p :CocCommand prettier.formatFile<CR>
nnoremap <leader>p :CocCommand prettier.formatFile<CR>
autocmd InsertLeave *.js,*.jsx Prettier

" Reload vim config
nnoremap <silent> <leader>v :so $MYVIMRC<CR>


set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set shortmess+=c

nnoremap <silent> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><c-up> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent><c-down> <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent><leader>f <cmd>lua vim.lsp.buf.code_action()<CR>
autocmd User CompeConfirmDone :lua vim.lsp.buf.signature_help()

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

if executable('rg')
    let g:rg_derive_root='true'
endif

" Lua settings
lua require('settings')
