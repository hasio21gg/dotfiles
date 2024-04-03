"---------------------------------------------------------------------------
" カラー設定:
colorscheme koehler
"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  " Windows用
  "set guifont=Migu_1M:h9:cSHIFTJIS
  set guifont=Migu_1M:h12:cSHIFTJIS
  "set guifont=Migu_2M:h10:cSHIFTJIS
  "set guifont=Migu_1C:h9:cSHIFTJIS
  "set guifont=MS_Gothic:h10:cSHIFTJIS
  "set guifont=MS_Mincho:h9:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif
"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" ウインドウの幅
set columns=130
" ウインドウの高さ
set lines=55
" コマンドラインの高さ(GUI使用時)
set cmdheight=2
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (GUI使用時)
" ポップアップメニューのカラーを設定
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333
set nowrap
"行番号表示
set nu
"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
"横スクロールバーが表示
set guioptions+=b
"---------------------------------------------------------------------------
" キー操作に関する設定
"CTRL+Cをサポート
source $VIMRUNTIME/mswin.vim
" バックアップファイルの保管先
set backupdir=$HOME/vimfiles/Backup
"undofファイルを一箇所にする
set undodir=$HOME/vimfiles/Undo
"undoファイルを作成しない
set noundofile
"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
if has('win32') || has('win64')
  "挿入モード終了時にIME状態を保存しない
  inoremap <silent> <ESC> <ESC>
  inoremap <silent> <C-[> <ESC>

  "IMEモード固定
  inoremap <silent> <C-j> <C-^>
endif
"特殊文字(SpecialKey)の見える化。listcharsはlcsでも設定可能。
"trailは行末スペース。
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<
highlight SpecialKey guifg=gray    " GUI版での文字色指定
"highlight SpecialKey guibg=#012345 " GUI版での背景色指定

set tabstop=4
"---------------------------------------------------------------------------
" マウスに関する設定:
"
" 解説:
" mousefocusは幾つか問題(一例:ウィンドウを分割しているラインにカーソルがあっ
" ている時の挙動)があるのでデフォルトでは設定しない。Windowsではmousehide
" が、マウスカーソルをVimのタイトルバーに置き日本語を入力するとチラチラする
" という問題を引き起す。
"
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a
"---------------------------------------------------------------------------
" メニューに関する設定:
"
" 解説:
" "M"オプションが指定されたときはメニュー("m")・ツールバー("T")供に登録され
" ないので、自動的にそれらの領域を削除するようにした。よって、デフォルトのそ
" れらを無視してユーザが独自の一式を登録した場合には、それらが表示されないと
" いう問題が生じ得る。しかしあまりにレアなケースであると考えられるので無視す
" る。
"
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

"---------------------------------------------------------------------------
" その他、見栄えに関する設定:
"
" 検索文字列をハイライトしない(_vimrcではなく_gvimrcで設定する必要がある)
"set nohlsearch

"---------------------------------------------------------------------------
" 印刷に関する設定:
"
" 注釈:
" 印刷はGUIでなくてもできるのでvimrcで設定したほうが良いかもしれない。この辺
" りはWindowsではかなり曖昧。一般的に印刷には明朝、と言われることがあるらし
" いのでデフォルトフォントは明朝にしておく。ゴシックを使いたい場合はコメント
" アウトしてあるprintfontを参考に。
"
" 参考:
"   :hardcopy
"   :help 'printfont'
"
"   :help printing
"
" 印刷用フォント
if has('printer')
  if has('win32')
    "set printfont=MS_Mincho:h9:cSHIFTJIS
    set printfont=Migu_1M:h7:cSHIFTJIS

set printheader=
set printoptions=

"set printoptions+=header:0  " ヘッダーを印刷しない
"set printoptions+=header:1  " ヘッダー、本文間にスペースを空けない
set printoptions+=header:2   " ヘッダー、本文間に1行入れる

"set printheader=-%N-                                     " -ページ-
"set printheader=%t                                       " ファイル名
"set printheader=%F                                       " ファイル名（パス含む）
set printheader=%t\ -%N-                                  " ファイル名 -ページ-
"set printheader=%{strftime('%Y/%m/%d\ %H:%M')}           " 最終印刷日時
"set printheader=山田\ 太郎                               " 最終保存者、作成者
"set printheader=山田\ 太郎\ %N\ %{strftime('%Y/%m/%d')}  " 作成者 ページ 日付
"set printheader=社外秘\ %N\ %{strftime('%Y/%m/%d')}      " 社外秘 ページ 日付

" ヘッダーの位置
let &printheader = &printheader . "%="   " 左寄せ
"let &printheader = "%=" . &printheader  " 右寄せ

"---------------------------------------------------------------------------
" 印刷設定
"---------------------------------------------------------------------------
" 余白スペース
" [left 左]  [right 右]  [top 上]  [bottom 下]
" [in インチ]  [pt 1/72インチ]  [mm ミリメートル]  [pc 用紙サイズに対する割合]
set printoptions+=left:15mm,right:10mm,top:10mm,bottom:10mm

  endif
endif
" 行番号付きで印刷
set printoptions=number:y
" 行番号無しで印刷
"set printoptions=number:n
" Copyright (C) 2007 KaoriYa/MURAOKA Taro

"シンタックス追加
"SQL:*.prc,*.tst
augroup filetypedetect
  au! BufRead,BufNewFile *.prc setfiletype plsql
  au! BufRead,BufNewFile *.fnc setfiletype plsql
  au! BufRead,BufNewFile *.pdc setfiletype sqloracle
  au! BufRead,BufNewFile *.pck setfiletype plsql
  au! BufRead,BufNewFile *.bdy setfiletype plsql
  au! BufRead,BufNewFile *.tst setfiletype sqloracle
  au! BufRead,BufNewFile *.ctl setfiletype sqloracle
  au! BufRead,BufNewFile *.yml setfiletype ansible
  au! BufRead,BufNewFile *.yaml setfiletype ansible
augroup END

"バッファ一覧をトップに表示する
":let g:miniBufExplMapWindowNavVim = 1
":let g:miniBufExplMapWindowNavArrows = 1
":let g:miniBufExplMapCTabSwitchBuffs = 1
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
"let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '≫'
"let g:airline_left_sep = '?'
let g:airline_right_sep = '≪'
"let g:airline_right_sep = '?'
"let g:airline_symbols.crypt = '??'
"let g:airline_symbols.linenr = '?'
"let g:airline_symbols.linenr = '?'
"let g:airline_symbols.linenr = '?'
let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '?'
"let g:airline_symbols.branch = '?'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'T'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = '?'
"let g:airline_symbols.notexists = '?'
let g:airline_symbols.whitespace = 'Ξ'

"TAGS
set tags=.tags;
"ESC-ESC-ESC
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>

"SHIFT+F1 開いているファイルをエクスプローラで開く
map <S-F1> :silent ! start %:h<CR>

"vim-lsp
"LSPのLint機能を無効にするオプション
let g:lsp_diagnostics_enabled = 0
" debug
" ログ出力用の設定
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

"LSP Python
""if executable('pyls')
""    au User lsp_setup call lsp#register_server({
""        \ 'name': 'pyls',
""        \ 'cmd': {server_info->['pyls']},
""        \ 'whitelist': ['python'],
""        \ })
""endif

" 自作コマンド類
:source $HOME\vimfiles\script\MyParse.vim
:source $HOME\vimfiles\script\Listener.vim
:source $HOME\vimfiles\script\FlowLog.vim
:source $HOME\vimfiles\script\Datapump.vim
:source $HOME\vimfiles\script\FTPLog.vim

