" ==============================
" General settings
" ==============================
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
syntax on
colorscheme molokai
highlight Normal ctermbg=none
set nowrap
set hlsearch
set ignorecase
set smartcase
set autoindent
set ruler
set number
set list
set wildmenu  "コマンドの補完
set showcmd
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smarttab
set backspace=indent,eol,start  "バックスペースの有効化
set clipboard=unnamed  "クリップボードの設定
set visualbell t_vb=  "ビープ音の設定
set history=5000  "コマンド履歴の件数
set fileencoding=utf-8  "保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932  "読み込み時の文字コードの自動判別. 左側優先
set fileformats=unix,dos,mac  "改行コードの自動判別. 左側優先
set ambiwidth=double  "□や○の文字が崩れる問題を解決
autocmd BufRead,BufNewFile     *.rwi  set filetype=rwi
autocmd BufNewFile,BufReadPost *.md   set filetype=markdown
autocmd BufNewFile,BufReadPost *.snip set filetype=snippet
if has("autocmd")
  " sw=softtabstop, sts=shiftwidth, ts=tabstop
  autocmd FileType python      setlocal sw=4 sts=4 ts=4
  autocmd FileType python      :set dictionary=$HOME/.vim/dict/default.dict,$HOME/.vim/dict/python.dict
  autocmd FileType cs          setlocal sw=4 sts=4 ts=4
  autocmd FileType cs          :set dictionary=$HOME/.vim/dict/default.dict,$HOME/.vim/dict/cs.dict,$HOME/.vim/dict/unity.dict
  autocmd FileType snippet     setlocal sw=2 sts=2 ts=2
endif
autocmd BufRead,BufNewFile *.txt set wrap

" ==============================
" Cursor Setting
" ==============================
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

" ==============================
" Cursorline Setting
" ==============================
augroup vimrc-auto-cursorline
 autocmd!
 autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
 autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
 autocmd WinEnter * call s:auto_cursorline('WinEnter')
 autocmd WinLeave * call s:auto_cursorline('WinLeave')

 let s:cursorline_lock = 0
 function! s:auto_cursorline(event)
   if a:event ==# 'WinEnter'
     setlocal cursorline
     let s:cursorline_lock = 2
   elseif a:event ==# 'WinLeave'
     setlocal nocursorline
   elseif a:event ==# 'CursorMoved'
     if s:cursorline_lock
       if 1 < s:cursorline_lock
         let s:cursorline_lock = 1
       else
         setlocal nocursorline
         let s:cursorline_lock = 0
       endif
     endif
   elseif a:event ==# 'CursorHold'
     setlocal cursorline
     let s:cursorline_lock = 1
   endif
 endfunction
augroup END

" ==============================
" KeyMap
" ==============================
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :<C-u>!python %
autocmd BufNewFile,BufRead *.cpp nnoremap <C-e> :<C-u>!g++ % -o execute_cpp && ./execute_cpp && rm -f ./execute_cpp
autocmd BufNewFile,BufRead *.go nnoremap <C-e> :<C-u>!go run %
autocmd BufNewFile,BufRead *.cs nnoremap <C-e> :<C-u>!dotnet run
autocmd BufNewFile,BufRead *.txt nnoremap j gj
autocmd BufNewFile,BufRead *.txt nnoremap k gk
autocmd BufNewFile,BufRead *.txt vnoremap j gj
autocmd BufNewFile,BufRead *.txt vnoremap k gk
nnoremap Y y$

" ==============================
" Plugin
" ==============================
call plug#begin('~/.vim/plugged')
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tyru/caw.vim'
Plug 'aklt/plantuml-syntax'
call plug#end()

" ==============================
" Plugin Setting
" ==============================
" ------------------------------
" snippet
" ------------------------------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

" ------------------------------
" vim-lightline
" ------------------------------
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" ------------------------------
" Unite
" ------------------------------
nnoremap [unite]  <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]w :<C-u>Unite file buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>

" ------------------------------
" caw.vim
" ------------------------------
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

