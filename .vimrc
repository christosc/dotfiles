set ignorecase
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LEN=%L]
syntax enable 
set tabstop=2
set shiftwidth=4
set expandtab
set number
set linebreak
set wrap
set autoindent
filetype plugin on
set incsearch
set hlsearch
" ΓΙΑ NERDTree
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"set wrap
"set columns=80
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


"autocmd FileType mkd set includeexpr=substitute(v:fname,'\\.','/','g').'.md'

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$


