" ========== PLUGINS ==========
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-airline'
Plug 'diepm/vim-rest-console'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'sickill/vim-monokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'vim-test/vim-test'

call plug#end()

" ========== PLUGIN SETTINGS ==========

" fzf
map <leader>t :GFiles<CR>
map <leader>b :Buffers<CR>
map <leader>f :Ag 
map <leader>n :NERDTreeToggle<CR>

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-rest-console
let g:vrc_allow_get_request_body = 1
let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_show_command = 0
let g:vrc_curl_opts = {
  \ '-sS': ''
\}

" vim-test
nmap <silent> <C-c> :TestNearest <CR>
nmap <silent> <C-f> :TestFile <CR>
nmap <silent> <C-x> :TestLast <CR>
let test#strategy = "neovim"

" ========== STYLE / COLOR ==========
colorscheme monokai
set number relativenumber


" ========== ABBREVIATIONS ==========
ab fsl # frozen_string_literal: true
ab rth require 'test_helper'
ab tcase ActiveSupport::TestCase


" open / reload config
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>

filetype plugin on

" Quick exit of insert mode
inoremap jj <Esc>
" Quick exit of insert mode while in terminal emulator
tnoremap jj <C-\><C-n>

" Autoformat JSON
com! FormatJSON %!python3 -m json.tool

" Auto-continue comment chars after ENTER, but not after hitting 'o' or 'O'
au FileType * set formatoptions-=c formatoptions-=o

" Tab navigation
nmap <silent> <C-h> :tabprevious <CR>
nmap <silent> <C-l> :tabnext <CR>
nmap <silent> <C-n> :tabnew <CR>


" Toggle F2 for paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Toggle F3 for spell checking
map <F3> :setlocal spell! spelllang=en_us<CR>
imap <F3> <C-o>:setlocal spell! spelllang=en_us<CR>

map <F4> :silent execute '![ -f "%:p" ] && open -R "%:p" \|\| open "%:p:h"'<CR>

" Typo forgiveness
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang W w<bang>
command! -bang Q q<bang>
command! -bang Qa qa<bang>

" Disable ex mode
map q: <Nop>
nnoremap Q <nop>

command! Ghist 0Glog

" Smart case searching
set ignorecase
set smartcase

" Indentation
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Preview substitutions
set inccommand=nosplit

let g:ruby_indent_access_modifier_style="indent"
