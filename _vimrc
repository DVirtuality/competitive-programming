set rtp+=C:/Users/DEEPU/Vim/vimfiles/bundle/Vundle.vim
call vundle#begin('C:/Users/DEEPU/Vim/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mechatroner/minimal_gdb'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsForwardTrigger = "<tab>" 
let g:UltiSnipsBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

Plugin 'dense-analysis/ale'


call vundle#end() 
filetype plugin indent on    
" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set number 
syntax on 
colorscheme molokai
set background=dark 
set nocompatible
filetype off 
filetype plugin indent on 
set modelines=0
set ruler  
set visualbell
set encoding=utf-8

"whitespace 

filetype plugin on
set wrap 
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=1
set softtabstop=2
set expandtab
set noshiftround

set hidden 
set showmode 
set showcmd

"Searching
noremap  / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set clipboard=unnamed
set noswapfile
set nobackup nowritebackup
set noundofile
set showmatch 
set nu rnu
set backspace=indent,eol,start
set autoindent
set smartindent
set pastetoggle=<F2> 
set wildmenu
filetype plugin on
set pythonthreedll=C:\Python36\python36.dll
set pythonthreehome=C:\python36

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
"Run and compile c++ file 
autocmd filetype cpp nnoremap <F4> :!g++ -g -std=c++17 %:r.cpp -o %:r <CR> 
autocmd filetype cpp nnoremap <F5> :!g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>
set makeprg=mingw32-make
set matchpairs=(:),{:},[:],<:>,':',":"
"autocmd BufNewFile  *.cpp 0r C:\Users\DEEPU\Vim\template\skeleton.cpp 

"matching brackets 
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

"linter settings 
let g:ale_linters = {'cpp': ['g++']}
let g:ale_cursor_detail = 0
let g:ale_keep_list_window_open = 0
let g:ale_open_list = 1
let g:ale_list_window_size = 7
let g:ale_lint_delay = 0

"cool - mappings  
inoremap js <Esc> 
noremap <F3> <Esc> :tabprev <cr> 

"font settings
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
endif

"nerd tree without installing nerd tree 
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>

