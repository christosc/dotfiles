"set guifont=Consolas:h13
"set guifont=Cousine:h12
"set guifont=Consolas:h12
"set guifont=DejaVuSansMono:h12
set guifont=Menlo:h12
":inoremap <S-space> <ESC>
":inoremap <D-space> <ESC>
":inoremap <C-space> <ESC>
":inoremap <D-[> <ESC>
"map <silent> <C-h> :tabprevious<CR>
"map <silent> <C-l> :tabnext<CR>
":imap <silent> <C-h> :tabprevious<CR>
":imap <silent> <C-l> :tabnext<CR>
map <D-j> :set invmmta<CR> 
map <A-h> :tabprevious<CR>
map <A-l> :tabnext<CR>
"inoremap <S-space> <ESC>
"set textwidth=80
"colorscheme zenburn
"colorscheme BClear
"colorscheme github
"colorscheme molokai
"colorscheme desert256
"colorscheme vc
"colorscheme eclipse
"colorscheme wombat
"colorscheme myWombat
"colorscheme github2
"colorscheme wombat
"colorscheme wombat256
"colorscheme desert
"colorscheme cacdeveloper
"colorscheme cac_ironman
"colorscheme anotherdark
"colorscheme tango2
"colorscheme biogoo
"colorscheme habiLight1
"colorscheme VYLight
"let s:lightcolorscheme="silent"
"colorscheme silent
let Tlist_WinWidth=40
"colorscheme vylight-mod
"colorscheme tango2
"colorscheme emacs1
"colorscheme chela_light-1
"colorscheme moria
"hi CuresorLine guibg=Grey95
"set background=light
"set number
"hi Comment gui=None
set columns=82
"set guicursor=i:ver10-blinkwait200-blinkon600-blinkoff600
"set guicursor+=n-c-v:blinkwait200-blinkon600-blinkoff600
set guicursor=n-v-c:block-Cursor/lCursor-blinkwait300-blinkoff500-blinkon500,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver20-Cursor/lCursor-blinkwait300-blinkoff600-blinkon600,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff600-blinkon600
set guicursor+=n-c-v:blinkon0
"set guicursor+=n-c-v:ver20-blinkon500-blinkoff500
"set guicursor+=n-c-v:blinkon600-blinkoff600uset gcr=n:blinkon0
"set guicursor=a:blinkon0
set guioptions-=T "hide toolbar
"set columns=80
set hidden
set nonumber
"autocmd BufRead *.tex set guifont=menlo:h14
"set number
set noimdisable

set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}

" set up tab tooltips with every buffer name
function! GuiTabToolTip()
  let tip = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  for bufnr in bufnrlist
    " separate buffer entries
    if tip!=''
      let tip .= " \n "
    endif
    " Add name of buffer
    let name=bufname(bufnr)
    if name == ''
      " give a name to no name documents
      if getbufvar(bufnr,'&buftype')=='quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    endif
    let tip.=name
    " add modified/modifiable flags
    if getbufvar(bufnr, "&modified")
      let tip .= ' [+]'
    endif
    if getbufvar(bufnr, "&modifiable")==0
      let tip .= ' [-]'
    endif
  endfor
  return tip
endfunction
set guitabtooltip=%{GuiTabToolTip()}

set background=dark
colorscheme desert
set t_Co=0
syntax off
