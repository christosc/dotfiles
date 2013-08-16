" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ignorecase
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LEN=%L]
"syntax enable 
"set tabstop=4    " ὁ Μανώλης ἔτσι ts = 8 …
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set tabstop=4
"set softtabstop=4
"set shiftwidth=8
set noexpandtab
set autowrite  " ὁ Μανώλης τὸ ἔχει ἔτσι (συντμ. aw)
"set autoread
"set number
set linebreak
set nolist
" Add full file path to your existing statusline
"set statusline+=%F
set ruler
"set t_Co=256
"set background=dark
set term=xterm-256color
"set background=light
"colorscheme default
"colorscheme desert
"colorscheme desert256
"colorscheme default
"colorscheme my_default
"colorscheme macvim
"colorscheme solarized
"colorscheme badwolf
"colorscheme ron
"colorscheme ron
"colorscheme emacs1
"colorscheme zenburn
"colorscheme grb4
"colorscheme inkpot
"colorscheme gardener
"colorscheme mayansmoke
"colorscheme pyte
"colorscheme 256-grayvim
"colorscheme my-256-grayvim
"colorscheme wombat256
"colorscheme desert256
"colorscheme chela_light-1
"colorscheme github
"colorscheme github2
"colorscheme wombat
"hi LineNr guifg=DarkGray
"hi LineNr ctermfg=Gray
"set wrap
"set nowrap

" Γιά νά θέτῃ αὐτόματα κατάλληλον ἐσοχήν.
set autoindent
filetype plugin on
set incsearch
set hlsearch
" ΓΙΑ NERDTree
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"autocmd FileType taglist set wrap
"set nowrap
"set columns=80


"autocmd FileType mkd set includeexpr=substitute(v:fname,'\\.','/','g').'.md'

"noremap  <buffer> <silent> k gk
"noremap  <buffer> <silent> j gj
"noremap  <buffer> <silent> 0 g0
"noremap  <buffer> <silent> $ g$

"map j gj
"map k gk
"map $ g$
"map ^ g^
inoremap jj <Esc>


execute pathogen#infect()








nnoremap <Space> l
"set autoread

" Γιὰ νὰ ἐπισημαίνῃ τὸ κείμενο ποὺ ξεπερανᾷ τὶς 80 στῆλες...
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/


" Γιὰ νὰ σῴζῃ ἀντίγραφα ἀσφαλείας ἀρχείων.
set backup
set writebackup

set foldmethod=manual
nnoremap <silent> <F3> :TlistToggle<CR>

"set autoindent


let  g:netrw_browse_split=2

" Γιὰ νὰ ἀνοίγῃ ὁ κατάλογος τῶν tags δεξιόθεν τοῦ κυρίως viewport.
"let Tlist_Use_Right_Window   = 1
""let Tlist_Auto_Open = 1
"let Tlist_Show_One_File = 1
"let Tlist_Use_Horiz_Window = 1

" To automatically store/restore folds
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"map <C-Space> <Esc>
"cmap <C-Space> <C-c>


" Settings for Vim-LaTeX
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf = 'Preview'

"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>
"set wrap

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif

set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
   set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
   syntax on
   set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to
    "  72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent
    "         indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them
    "             easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last
    "  known cursor position.
    " Don't do it when the position is invalid or
    "  when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the
    " first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

    augroup END

else

    set autoindent                " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and
" the
" " file it was loaded from, thus the changes you made.
" " Only define it when not defined already.
if !exists(":DiffOrig")
   command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                     \ | wincmd p | diffthis
endif

set textwidth=78

" γιὰ νὰ μὴ τρελλαθῇς μὲ τὶς συμπληρώσεις τοῦ Vim LaTeX suite...
let g:Imap_UsePlaceHolders = 0
autocmd BufRead *.tex call IMAP('SSS', 'SSS', 'tex')
"autocmd BufRead *.tex set fo+=a
"autocmd BufRead *.tex set textwidth=0
let g:Tex_SmartKeyQuote=0
let g:Tex_Leader=','
let tex_no_error=1
set whichwrap=bshl
set display=lastline
map <Up> gk
map <Down> gj


"set linespace=1
set nocp
set bs=indent,eol,start
"set ww=b,s,h,l
nnoremap <silent><Space> :nohlsearch<CR>l
" Press Space to turn off highlighting and clear any message already displayed.
"nmap <silent> <Space> :nohlsearch<CR>


let g:LatexBox_viewer = 'skim'
let g:LatexBox_latexmk_options = '-pvc'
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"


set viminfo+=f1

" Διὰ ὑποστήριξι τοῦ LaTeX εἰς τὸ tag list.

"let tlist_tex_settings   = 'latex;b:bibitem;c:command;s:sections;g:graphics;l:labels'
"let tlist_make_settings  = 'make;m:makros;t:targets'


set tags=./tags,tags

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
autocmd FileType gitcommit setlocal textwidth=72
"set statusline=\ %t\ \ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y\ %{fugitive#statusline()}%=%c,%v\ %l/%L\ %P\ 

"colorscheme zenburn
"colorscheme wombat256

"call pathogen#infect()

set hidden

"noremap  <silent> k gk
"noremap  <silent> j gj
"noremap  <silent> 0 g0
"noremap  <silent> $ g$

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

autocmd BufReadPost ~/Dropbox/work/dms/pleaserun/results.txt source ~/Dropbox/work/vim/test2.vim

autocmd FileChangedShell *
          \ echohl WarningMsg |
          \ echo "File has been changed outside of vim." |
          \ echohl None

" Enable spell check by default for git commits.
" You must have installed vim-git plugin.
" autocmd FileType gitcommit set spell

" Makefile 
autocmd FileType make set noexpandtab

set encoding=utf-8

set showcmd  " display incomplete commands 

set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
"set smartcase                   " ... unless they contain at least one capital letter

digraph .M 903

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"set t_Co=256
set t_Co=0

nnoremap <F5> :buffers<CR>:buffer<Space>
"set background=dark
"
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
"set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

au FileChangedShell * echo "Warning: File changed on disk"
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.m set filetype=objc
"au BufRead,BufNewFile *.m set filetype=nosyntax
au BufRead,BufNewFile *.h set filetype=objc
"au BufRead,BufNewFile *.h set filetype=nosyntax

set path=.,,**
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>


function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
  "let string = bufname(buflist[winnr - 1])
  return empty(string) ? '[unnamed]' : string
endfunction

"function! MyTabLabel(n)
"  let buflist = tabpagebuflist(a:n)
"  let winnr = tabpagewinnr(a:n)
"  return bufname(buflist[winnr - 1])
"endfunction

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' ' 

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
      let s .= ' |'
    endif
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

set tabline=%!MyTabLine()


" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

se mouse +=a

let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set nocursorline
set encoding=utf-8 
set fenc=utf-8 
"set iminsert=0
"set imsearch=-1
"set keymap=greek_polytonic
"set keymap=greek_utf-8
"set keymap=
"set encoding=utf-8
"set inputenc=utf-8
"set fenc=utf-8

au FileChangedShell * echo "Warning: File changed on disk"
let g:clang_complete_auto=0

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


"hi TabLine ctermfg=black ctermbg=grey cterm=none
"hi TabLineFill ctermfg=grey ctermbg=grey
"hi TabLineSel ctermfg=white ctermbg=black cterm=underline

"let c_no_curly_error = 1 " so that Objective-C block are not highlighted as errors
set ignorecase
set smartcase
set ttyfast
"set nohlsearch
set t_Co=0
syntax off
set tw=0
set foldlevelstart=1
"set nowrapscan
"

function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "m")
    find %:t:r.h
  else
    find %:t:r.m
  endif
endfunction

nmap ,s :call SwitchSourceHeader()<CR>
 
set iskeyword-=:
"DoMatchParen
"set showmatch
"set expandtab

au FileType c,cpp,objc setlocal comments-=:// comments+=f://

set keymap=greek_utf-8
set iminsert=0
set imsearch=-1

inoremap <c-l> <c-^>
