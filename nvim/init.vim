

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set showcmd
set relativenumber
set termguicolors
set colorcolumn=110
set scrolloff=8 



highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Hop
Plug 'phaazon/hop.nvim'


" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'


call plug#end()

let mapleader = " "

let g:gruvbox_contrast_dark = 'hard'
if exists('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE

if executable('rg') 
    let g:rg_derive_root='true'
endif

luafile $HOME/.config/nvim/configuration.lua


" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'



" LSP Keybindings

nn gR <CMD>lua vim.lsp.buf.rename()<CR>
nn gr <CMD>lua vim.lsp.buf.references()<CR>
nn gi <CMD>lua vim.lsp.buf.implementation()<CR>
nn gd <CMD>lua vim.lsp.buf.definition()<CR>
nn M <CMD>lua vim.lsp.buf.hover()<CR>
nn L <CMD>lua vim.lsp.buf.code_action()<CR>
nn H <CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nn ge <CMD>lua vim.lsp.diagnostic.set_loclist()<CR>




" auto not comment
set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" hop

nn <leader>j <CMD>HopWord<CR>
nn <leader>l <CMD>HopLine<CR>
vn <leader>j <CMD>HopWord<CR>
vn <leader>l <CMD>Hopline<CR>

let g:airline#extensions#tabline#enabled = 1

