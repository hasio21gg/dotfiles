<<<<<<< HEAD
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
NeoBundle 'tpope/vim-fugitive'
" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
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
	set fileencodings=utf-8,cp932
"endif
"日付けを変数に格納しておく
"let $TODAY = strftime('%Y%m%d')
"let $NOW = strftime('%Y%m%d%H%M%S')
"キーマップ
" ESC-ESC-ESC で検索後ハイライトをリセット
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
set cursorline
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
set statusline+=%y		" バッファ内のファイルのタイプ
set statusline+=\ 		" 空白スペース
if winwidth(0)>130
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
filetype on
=======
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
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'


" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"================================================================
" 繧ｦ繧､繝ｳ繝峨え縺ｮ蟷�
set columns=130
" 繧ｦ繧､繝ｳ繝峨え縺ｮ鬮倥＆
set lines=55
" 繧ｳ繝槭Φ繝峨Λ繧､繝ｳ縺ｮ鬮倥＆(GUI菴ｿ逕ｨ譎�)
set cmdheight=2

"蜈･蜉帙Δ繝ｼ繝画凾縲√せ繝�繝ｼ繧ｿ繧ｹ繝ｩ繧､繝ｳ縺ｮ繧ｫ繝ｩ繝ｼ繧貞､画峩
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
" 繝舌ャ繧ｯ繧｢繝�繝励ヵ繧｡繧､繝ｫ縺ｮ菫晉ｮ｡蜈�
set backupdir=~/vimfiles/Backup
" SWP繝輔ぃ繧､繝ｫ縺ｮ菫晉ｮ｡蜈�
set directory=~/vimfiles/Swaps
" Swap縺ｯ菴ｿ繧上↑縺�
set noswapfile

"迚ｹ谿頑枚蟄�(SpecialKey)縺ｮ隕九∴繧句喧縲Ｍistchars縺ｯlcs縺ｧ繧りｨｭ螳壼庄閭ｽ縲�
""trail縺ｯ陦梧忰繧ｹ繝壹�ｼ繧ｹ縲�
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<
"
set tabstop=4

"讀懃ｴ｢譎ゅ↓螟ｧ譁�蟄励％縺ｮ蟄励ｒ蛹ｺ蛻･縺励↑縺�
set ignorecase

"讀懃ｴ｢隱槭↓螟ｧ譁�蟄励ｒ豺ｷ縺懊ｋ縺ｨ讀懃ｴ｢譎ゅ↓螟ｧ譁�蟄励ｒ蛹ｺ蛻･縺吶ｋ
set smartcase

"讀懃ｴ｢隱槭↓繝槭ャ繝√＠縺溷腰隱槭ｒ繝上う繝ｩ繧､繝医☆繧�
set hlsearch

"諡ｬ蠑ｧ蜈･蜉帶凾縺ｫ蟇ｾ蠢懊☆繧区峡蠑ｧ繧貞ｼｷ隱ｿ縺吶ｋ
"set showmatch

"陦檎分蜿ｷ繧定｡ｨ遉ｺ縺吶ｋ
"騾�縺ｯ set nonumber
set number

"謾ｹ陦後ｄ繧ｿ繝悶ｒ蜿ｯ隕門喧縺吶ｋ
"set list

"讒区枚縺斐→縺ｫ濶ｲ蛻�縺題｡ｨ遉ｺ縺吶ｋ
syntax on

"[syntax on]縺ｮ蝣ｴ蜷医�√さ繝｡繝ｳ繝域枚縺ｮ濶ｲ繧貞､画峩縺吶ｋ
highlight Comment ctermfg=gray

"===========================================================
"繧ｭ繝ｼ繝槭ャ繝�
" ESC-ESC-ESC 縺ｧ讀懃ｴ｢蠕後ワ繧､繝ｩ繧､繝医ｒ繝ｪ繧ｻ繝�繝�
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>

"map <Space> :tabn<CR>

inoremap <silent> jj <ESC>

set scrolloff=5
set cursorline
"nmap n nzz
"nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" s縲�繧ｭ繝ｼ謚ｼ荳九ｒ辟｡蜉ｹ
nnoremap s <Nop>
" 繧ｦ繧｣繝ｳ繝峨え蛻�蜑ｲ遘ｻ蜍�
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
" 繧ｦ繧､繝ｳ繝峨え蜈･譖ｿ
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

"===========================================================
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"================================================================
" 繧ｹ繝�繝ｼ繧ｿ繧ｹ繝ｩ繧､繝ｳ
set laststatus=2
set statusline=%<		"陦後′髟ｷ縺吶℃繧九→縺ｫ蛻�繧願ｩｰ繧√ｋ菴咲ｽｮ
set statusline+=[%n]	"繝舌ャ繝輔ぃ逡ｪ蜿ｷ
set statusline+=%m		" %m 菫ｮ豁｣繝輔Λ繧ｰ
set statusline+=%r		" %r 隱ｭ縺ｿ霎ｼ縺ｿ蟆ら畑繝輔Λ繧ｰ
set statusline+=%h		" %h 繝倥Ν繝励ヰ繝�繝輔ぃ繝輔Λ繧ｰ
set statusline+=%w		" %w 繝励Ξ繝薙Η繝ｼ繧ｦ繧｣繝ｳ繝峨え繝輔Λ繧ｰ
set statusline+=%y		" 繝舌ャ繝輔ぃ蜀�縺ｮ繝輔ぃ繧､繝ｫ縺ｮ繧ｿ繧､繝�
set statusline+=\ 		" 遨ｺ逋ｽ繧ｹ繝壹�ｼ繧ｹ
if winwidth(0)>130
   set statusline+=%F	"繝舌ャ繝輔ぃ蜀�縺ｮ繝輔ぃ繧､繝ｫ縺ｮ繝輔Ν繝代せ
else
   set statusline+=%t	"繝輔ぃ繧､繝ｫ蜷阪�ｮ縺ｿ
endif
set statusline+=%=		"蟾ｦ蟇�縺幃��逶ｮ縺ｨ蜿ｳ蟇�縺幃��逶ｮ縺ｮ蛹ｺ蛻�繧�
set statusline+=\ \ 	"遨ｺ逋ｽ繧ｹ繝壹�ｼ繧ｹ2蛟�
set statusline+=%1l		"菴戊｡檎岼縺ｫ繧ｫ繝ｼ繧ｽ繝ｫ縺後≠繧九°
set statusline+=/		"
set statusline+=%L		"繝舌ャ繝輔ぃ蜀�縺ｮ邱剰｡梧焚
set statusline+=,		"
set statusline+=%c		"菴募�礼岼縺ｫ繧ｫ繝ｼ繧ｽ繝ｫ縺後≠繧九°
set statusline+=%V	 	"逕ｻ髱｢荳翫�ｮ菴募�礼岼縺ｫ繧ｫ繝ｼ繧ｽ繝ｫ縺後≠繧九°
set statusline+=\ \ 	"遨ｺ逋ｽ繧ｹ繝壹�ｼ繧ｹ2蛟�
set statusline+=%P		"繝輔ぃ繧､繝ｫ蜀�縺ｮ菴包ｼ�縺ｮ菴咲ｽｮ縺ｫ縺ゅｋ縺�

set statusline+=%{fugitive#statusline()}

"================================================================
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

"================================================================
filetype on
>>>>>>> 761dcc41007963d6943d07efa715933827ab0983
