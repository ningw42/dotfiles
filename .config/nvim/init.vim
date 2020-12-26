" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'elzr/vim-json'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
" Initialize plugin system
call plug#end()

" plugin tweaks
" do NOT hide quotes for JSON
let g:vim_json_syntax_conceal=0

" general
set number          " line number
set relativenumber  " relative line number
set noshowmode      " disable showmode
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" colorscheme
set background=dark
colorscheme gruvbox

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

" enable true color support
if (has("termguicolors"))
  set termguicolors
endif
