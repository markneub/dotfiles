set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" colors 'n themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/seoul256.vim'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ide/general improvements
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'w0rp/ale'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf.vim'
"Plugin 'djoshea/vim-autoread' " FIXME
Plugin 'scrooloose/nerdcommenter'
Plugin 'wesQ3/vim-windowswap'

" formatters
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'posva/vim-vue'

Plugin 'shougo/deoplete.nvim'
if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'shougo/neosnippet-snippets'

call vundle#end()

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" enable fzf
set rtp+=/usr/local/opt/fzf

filetype plugin indent on

" --- general settings
set backspace=indent,eol,start
set ruler
set number " turn on line numbers
set showcmd
set incsearch
set hlsearch

syntax on

" set augroup
augroup MyAutoCmd
  autocmd!
augroup END

set lazyredraw
set ttyfast

" turn on the mouse in all modes
set mouse=a

" give one virtual space at end of line
set virtualedit=onemore

" always splits to the right and below
set splitright
set splitbelow

" boost performance of rendering long lines
set synmaxcol=300

" sets how many lines of history vim has to remember
set history=1000

" minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" allow changing buffer without saving it first
set hidden

" case insensitive search
set ignorecase
set smartcase

" explicitly set encoding to utf-8
set encoding=utf-8

" reload vimrc when edited
" autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
"       \ so $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif |
"       AirlineRefresh
autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
      \ so $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif
try
  lang en_us
catch
endtry

" turn backup off
set nobackup
set nowritebackup
set noswapfile

" tab settings
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab

" text display settings
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Use a low updatetime. This is used by CursorHold
set updatetime=1000

" for plugins like syntastic and vim-gitgutter which put symbols
" in the sign column
hi clear SignColumn

" --- plugin-specific settings

" --- vim-colors-solarized
set background=dark
let g:solarized_termcolors=256
" colorscheme molokai
colorscheme gruvbox

" let g:seoul256_background = 233
" colo seoul256

" --- vim-airline
" always show statusbar
set laststatus=2

let g:airline_powerline_fonts = 1

" show PASTE if in paste mode
let g:airline_detect_paste=1

" show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" use solarized theme for airline status bar
let g:airline_theme='gruvbox'

" --- vim-nerdtree-tabs
" open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" always open NERDTree on startup
" let g:nerdtree_tabs_open_on_console_startup = 1

" use vim-style controls for next/previous/new tab
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" --- nerdcommenter
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" toggle comments with <C-/> (registers as <C-_> for some reason)
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

" use jk as a shortcut for escape
:inoremap jk <esc>

" treat long lines as break lines when navigating up and down
noremap j gj
noremap k gk

" buffer controls
noremap <C-q> :bdelete<CR>

" --- ale
let g:airline#extensions#ale#enabled = 1

" --- gutentags
let g:gutentags_cache_dir = '~/.gutentags'
let g:gutentags_ctags_executable = '/usr/local/Cellar/universal-ctags/HEAD-11ee721/bin/ctags'
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }

" --- vim-easytags
" set tags=./tags;,~/.vimtags

" let g:easytags_events = ['BufReadPost', 'BufWritePost']
" let g:easytags_async = 1
" let g:easytags_dynamic_files = 2
" let g:easytags_resolve_links = 1
" let g:easytags_suppress_ctags_warning = 1
" let g:easytags_file = '~/.vim/tags'

" --- tagbar
" open/close tagbar with ,b
nmap <silent> <leader>b :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/universal-ctags/HEAD-11ee721/bin/ctags'
" open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)

" --- ctrlp
" let g:ctrlp_custom_ignore = {
  " \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|static)$',
  " \ 'file': '\v\.(exe|so|dll)$',
  " \ }

let g:ctrlp_custom_ignore = {
  \   'dir' : '\.git$\|build$\|bower_components\|node_modules\|dist\|target' ,
  \   'file' : '\v\.(exe|dll|lib)$'
  \ }

" open files in a new tab upon <CR> instead of <c-t>
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" --- normal mode ctrl key mappings
" Ctrl-f: fzf
nnoremap <c-f> :Ag<CR>

" read ejs files like html
au BufNewFile,BufRead *.ejs set filetype=html

" autocompletion

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

