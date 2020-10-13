call plug#begin("~/.vim/plugged")
  " Plugin Section
  
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'alvan/vim-closetag'
  Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn build'}
  Plug 'chriskempson/base16-vim'
call plug#end()

" Config Section

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-rls', 'coc-flutter']
let g:closetag_filenames = '*.html,*.jsx,*.tsx'

" Use tab to select from suggestion
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Change Tab to 2 Space
set tabstop=2
set shiftwidth=2
set expandtab

" Map spacebar as <leader> 
let mapleader="\<Space>"

" Commentor
noremap <leader>/ :Commentary<CR>

" Show Relative Line Numbers
set relativenumber

" Map Ctrl+S to Save
noremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>l
vnoremap <C-s> <ESC>:w<CR>

" Autoclose brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Theme
if (has("termguicolors"))
  set termguicolors
endif

syntax enable

" FileTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeWinPos = "right"
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-space> :NERDTreeToggle<CR>

" Integrated Terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Fuzzy Searcher
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" base16 vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
