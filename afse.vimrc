set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"Plugin 'eraserhd/vim-ios'
Plugin 'keith/swift.vim'
Plugin 'tpope/vim-unimpaired'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'majutsushi/tagbar'
"Plugin 'kien/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set linebreak

syntax on
set t_Co=256
"syntax off
"set t_Co=0
set nohlsearch

"set hidden          " switch buffers without needing to save them
"set tabstop=4       " number of visual spaces per TAB
"set shiftwidth=4
"set expandtab       " tabs are spaces
set incsearch
set ignorecase
set smartcase
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent "stay on same level as previous line
set smartindent "increase indentation level of new line after opening a block.
" Always display the status line, even if only one window is displayed
set laststatus=2
" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>
" Enable use of the mouse for all modes
set mouse=a
"set wildmenu

"function! SetupEnvironment()
"  let l:path = expand('%:p')
"  if l:path =~ '/Users/cac/Documents/Projects/'
"    setlocal expandtab "smarttab textwidth=0
"    setlocal tabstop=4 shiftwidth=4
"  endif
" " elseif l:path =~ '/home/user/projects'
" "   setlocal tabstop=4 shiftwidth=4 noexpandtab
" " endif
"endfunction

"autocmd! BufReadPost,BufNewFile * call SetupEnvironment()
let loaded_matchparen = 1
inoremap jj <Esc>
set ruler
"set foldlevelstart=99
"set foldmethod=syntax
set background=dark

"let s:color_column_old = 0
"function! s:ToggleColorColumn()
"    if s:color_column_old == 0
"        let s:color_column_old = &colorcolumn
"        "windo let &colorcolumn = 0
"        set colorcolumn=0
"    else
"        "windo let &colorcolumn=s:color_column_old
"        let &colorcolumn=s:color_column_old
"        let s:color_column_old = 0
"    endif
"endfunction
" 
""nnoremap <silent><F2> :TlistToggle<cr>
"nnoremap <silent><F3> :call <SID>ToggleColorColumn()<cr>

function! g:ToggleColorColumn()
  if &colorcolumn != ''
    set colorcolumn&  "setlocal colorcolumn&
  else
    set colorcolumn=121  "setlocal colorcolumn=81
  endif
endfunction


nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<CR>
nnoremap <silent> <leader>80 :vert resize 80<CR>

function! g:AlternateFile()
	let extension = expand('%:e')
	if extension == 'm'
		edit %:r.h
	elseif extension == 'h'
		edit %:r.m
	endif
endfunction


set keymap=greek_mac
set iminsert=0
set imsearch=-1
"nnoremap <silent><F2> :wa<cr>
set pastetoggle=<F3>
map <F2> :update<CR>
"set hlsearch
" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

if has("autocmd")
      "autocmd BufNewFile,BufRead *.h,*.m MyMethods :vimg /^-/j %
      "autocmd BufRead,BufNewFile *.swift command Methods vimg /\<func\>/j % | cw
endif

augroup ObjectiveC
    autocmd!
    au BufRead,BufNewFile *.h set filetype=objc
    autocmd FileType objc  set tags+=~/Documents/global-objc-tags
    autocmd FileType objc command! Methods vimg /^-/j % | cw
    autocmd FileType objc command! A :call g:AlternateFile()
augroup END

augroup Swift
    autocmd!
    autocmd FileType swift command! Methods vimg /\<func\>/j % | cw
augroup END

nmap <F8> :TagbarToggle<CR>
"nnoremap <leader>. :CtrlPTag<cr>
inoremap <leader><Space> <c-^>
inoremap <c-l> <c-^>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

let g:tagbar_type_objc = {
  \ 'ctagstype': 'objc',
  \ 'ctagsargs': [
    \ '-f',
    \ '-',
    \ '--excmd=pattern',
    \ '--extra=',
    \ '--format=2',
    \ '--fields=nksaSmt',
    \ '--options=' . expand('~/.vim/objctags'),
    \ '--objc-kinds=-N',
  \ ],
  \ 'sro': ' ',
  \ 'kinds': [
    \ 'c:constant',
    \ 'e:enum',
    \ 't:typedef',
    \ 'i:interface',
    \ 'P:protocol',
    \ 'p:property',
    \ 'I:implementation',
    \ 'M:method',
    \ 'g:pragma',
  \ ],
\ }

let g:tagbar_type_swift = {
  \ 'ctagstype': 'objc',
  \ 'ctagsargs': [
    \ '-f',
    \ '-',
    \ '--excmd=pattern',
    \ '--extra=',
    \ '--format=2',
    \ '--fields=nksaSmt',
    \ '--options=' . expand('~/.vim/objctags'),
    \ '--objc-kinds=-N',
  \ ],
  \ 'sro': ' ',
  \ 'kinds': [
    \ 'f:function',
    \ 'c:class',
    \ 's:struct',
    \ 'x:extension',
    \ 'p:protocol',
    \ 'e:enum',
  \ ],
\ }

"nnoremap <silent> ]q :cnext<CR>  
"nnoremap <silent> [q :cprevious<CR>
"nnoremap <silent> ]b :bnext<CR>  
"nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> <leader># :b#<CR>
noremap <leader>s :update<CR>
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,default,latin1,ucs-bom
"set nowrapscan "no wrap when searching


"noremap  <buffer> <silent> k gk
"noremap  <buffer> <silent> j gj
"noremap  <buffer> <silent> 0 g0
"noremap  <buffer> <silent> $ g$
"set nu
"colorscheme cacDesert256
colorscheme desert
highlight ColorColumn ctermbg=DarkGrey
"set runtimepath^=~/.vim/bundle/ctrlp.vim
silent! so .vimlocal
"set showbreak=>\ 
"set laststatus=0
set wildignore=*.png
"command Bobjc execute "vimg /^[-+]/j % | cw"

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b" -RiI . <CR>:cw<CR>

" Add format option 'w' to add trailing white space, indicating that paragraph
" continues on next line. This is to be used with mutt's 'text_flowed' option.
augroup mail_trailing_whitespace
    autocmd!
    autocmd FileType mail setlocal formatoptions+=w
augroup END

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set hidden
"source ~/.vim/plugins/a.vim
set nowrapscan
set nowrap
