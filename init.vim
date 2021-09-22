" Syntax
syntax on
set synmaxcol=1000
autocmd BufEnter * :syntax sync fromstart

" Plugins
call plug#begin('~/.vim/plugged')
    " Language specfic
    Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
    Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    Plug 'noahfrederick/vim-composer', { 'for': 'php' }
    Plug 'noahfrederick/vim-laravel', { 'for': 'php' }
    " Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'vue', 'typescript'] }
    Plug 'chr4/nginx.vim', { 'for': 'nginx' }
    " Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

    " probably remove
    " Plug 'jvirtanen/vim-hcl', { 'for': ['terraform', 'hcl'] }
    " Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
    " Plug 'pangloss/vim-javascript', { 'for': 'javascript' } "fix js indenting
    " Plug 'posva/vim-vue', { 'for': 'vue' }

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'rhysd/committia.vim'
    Plug 'tpope/vim-fugitive'

    " LSP & Code completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'hrsh7th/nvim-compe'
    " vim-vsnip adds parentheses on completion
    Plug 'hrsh7th/vim-vsnip'
    Plug 'nvim-lua/lsp-status.nvim'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'p00f/nvim-ts-rainbow'

    " Utils
    Plug 'Yggdroot/indentLine'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'honza/vim-snippets'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-dadbod'
    " Plug 'kristijanhusak/vim-dadbod-ui'
    " Plug 'kristijanhusak/vim-dadbod-completion'
    Plug 'folke/which-key.nvim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " Testing
    Plug 'janko-m/vim-test'

    " Buffers & Footers
    " Plug 'hoob3rt/lualine.nvim'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
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
set nofoldenable

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
set linespace=0 " fix some font spacing
set winminheight=0
set shada=!,'100,<100,:100,s10,%,h "viminfo
set noerrorbells

" Theme
set termguicolors
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_transparent = 1
colorscheme tokyonight
" colorscheme pablo

" Theme overrides
highlight Normal guifg=#fa9500
highlight SignColumn guibg=#3b4261

" Spelling
set nospell

" Title bar
set title

" Copy & Paste
" whole file to system buffer
nmap <Leader>y :%y+<cr>
" visual selected to system buffer
vmap <silent> <Leader>c "+y<cr>
set textwidth=0

" Spacing
" Highlight problematic whitespace
" set listchars=tab:,.,trail:.,extends:#,nbsp:.
set listchars=
set nolist
highlight ExtraWhitespace ctermbg=DarkGray
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Disabled - breaks autocompletion with TSServer
" let ignoretabhighlighting = ["go","txt","text","make","typescript","vue","javascript"]
" augroup notabhighlight
"     autocmd!
"     highlight Tabs ctermbg=DarkGray
"     match Tabs /\t/
"     autocmd BufWinEnter * if index(ignoretabhighlighting, &ft) < 0 | match Tabs /\t/
"     autocmd InsertEnter * if index(ignoretabhighlighting, &ft) < 0 | match Tabs /\t/
"     autocmd InsertLeave * if index(ignoretabhighlighting, &ft) < 0 | match Tabs /\t/
"     autocmd BufWinLeave * if index(ignoretabhighlighting, &ft) < 0 | call clearmatches()
" augroup END
" 
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
nmap <silent> <C-X> :bd<CR>
nmap <silent><nowait> <leader>n :Vexplore<CR>

" Git diff
nmap <silent><nowait><leader>g :Gdiffsplit!<CR>

" Numbering
nmap <silent> <C-N> :set invrelativenumber<CR>
nmap <silent> <C-L> :set invnumber<CR>

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

" yaml
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab

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
if exists('g:plugs["coc.nvim"]')
    let g:coc_global_extensions=[ 'coc-html', 'coc-prettier', 'coc-eslint', 'coc-json', 'coc-css', 'coc-vetur', 'coc-tsserver', 'coc-lists', 'coc-highlight', 'coc-go', 'coc-python', 'coc-tailwindcss', 'coc-lua' ]

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
endif

" Testing
let test#strategy = "neovim"
let test#neovim#term_position = "vert botright"
nmap <leader>t :w<CR> :TestFile<CR>
nmap <leader>T :w<CR> :TestSuite<CR>
nmap <leader>c :w<CR> :TestNearest<CR>
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

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
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
" autocmd InsertLeave *.js PrettierAsync

" let g:neoformat_php_psr12 = {
"    \ 'exe': 'phpcbf',
"    \ 'args': '--standard=psr12',
"    \ 'stdin': 1,
"    \ 'valid_exit_codes': [0,1]
"    \ }
"let g:neoformat_enabled_php = ['psr12']

nmap <silent> <leader>v :so $MYVIMRC<CR>

" Buffers
lua << EOF
require("bufferline").setup{
    options = {
        show_close_icon = false,
        separator_style = "thin",
        max_name_length = 30
    }
}
EOF

" Lualine
if exists('g:plugs["lualine.nvim"]')
lua << EOF
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'tokyonight',
            component_separators = {'', ''},
            section_separators = {'', ''},
            disabled_filetypes = {}
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename' },
        lualine_x = {'g:coc_status', {'diagnostics', sources = {"nvim_lsp"}}, 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    }
EOF
endif

" galaxyline
" https://github.com/glepnir/nvim/blob/master/lua/modules/ui/eviline.lua
if exists('g:plugs["galaxyline.nvim"]')
lua << EOF
    local gl = require('galaxyline')
    local colors = require('galaxyline.theme').default
    local condition = require('galaxyline.condition')

    local function get_coc_lsp()
        local f, status = pcall(vim.api.nvim_get_var, 'coc_status')
        if not f or status == '' then
            return nil
        else
            return status
        end
    end

    local gls = gl.section
    gl.short_line_list = {'NvimTree','vista','dbui','packer'}

    gls.left[1] = {
      RainbowRed = {
        provider = function() return '▊ ' end,
        highlight = {colors.blue,colors.bg}
      },
    }
    gls.left[2] = {
      ViMode = {
        provider = function()
          -- auto change color according the vim mode
          local mode_color = {
              n = colors.red,
              i = colors.green,
              v=colors.blue,
              [''] = colors.blue,
              V=colors.blue,
              c = colors.magenta,
              no = colors.red,
              s = colors.orange,
              S=colors.orange,
              [''] = colors.orange,
              ic = colors.yellow,
              R = colors.violet,
              Rv = colors.violet,
              cv = colors.red,
              [''] = colors.violet,
              ce=colors.red,
              r = colors.cyan,
              rm = colors.cyan,
              ['r?'] = colors.cyan,
              ['!']  = colors.red,
              t = colors.red
          }
          vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()] ..' guibg='..colors.bg)
          return '  '
        end,
      },
    }
    gls.left[3] = {
      FileSize = {
        provider = 'FileSize',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg}
      }
    }
    gls.left[4] ={
      FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
      },
    }

    gls.left[5] = {
      FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg,'bold'}
      }
    }

    gls.left[6] = {
      LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg},
      },
    }

    gls.left[7] = {
      PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg,'bold'},
      }
    }

    gls.left[8] = {
      DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red,colors.bg}
      }
    }
    gls.left[9] = {
      DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow,colors.bg},
      }
    }

    gls.left[10] = {
      DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.cyan,colors.bg},
      }
    }

    gls.left[11] = {
      DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue,colors.bg},
      }
    }

    gls.mid[1] = {
      ShowLspClient = {
        provider = 'GetLspClient',
        condition = function ()
          local tbl = {['dashboard'] = true,['']=true}
          if tbl[vim.bo.filetype] then
            return false
          end
          return true
        end,
        icon = ' LSP:',
        highlight = {colors.yellow,colors.bg,'bold'}
      }
    }

    gls.mid[2] = {
        CocStatus = {
            provider = function() return vim.g.coc_status end,
            -- condition = vim.fn.exists('g:coc_status') == 1,
            highlight= { colors.yellow, colors.bg, 'bold' }
        }
    }

    gls.right[1] = {
      FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.green,colors.bg,'bold'}
      }
    }

    gls.right[2] = {
      FileFormat = {
        provider = 'FileFormat',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.green,colors.bg,'bold'}
      }
    }

    gls.right[3] = {
      GitIcon = {
        provider = function() return '  ' end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.violet,colors.bg,'bold'},
      }
    }

    gls.right[4] = {
      GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.violet,colors.bg,'bold'},
      }
    }

    gls.right[5] = {
      DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green,colors.bg},
      }
    }
    gls.right[6] = {
      DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.orange,colors.bg},
      }
    }
    gls.right[7] = {
      DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red,colors.bg},
      }
    }

    gls.right[8] = {
        Obession = {
            provider = function () return vim.fn.ObsessionStatus() end
        }
    }

    gls.right[9] = {
      RainbowBlue = {
        provider = function() return ' ▊' end,
        highlight = {colors.blue,colors.bg}
      },
    }

    gls.short_line_left[1] = {
      BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.blue,colors.bg,'bold'}
      }
    }

    gls.short_line_left[2] = {
      SFileName = {
        provider =  'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg,'bold'}
      }
    }

    gls.short_line_right[1] = {
      BufferIcon = {
        provider= 'BufferIcon',
        highlight = {colors.fg,colors.bg}
      }
    }
EOF
endif


if exists('g:plugs["nvim-lspconfig"]')
lua << EOF
    vim.lsp.set_log_level 'trace'
    local nvim_lsp = require 'lspconfig'
    local on_attach = function(_, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        local opts = { noremap=true, silent=true }
        -- Mappings.
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

    end

    require'compe'.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = true;

      source = {
        path = true;
        nvim_lsp = true;
        nvim_lua = true;
        treesitter = true;
        buffer = true;
        vim_dadbod_completion = true;
      };
    }

    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
        else
            return false
        end
    end

    -- Use (s-)tab to:
    --- move to prev/next item in completion menuone
    --- jump to prev/next snippet's placeholder
    _G.tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
      elseif check_back_space() then
        return t "<Tab>"
      else
        return vim.fn['compe#complete']()
      end
    end
    _G.s_tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
      else
        return t "<S-Tab>"
      end
    end

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

    --This line is important for auto-import
    vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
    vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })

    -- Add parentheses on completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    }

    -- Fix for TSServer not returning signatures. Auto-append () and let signature_help show args
    local Helper = require "compe.helper"
    Helper.convert_lsp_orig = Helper.convert_lsp
    Helper.convert_lsp = function(args)
      local response = args.response or {}
      local items = response.items or response
      for _, item in ipairs(items) do
        -- 2: method
        -- 3: function
        -- 4: constructor
        if item.insertText == nil and (item.kind == 2 or item.kind == 3 or item.kind == 4) then
          item.insertText = item.label .. "(${1})"
          item.insertTextFormat = 2
        end
      end
      return Helper.convert_lsp_orig(args)
    end

    -- local servers = { "intelephense", "tsserver", "vimls" }
    local servers = { "intelephense", "tsserver" }
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        }
      }
    end

    -- nvim_lsp.vuels.setup {}

    nvim_lsp.yamlls.setup {}
    --[[
    nvim_lsp.diagnosticls.setup {
      on_attach = on_attach,
      filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
      init_options = {
        linters = {
          eslint = {
            command = 'eslint_d',
            rootPatterns = { '.git' },
            debounce = 100,
            args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
            sourceName = 'eslint_d',
            parseJson = {
              errorsRoot = '[0].messages',
              line = 'line',
              column = 'column',
              endLine = 'endLine',
              endColumn = 'endColumn',
              message = '[eslint] ${message} [${ruleId}]',
              security = 'severity'
            },
            securities = {
              [2] = 'error',
              [1] = 'warning'
            }
          },
        },
        filetypes = {
          javascript = 'eslint',
          javascriptreact = 'eslint',
          typescript = 'eslint',
          typescriptreact = 'eslint',
        },
        formatters = {
          eslint_d = {
            command = 'eslint_d',
            args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
            rootPatterns = { '.git' },
          },
          prettier = {
            command = 'prettier',
            args = { '--stdin-filepath', '%filename' }
          }
        },
        formatFiletypes = {
          css = 'prettier',
          javascript = 'eslint_d',
          javascriptreact = 'eslint_d',
          json = 'prettier',
          scss = 'prettier',
          less = 'prettier',
          typescript = 'eslint_d',
          typescriptreact = 'eslint_d',
          json = 'prettier',
          markdown = 'prettier',
        }
      }
    }
    ]]

    -- setup gutter icons
    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
    for type, icon in pairs(signs) do
        local hl = "LspDiagnosticsSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- LSP icons
    local M = {}
    M.icons = {
        Class = " ",
        Color = " ",
        Constant = " ",
        Constructor = " ",
        Enum = "了 ",
        EnumMember = " ",
        Field = " ",
        File = " ",
        Folder = " ",
        Function = " ",
        Interface = "ﰮ ",
        Keyword = " ",
        Method = "ƒ ",
        Module = " ",
        Property = " ",
        Snippet = "﬌ ",
        Struct = " ",
        Text = " ",
        Unit = " ",
        Value = " ",
        Variable = " ",
        }

    local kinds = vim.lsp.protocol.CompletionItemKind
    for i, kind in ipairs(kinds) do
        kinds[i] = M.icons[kind] or kind
    end
EOF
    set completeopt=menuone,noinsert
    set shortmess+=c
    nnoremap <silent> <cmd>lua vim.lsp.buf.hover()<CR>
    nmap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
    nmap <silent><c-up> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
    nmap <silent><c-down> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
    nmap <silent><leader>f <cmd>lua vim.lsp.buf.code_action()<CR>
    autocmd User CompeConfirmDone :lua vim.lsp.buf.signature_help()
endif

if exists('g:plugs["nvim-treesitter"]')
lua <<EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",
        highlight = {
            enable = true,
            -- additional_vim_regex_highlighting = true
        },
        indent = {
            enable = false,
        },
        rainbow = {
            enable = true,
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
            colors = {
                "#bf616a",
                "#d08770",
                "#ebcb8b",
                "#a3be8c",
                "#88c0d0",
                "#5e81ac",
                "#b48ead",
            }
        }
    }
EOF
endif

if exists('g:plugs["vim-dadbod-ui"]')
    nmap <leader>d <cmd>DBUI<CR>
    let g:dbs = {
    \  'local': 'mysql://root@127.0.0.1/default'
    \ }
    let g:db_ui_auto_execute_table_helpers = 1
    let g:db_ui_use_nerd_fonts = 1
endif

if exists('g:plugs["which-key.nvim"]')
lua << EOF
    local wk = require("which-key")
    -- normal mode leader mappings
    wk.register({
        ["<leader>="] = { name = "EasyAlign" },
        ["<leader><space>"] = { name="Unhighlight search" },
        ["<leader>f"] = { name="Fix - i.e. Code action" },
        ["<leader>i"] = { name="Indent lines" },
        ["<leader>m"] = { name="Write and Make" },
        ["<leader>y"] = { name="Copy whole file to OS copy buffer" },
        ["<leader>d"] = { name="DB UI" },
        ["<leader>h"] = { name="Git hunk" },
        ["<leader>g"] = { name="Git diff" },
        ["<C-]>"] = { name="Next hunk" },
        ["<C-[>"] = { name="Previous hunk" },
        ["<C-Right>"] = { name="Next buffer" },
        ["<C-Left>"] = { name="Previous buffer" },
        ["<C-Down>"] = { name="Next error" },
        ["<C-Up>"] = { name="Previous error" },
        ["<C-Left>"] = { name="Previous buffer" },
        ["<M-Right>"] = { name="Right window" },
        ["<M-Left>"] = { name="Left window" },
        ["<M-Down>"] = { name="Down window" },
        ["<M-Up>"] = { name="Up window" },
        ["<C-X>"] = { name="Close buffer / window" },
        ["<C-l>"] = { name="Line numbers" },
        ["<C-n>"] = { name="Relative line numbers" },
        ["<C-p>"] = { name="CtrlP" },
    })

    -- visual mode leader mappings
    wk.register(
        {
            ["<leader>c"] = { name = "Copy selection to OS copy buffer" },
        },
        {
            mode = "v",
            silent = true
        }
    )
EOF
endif
