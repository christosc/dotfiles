set ignorecase
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LEN=%L]
syntax enable 
set tabstop=4
set shiftwidth=4
set autowrite
set expandtab
"set number
set linebreak
set ruler
"colorscheme desert
colorscheme cac_wombat
"hi LineNr guifg=DarkGray
"hi LineNr ctermfg=Gray
"set wrap

" Γιά νά θέτῃ αὐτόματα κατάλληλον ἐσοχήν.
set autoindent
filetype plugin on
set incsearch
set hlsearch
" ΓΙΑ NERDTree
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

set nowrap
"set columns=80
" Press Space to turn off highlighting and clear any message already displayed.
":nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


"autocmd FileType mkd set includeexpr=substitute(v:fname,'\\.','/','g').'.md'

"noremap  <buffer> <silent> k gk
"noremap  <buffer> <silent> j gj
"noremap  <buffer> <silent> 0 g0
"noremap  <buffer> <silent> $ g$

noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
set expandtab
nnoremap <Space> l
set autoread

" Γιὰ νὰ ἐπισημαίνῃ τὸ κείμενο ποὺ ξεπερανᾷ τὶς 80 στῆλες...
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/


" Γιὰ νὰ σῴζῃ ἀντίγραφα ἀσφαλείας ἀρχείων.
set backup
set writebackup

set foldmethod=syntax
nnoremap <silent> <F8> :TlistToggle<CR>

set autoindent


let  g:netrw_browse_split=2
