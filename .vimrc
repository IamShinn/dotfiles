set number relativenumber
set wildmenu
set wildmode=longest:full
set linebreak
set showbreak=...

set hlsearch
"set smartcase
set ignorecase
set incsearch
set showmatch

"set visualbell
syntax on
set notermguicolors
set t_Co=16

let g:netrw_banner = 0
set autoindent
set smartindent
set smarttab

" cursor configuration
let &t_SI = "\e[5 q" 
let &t_EI = "\e[2 q"
let &t_SR = "\e[3 q"
let &t_ti .= "\e[2 q"
let &t_te .= "\e[3 q"
