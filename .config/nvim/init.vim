"==============================
" Plugin(s)
"==============================

call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
  Plug 'ctrlpvim/ctrlp.vim' | Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-scripts/fountain.vim' | Plug 'tpope/vim-markdown' | Plug 'ap/vim-css-color'
  Plug 'vifm/vifm.vim'
  Plug 'preservim/nerdtree'
  Plug 'morhetz/gruvbox'
  Plug 'vim-syntastic/syntastic'
call plug#end()

"==============================
" General setting(s)
"==============================

set encoding=UTF-8 nobackup nowritebackup nocursorline splitbelow splitright wildmode=longest,list,full
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab
set cursorline
"set list
"set listchars=tab:>>,trail:·,eol:$
set nowrap

" Display colorcolumn in Insert mode

augroup ColorColumnInInsertMode
  autocmd!
  autocmd InsertEnter * setlocal colorcolumn=81
  autocmd InsertLeave * setlocal colorcolumn=""
augroup END

" Enter Insert mode on editing GIT commit message

augroup OnGitCommit
  autocmd!
  autocmd FileType gitcommit startinsert
augroup END

" Status line

set statusline=
set statusline+=%#CursorLineNr#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#NonText#
set statusline+=\ %F

set statusline+=%=
set statusline+=%#DiffText#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"==============================
" Key binding(s)
"==============================

" Leader key
let mapleader=" "

" Load current file
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>

" Open Goyo
nnoremap <leader><ENTER> :Goyo<CR>

" Open CtrlP
nnoremap <leader><Space> :CtrlP<CR>

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Open ViFm
nnoremap <leader>f :TabVifm .<CR>

" Fold setting(s)
nnoremap <leader>z :set invrnu invnu<CR>
nnoremap <leader><C-l> :set nofoldenable<CR>
nnoremap <C-l> :set foldmethod=indent<CR>
nnoremap <C-k> :set foldmethod=syntax<CR>

" In VISUAL mode moving selected lines up/down
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" Disable Q
nnoremap Q <nop>

" Disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Yank until the end of the line
nnoremap Y y$

" Next/Previous search, center the line & open folds
nnoremap n nzzzv
nnoremap N Nzzzv

" Cursor stays after pressing J (Join lines)
nnoremap J mzJ`z

" Undo break point(s)
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

"==============================
" Color setting(s)
"==============================

colorscheme gruvbox
set background=dark
set termguicolors

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! Whitespace ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = "#777777"

" Goyo setting(s)

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
	hi! Normal ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
