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
" ƒEƒCƒ“ƒhƒE‚Ì•
set columns=130
" ƒEƒCƒ“ƒhƒE‚Ì‚‚³
set lines=55
" ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“‚Ì‚‚³(GUIg—p)
set cmdheight=2

"“ü—Íƒ‚[ƒhAƒXƒe[ƒ^ƒXƒ‰ƒCƒ“‚ÌƒJƒ‰[‚ğ•ÏX
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
" ƒoƒbƒNƒAƒbƒvƒtƒ@ƒCƒ‹‚Ì•ÛŠÇæ
set backupdir=~/vimfiles/Backup
" SWPƒtƒ@ƒCƒ‹‚Ì•ÛŠÇæ
set directory=~/vimfiles/Swaps
" Swap‚Íg‚í‚È‚¢
set noswapfile
set tabstop=4
"ŒŸõ‚É‘å•¶š‚±‚Ìš‚ğ‹æ•Ê‚µ‚È‚¢
set ignorecase
"ŒŸõŒê‚É‘å•¶š‚ğ¬‚º‚é‚ÆŒŸõ‚É‘å•¶š‚ğ‹æ•Ê‚·‚é
set smartcase
"ŒŸõŒê‚Éƒ}ƒbƒ`‚µ‚½’PŒê‚ğƒnƒCƒ‰ƒCƒg‚·‚é
set hlsearch
"Š‡ŒÊ“ü—Í‚É‘Î‰‚·‚éŠ‡ŒÊ‚ğ‹­’²‚·‚é
"set showmatch
"s”Ô†‚ğ•\¦‚·‚é
"‹t‚Í set nonumber
set number
"‰üs‚âƒ^ƒu‚ğ‰Â‹‰»‚·‚é
"set list
"\•¶‚²‚Æ‚ÉF•ª‚¯•\¦‚·‚é
syntax on
"[syntax on]‚Ìê‡AƒRƒƒ“ƒg•¶‚ÌF‚ğ•ÏX‚·‚é
highlight Comment ctermfg=gray
" V‹Kƒtƒ@ƒCƒ‹‚ÍUTF8
" Šù‘¶ƒtƒ@ƒCƒ‹‚Í©“®
"if has('win32')
	set encoding=cp932
	set termencoding=cp932
	set fileencoding=utf-8
	set fileencodings=utf-8,cp932
"endif
"“ú•t‚¯‚ğ•Ï”‚ÉŠi”[‚µ‚Ä‚¨‚­
"let $TODAY = strftime('%Y%m%d')
"let $NOW = strftime('%Y%m%d%H%M%S')
"ƒL[ƒ}ƒbƒv
" ESC-ESC-ESC ‚ÅŒŸõŒãƒnƒCƒ‰ƒCƒg‚ğƒŠƒZƒbƒg
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
set cursorline
" ƒXƒe[ƒ^ƒXƒ‰ƒCƒ“
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
set laststatus=2
set statusline=%<		"s‚ª’·‚·‚¬‚é‚Æ‚ÉØ‚è‹l‚ß‚éˆÊ’u
set statusline+=[%n]	"ƒoƒbƒtƒ@”Ô†
set statusline+=%m		" %m C³ƒtƒ‰ƒO
set statusline+=%r		" %r “Ç‚İ‚İê—pƒtƒ‰ƒO
set statusline+=%h		" %h ƒwƒ‹ƒvƒoƒbƒtƒ@ƒtƒ‰ƒO
set statusline+=%w		" %w ƒvƒŒƒrƒ…[ƒEƒBƒ“ƒhƒEƒtƒ‰ƒO
set statusline+=%y		" ƒoƒbƒtƒ@“à‚Ìƒtƒ@ƒCƒ‹‚Ìƒ^ƒCƒv
set statusline+=\ 		" ‹ó”’ƒXƒy[ƒX
if winwidth(0)>130
   set statusline+=%F	"ƒoƒbƒtƒ@“à‚Ìƒtƒ@ƒCƒ‹‚Ìƒtƒ‹ƒpƒX
else
   set statusline+=%t	"ƒtƒ@ƒCƒ‹–¼‚Ì‚İ
endif
set statusline+=%=		"¶Šñ‚¹€–Ú‚Æ‰EŠñ‚¹€–Ú‚Ì‹æØ‚è
set statusline+=\ \ 	"‹ó”’ƒXƒy[ƒX2ŒÂ
set statusline+=%1l		"‰½s–Ú‚ÉƒJ[ƒ\ƒ‹‚ª‚ ‚é‚©
set statusline+=/		"
set statusline+=%L		"ƒoƒbƒtƒ@“à‚Ì‘s”
set statusline+=,		"
set statusline+=%c		"‰½—ñ–Ú‚ÉƒJ[ƒ\ƒ‹‚ª‚ ‚é‚©
set statusline+=%V	 	"‰æ–Êã‚Ì‰½—ñ–Ú‚ÉƒJ[ƒ\ƒ‹‚ª‚ ‚é‚©
set statusline+=\ \ 	"‹ó”’ƒXƒy[ƒX2ŒÂ
set statusline+=%P		"ƒtƒ@ƒCƒ‹“à‚Ì‰½“‚ÌˆÊ’u‚É‚ ‚é‚©

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
" ã‚¦ã‚¤ãƒ³ãƒ‰ã‚¦ã®å¹…
set columns=130
" ã‚¦ã‚¤ãƒ³ãƒ‰ã‚¦ã®é«˜ã•
set lines=55
" ã‚³ãƒãƒ³ãƒ‰ãƒ©ã‚¤ãƒ³ã®é«˜ã•(GUIä½¿ç”¨æ™‚)
set cmdheight=2

"å…¥åŠ›ãƒ¢ãƒ¼ãƒ‰æ™‚ã€ã‚¹ãƒ†ãƒ¼ã‚¿ã‚¹ãƒ©ã‚¤ãƒ³ã®ã‚«ãƒ©ãƒ¼ã‚’å¤‰æ›´
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
" ãƒãƒƒã‚¯ã‚¢ãƒƒãƒ—ãƒ•ã‚¡ã‚¤ãƒ«ã®ä¿ç®¡å…ˆ
set backupdir=~/vimfiles/Backup
" SWPãƒ•ã‚¡ã‚¤ãƒ«ã®ä¿ç®¡å…ˆ
set directory=~/vimfiles/Swaps
" Swapã¯ä½¿ã‚ãªã„
set noswapfile

"ç‰¹æ®Šæ–‡å­—(SpecialKey)ã®è¦‹ãˆã‚‹åŒ–ã€‚listcharsã¯lcsã§ã‚‚è¨­å®šå¯èƒ½ã€‚
""trailã¯è¡Œæœ«ã‚¹ãƒšãƒ¼ã‚¹ã€‚
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<
"
set tabstop=4

"æ¤œç´¢æ™‚ã«å¤§æ–‡å­—ã“ã®å­—ã‚’åŒºåˆ¥ã—ãªã„
set ignorecase

"æ¤œç´¢èªã«å¤§æ–‡å­—ã‚’æ··ãœã‚‹ã¨æ¤œç´¢æ™‚ã«å¤§æ–‡å­—ã‚’åŒºåˆ¥ã™ã‚‹
set smartcase

"æ¤œç´¢èªã«ãƒãƒƒãƒã—ãŸå˜èªã‚’ãƒã‚¤ãƒ©ã‚¤ãƒˆã™ã‚‹
set hlsearch

"æ‹¬å¼§å…¥åŠ›æ™‚ã«å¯¾å¿œã™ã‚‹æ‹¬å¼§ã‚’å¼·èª¿ã™ã‚‹
"set showmatch

"è¡Œç•ªå·ã‚’è¡¨ç¤ºã™ã‚‹
"é€†ã¯ set nonumber
set number

"æ”¹è¡Œã‚„ã‚¿ãƒ–ã‚’å¯è¦–åŒ–ã™ã‚‹
"set list

"æ§‹æ–‡ã”ã¨ã«è‰²åˆ†ã‘è¡¨ç¤ºã™ã‚‹
syntax on

"[syntax on]ã®å ´åˆã€ã‚³ãƒ¡ãƒ³ãƒˆæ–‡ã®è‰²ã‚’å¤‰æ›´ã™ã‚‹
highlight Comment ctermfg=gray

"===========================================================
"ã‚­ãƒ¼ãƒãƒƒãƒ—
" ESC-ESC-ESC ã§æ¤œç´¢å¾Œãƒã‚¤ãƒ©ã‚¤ãƒˆã‚’ãƒªã‚»ãƒƒãƒˆ
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

" sã€€ã‚­ãƒ¼æŠ¼ä¸‹ã‚’ç„¡åŠ¹
nnoremap s <Nop>
" ã‚¦ã‚£ãƒ³ãƒ‰ã‚¦åˆ†å‰²ç§»å‹•
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
" ã‚¦ã‚¤ãƒ³ãƒ‰ã‚¦å…¥æ›¿
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
" ã‚¹ãƒ†ãƒ¼ã‚¿ã‚¹ãƒ©ã‚¤ãƒ³
set laststatus=2
set statusline=%<		"è¡ŒãŒé•·ã™ãã‚‹ã¨ã«åˆ‡ã‚Šè©°ã‚ã‚‹ä½ç½®
set statusline+=[%n]	"ãƒãƒƒãƒ•ã‚¡ç•ªå·
set statusline+=%m		" %m ä¿®æ­£ãƒ•ãƒ©ã‚°
set statusline+=%r		" %r èª­ã¿è¾¼ã¿å°‚ç”¨ãƒ•ãƒ©ã‚°
set statusline+=%h		" %h ãƒ˜ãƒ«ãƒ—ãƒãƒƒãƒ•ã‚¡ãƒ•ãƒ©ã‚°
set statusline+=%w		" %w ãƒ—ãƒ¬ãƒ“ãƒ¥ãƒ¼ã‚¦ã‚£ãƒ³ãƒ‰ã‚¦ãƒ•ãƒ©ã‚°
set statusline+=%y		" ãƒãƒƒãƒ•ã‚¡å†…ã®ãƒ•ã‚¡ã‚¤ãƒ«ã®ã‚¿ã‚¤ãƒ—
set statusline+=\ 		" ç©ºç™½ã‚¹ãƒšãƒ¼ã‚¹
if winwidth(0)>130
   set statusline+=%F	"ãƒãƒƒãƒ•ã‚¡å†…ã®ãƒ•ã‚¡ã‚¤ãƒ«ã®ãƒ•ãƒ«ãƒ‘ã‚¹
else
   set statusline+=%t	"ãƒ•ã‚¡ã‚¤ãƒ«åã®ã¿
endif
set statusline+=%=		"å·¦å¯„ã›é …ç›®ã¨å³å¯„ã›é …ç›®ã®åŒºåˆ‡ã‚Š
set statusline+=\ \ 	"ç©ºç™½ã‚¹ãƒšãƒ¼ã‚¹2å€‹
set statusline+=%1l		"ä½•è¡Œç›®ã«ã‚«ãƒ¼ã‚½ãƒ«ãŒã‚ã‚‹ã‹
set statusline+=/		"
set statusline+=%L		"ãƒãƒƒãƒ•ã‚¡å†…ã®ç·è¡Œæ•°
set statusline+=,		"
set statusline+=%c		"ä½•åˆ—ç›®ã«ã‚«ãƒ¼ã‚½ãƒ«ãŒã‚ã‚‹ã‹
set statusline+=%V	 	"ç”»é¢ä¸Šã®ä½•åˆ—ç›®ã«ã‚«ãƒ¼ã‚½ãƒ«ãŒã‚ã‚‹ã‹
set statusline+=\ \ 	"ç©ºç™½ã‚¹ãƒšãƒ¼ã‚¹2å€‹
set statusline+=%P		"ãƒ•ã‚¡ã‚¤ãƒ«å†…ã®ä½•ï¼…ã®ä½ç½®ã«ã‚ã‚‹ã‹

set statusline+=%{fugitive#statusline()}

"================================================================
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

"================================================================
filetype on
>>>>>>> 761dcc41007963d6943d07efa715933827ab0983
