if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein')
" dein.vim �{��
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim


" �ݒ�J�n
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	" �v���O�C�����X�g�����߂� TOML �t�@�C��
	let g:rc_dir    = expand('~/.vim/rc')
	let s:toml      = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
	" TOML ��ǂݍ��݁A�L���b�V�����Ă���
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
	" �ݒ�I��
	call dein#end()
	call dein#save_state()
endif

" �����A���C���X�g�[�����̂��̂���������C���X�g�[��
if dein#check_install()
	call dein#install()
endif

"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
"call dein#begin(expand('~/.vim/dein'))
"call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/vimproc.vim', {'build': 'make'})
"call dein#add('Shougo/neocomplete.vim')
"call dein#add('Shougo/neomru.vim')
"call dein#add('Shougo/neosnippet')
"call dein#add('fholgado/minibufexpl.vim')
"call dein#end()


" �E�C���h�E�̕�
set columns=130
" �E�C���h�E�̍���
set lines=55
" �R�}���h���C���̍���(GUI�g�p��)
set cmdheight=2

"���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
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
" �o�b�N�A�b�v�t�@�C���̕ۊǐ�
set backupdir=~/vimfiles/Backup
" SWP�t�@�C���̕ۊǐ�
set directory=~/vimfiles/Swaps
" Swap�͎g��Ȃ�
set noswapfile
set tabstop=4
set shiftwidth=4
"�������ɑ啶�����̎�����ʂ��Ȃ�
set ignorecase
"������ɑ啶����������ƌ������ɑ啶������ʂ���
set smartcase
"������Ƀ}�b�`�����P����n�C���C�g����
set hlsearch
"���ʓ��͎��ɑΉ����銇�ʂ���������
"set showmatch
"�s�ԍ���\������
"�t�� set nonumber
set number
"���s��^�u����������
"set list
"�\�����ƂɐF�����\������
syntax on
"[syntax on]�̏ꍇ�A�R�����g���̐F��ύX����
highlight Comment ctermfg=gray
" �V�K�t�@�C������UTF8
" �����t�@�C���͎���
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
"���t����ϐ��Ɋi�[���Ă���
"let $TODAY = strftime('%Y%m%d')
"let $NOW = strftime('%Y%m%d%H%M%S')
"�L�[�}�b�v
" ESC-ESC-ESC �Ō�����n�C���C�g�����Z�b�g
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
set cursorline
let ff_table = {'dos' : 'CR+LF', 'unix' : 'LF', 'mac' : 'CR' }
" �X�e�[�^�X���C��
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
set laststatus=2
set statusline=%<		"�s����������Ƃɐ؂�l�߂�ʒu
set statusline+=[%n]	"�o�b�t�@�ԍ�
set statusline+=%m		" %m �C���t���O
set statusline+=%r		" %r �ǂݍ��ݐ�p�t���O
set statusline+=%h		" %h �w���v�o�b�t�@�t���O
set statusline+=%w		" %w �v���r���[�E�B���h�E�t���O
set statusline+=[%{ff_table[&ff]}]	" %w �v���r���[�E�B���h�E�t���O
set statusline+=[%{&fenc}]	"
set statusline+=%y		" �o�b�t�@���̃t�@�C���̃^�C�v
set statusline+=\ 		" �󔒃X�y�[�X
if winwidth(0)>100
   set statusline+=%F	"�o�b�t�@���̃t�@�C���̃t���p�X
else
   set statusline+=%t	"�t�@�C�����̂�
endif
set statusline+=%=		"���񂹍��ڂƉE�񂹍��ڂ̋�؂�
set statusline+=\ \ 	"�󔒃X�y�[�X2��
set statusline+=%1l		"���s�ڂɃJ�[�\�������邩
set statusline+=/		"
set statusline+=%L		"�o�b�t�@���̑��s��
set statusline+=,		"
set statusline+=%c		"����ڂɃJ�[�\�������邩
set statusline+=%V	 	"��ʏ�̉���ڂɃJ�[�\�������邩
set statusline+=\ \ 	"�󔒃X�y�[�X2��
set statusline+=%P		"�t�@�C�����̉����̈ʒu�ɂ��邩

set statusline+=%{fugitive#statusline()}
""let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

"--------------------------------------------------
" dbext�v���O�C���p
" ���ɍ��킹�ăN���C�A���g�v���O������ύX
" (ver.20.0 ����̓f�t�H���g��sqlite3)
"let g:dbext_default_SQLITE_bin = 'sqlplus'
" �v���t�@�C���̒�`
"let g:dbext_default_profile_MySQL_test = 'type=SQLSRV:integratedlogin=1:dbname=myDB'
"let g:dbext_default_profile_SQLServer_test = 'type=SQLSRV:integratedlogin=1:dbname=myDB'
"let g:dbext_default_profile_SACAS_test = 'type=ORA:srvname=MONOSKJT:user=SACAS:passwd=SACAS00'
"�f�t�H���g�Ŏg�p����v���t�@�C�����w��
"let g:dbext_default_profile = 'SACAS_test'
"-----------------------------
"�@�R�}���h����
" F5 �L�[�ŃR�}���h�������J��
" F6 �L�[�Ō����������J��
nnoremap <F5> <CR>q:
nnoremap <F6> <CR>q/
" q:�Aq/�Aq? �͖�����
nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap q? <NOP>
"-----------------------------
filetype on
