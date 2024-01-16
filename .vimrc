"---------------------------------------------------------------- START dein
let $CACHE = expand('~/.vim')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

" AFTER 1
set nocompatible
let s:dein_base = '~/.vim/dein'
let s:dein_src = '~/.vim/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' .. s:dein_src
call dein#begin(s:dein_base)
call dein#add(s:dein_src)
" AFTER 2
let s:toml = s:dein_base . '/dein.toml'
call dein#load_toml(s:toml, {'lazy': 0})
"
" AFTER 1
filetype plugin indent on
syntax enable
" syntax on

call dein#end()
if dein#check_install()
	call dein#install()
endif
"---------------------------------------------------------------- END dein
"
"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
"call dein#begin(expand('~/.vim/dein'))
"call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/vimproc.vim', {'build': 'make'})
"call dein#add('Shougo/neocomplete.vim')
"call dein#add('Shougo/neomru.vim')
"call dein#add('Shougo/neosnippet')
"call dein#add('fholgado/minibufexpl.vim')
"call dein#end()


" ウインドウの幅
set columns=130
" ウインドウの高さ
set lines=55
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

"入力モード時、ステータスラインのカラーを変更
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

"================================================================
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
    augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
     silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
     silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
"================================================================
" バックアップファイルの保管先
set backupdir=~/vimfiles/Backup
" SWPファイルの保管先
set directory=~/vimfiles/Swaps
" Swapは使わない
set noswapfile
set tabstop=4
set shiftwidth=4
"検索時に大文字この字を区別しない
set ignorecase
"検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase
"検索語にマッチした単語をハイライトする
set hlsearch
"括弧入力時に対応する括弧を強調する
"set showmatch
"行番号を表示する
"逆は set nonumber
set number
"改行やタブを可視化する
"set list
"構文ごとに色分け表示する
syntax on
"[syntax on]の場合、コメント文の色を変更する
highlight Comment ctermfg=gray
" 新規ファイル時はUTF8
" 既存ファイルは自動
if has('win32')
	set encoding=cp932
	set termencoding=cp932
	set fileencoding=utf-8
	set fileencodings=utf-8,utf-16le,cp932,euc-jp
elseif has('mac')
else
	set encoding=utf-8
	set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
	set fileformats=unix,dos,mac
endif
"日付けを変数に格納しておく
"let $TODAY = strftime('%Y%m%d')
"let $NOW = strftime('%Y%m%d%H%M%S')
"キーマップ
" ESC-ESC-ESC で検索後ハイライトをリセット
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
"set cursorline
let ff_table = {'dos' : 'CR+LF', 'unix' : 'LF', 'mac' : 'CR' }
" ステータスライン
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
set laststatus=2
set statusline=%<		"行が長すぎるとに切り詰める位置
set statusline+=[%n]	"バッファ番号
set statusline+=%m		" %m 修正フラグ
set statusline+=%r		" %r 読み込み専用フラグ
set statusline+=%h		" %h ヘルプバッファフラグ
set statusline+=%w		" %w プレビューウィンドウフラグ
set statusline+=[%{ff_table[&ff]}]	" %w プレビューウィンドウフラグ
set statusline+=[%{&fenc}]	"
set statusline+=%y		" バッファ内のファイルのタイプ
set statusline+=\ 		" 空白スペース
if winwidth(0)>100
   set statusline+=%F	"バッファ内のファイルのフルパス
else
   set statusline+=%t	"ファイル名のみ
endif
set statusline+=%=		"左寄せ項目と右寄せ項目の区切り
set statusline+=\ \ 	"空白スペース2個
set statusline+=%1l		"何行目にカーソルがあるか
set statusline+=/		"
set statusline+=%L		"バッファ内の総行数
set statusline+=,		"
set statusline+=%c		"何列目にカーソルがあるか
set statusline+=%V	 	"画面上の何列目にカーソルがあるか
set statusline+=\ \ 	"空白スペース2個
set statusline+=%P		"ファイル内の何％の位置にあるか

set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

set laststatus=2

"vim-airline
let g:airline_theme = 'molokai'
let g:airline_theme = 'papercolor'
let g:lightline = {
      \ 'colorscheme': 'PaperColor_light',
      \ }

""let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

"--------------------------------------------------
" dbextプラグイン用
" 環境に合わせてクライアントプログラムを変更
" (ver.20.0 からはデフォルトでsqlite3)
"let g:dbext_default_SQLITE_bin = 'sqlplus'
" プロファイルの定義
"let g:dbext_default_profile_MySQL_test = 'type=SQLSRV:integratedlogin=1:dbname=myDB'
"let g:dbext_default_profile_SQLServer_test = 'type=SQLSRV:integratedlogin=1:dbname=myDB'
"let g:dbext_default_profile_SACAS_test = 'type=ORA:srvname=MONOSKJT:user=SACAS:passwd=SACAS00'
"デフォルトで使用するプロファイルを指定
"let g:dbext_default_profile = 'SACAS_test'
"-----------------------------
" ミニバッファ
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"　コマンド履歴
" F5 キーでコマンド履歴を開く
" F6 キーで検索履歴を開く
nnoremap <F5> <CR>q:
nnoremap <F6> <CR>q/
" q:、q/、q? は無効化
nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap q? <NOP>
" QuickFix
"nnoremap [q :cprevious<CR>
"nnoremap ]q :cnext<CR>
"nnoremap [Q :<C-u>cfirst<CR>
"nnoremap ]Q :<C-u>clast<CR>

"inoremap <expr> ,df strftime('%Y/%m/%d %H:%M')
"inoremap <expr> ,dd strftime('%Y/%m/%d')
"let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
"let wday = strftime("%w")
"inoremap <expr> ,ds strftime('%Y/%m/%d ').weeks[wday]

"
if has("autocmd")
	filetype indent on
	"sw : softtabstop
	"sts: shiftwidth
	"ts : tabstop
	"et : expandtab
	autocmd FileType json setlocal sw=4 sts=4 ts=4 et
	autocmd FileType yml  setlocal sw=2 sts=2 ts=2 et
	autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et
	"autocmd Filetype json let g:indentLine_enabled=0
endif

"-----------------------------
filetype on
