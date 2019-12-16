call plug#begin('~/.local/share/nvim/plugged')
" Comment / Uncomment
Plug 'tpope/vim-commentary'

" Git stuff like Gblame
Plug 'tpope/vim-fugitive'

" Status bar
Plug 'bling/vim-airline'

" File finder
Plug 'kien/ctrlp.vim'

" Syntax highlighting for TypeScript
Plug 'leafgarland/typescript-vim'

" Color theme
Plug 'sickill/vim-monokai'
call plug#end()

colorscheme monokai
set number " Line numbers on
filetype plugin on
set colorcolumn=120

nmap <silent> <C-h> :tabprevious <CR>
nmap <silent> <C-l> :tabnext <CR>
nmap <silent> <C-n> :tabnew <CR>

" Quick exit of insert mode
inoremap jj <Esc>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Autoformat JSON
com! FormatJSON %!python3 -m json.tool

" CtrlP Settings
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let ctrlp_max_height=100
let g:ctrlp_max_files=0
nmap <C-P> <esc>:CtrlP <CR>
nmap <leader>b :CtrlPBuffer<CR>

" File type aliases for highlighting
au BufNewFile,BufRead *.mustache set filetype=html
au BufNewFile,BufRead *.psql set filetype=sql
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead Dockerfile* set filetype=dockerfile
au BufNewFile,BufRead Gemfile* set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby

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

" Typo forgiveness
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang W w<bang>
command! -bang Q q<bang>
command! -bang Qa qa<bang>

" Indentation
filetype indent plugin on
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"