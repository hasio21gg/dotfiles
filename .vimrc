"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'fholgado/minibufexpl.vim'
"NeoBundle 'cohama/agit.vim'
NeoBundle 'tpope/vim-fugitive'
" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
"NeoBundle 't9md/vim-quickhl'
" Required:
call neobundle#end()
" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
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
"if has('win32')
	set encoding=cp932
	set termencoding=cp932
	set fileencoding=utf-8
	set fileencodings=utf-8,utf-16le,cp932,euc-jp
"endif
"日付けを変数に格納しておく
"let $TODAY = strftime('%Y%m%d')
"let $NOW = strftime('%Y%m%d%H%M%S')
"キーマップ
" ESC-ESC-ESC で検索後ハイライトをリセット
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
set cursorline
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

set statusline+=%{fugitive#statusline()}
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
"-----------------------------
"　コマンド履歴
" F5 キーでコマンド履歴を開く
" F6 キーで検索履歴を開く
nnoremap <F5> <CR>q:
nnoremap <F6> <CR>q/
" q:、q/、q? は無効化
nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap q? <NOP>
"-----------------------------
filetype on
