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

" general
set number          " line number
set relativenumber  " relative line number
set noshowmode      " disable showmode

" colorscheme
set background=dark
colorscheme gruvbox

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='minimalist'
