"---------------------------------------------------------------------------
" �J���[�ݒ�:
colorscheme koehler
"---------------------------------------------------------------------------
" �t�H���g�ݒ�:
"
if has('win32')
  " Windows�p
  "set guifont=Migu_1M:h9:cSHIFTJIS
  set guifont=Migu_1M:h11:cSHIFTJIS
  "set guifont=Migu_2M:h10:cSHIFTJIS
  "set guifont=Migu_1C:h9:cSHIFTJIS
  "set guifont=MS_Gothic:h10:cSHIFTJIS
  "set guifont=MS_Mincho:h9:cSHIFTJIS
  " �s�Ԋu�̐ݒ�
  set linespace=1
  " �ꕔ��UCS�����̕��������v�����Č��߂�
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka�|����:h14
elseif has('xfontset')
  " UNIX�p (xfontset���g�p)
  set guifontset=a14,r14,k14
endif
"---------------------------------------------------------------------------
" �E�C���h�E�Ɋւ���ݒ�:
"
" �E�C���h�E�̕�
set columns=130
" �E�C���h�E�̍���
set lines=55
" �R�}���h���C���̍���(GUI�g�p��)
set cmdheight=2
" ��ʂ����n�ɔ��ɂ��� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"colorscheme evening " (GUI�g�p��)
" �|�b�v�A�b�v���j���[�̃J���[��ݒ�
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333
set nowrap
"�s�ԍ��\��
set nu
"�S�p�X�y�[�X�����o��
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /�@/
"���X�N���[���o�[���\��
set guioptions+=b
"---------------------------------------------------------------------------
" �L�[����Ɋւ���ݒ�
"CTRL+C���T�|�[�g
source $VIMRUNTIME/mswin.vim
" �o�b�N�A�b�v�t�@�C���̕ۊǐ�
set backupdir=$HOME/vimfiles/Backup
"undof�t�@�C������ӏ��ɂ���
set undodir=$HOME/vimfiles/Undo
"undo�t�@�C�����쐬���Ȃ�
set noundofile
"---------------------------------------------------------------------------
" ���{����͂Ɋւ���ݒ�:
"
if has('multi_byte_ime') || has('xim')
  " IME ON���̃J�[�\���̐F��ݒ�(�ݒ��:��)
  highlight CursorIM guibg=Purple guifg=NONE
  " �}�����[�h�E�������[�h�ł̃f�t�H���g��IME��Ԑݒ�
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIM�̓��͊J�n�L�[��ݒ�:
    " ���L�� s-space ��Shift+Space�̈Ӗ���kinput2+canna�p�ݒ�
    "set imactivatekey=s-space
  endif
  " �}�����[�h�ł�IME��Ԃ��L�������Ȃ��ꍇ�A���s�̃R�����g������
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
if has('win32') || has('win64')
  "�}�����[�h�I������IME��Ԃ�ۑ����Ȃ�
  inoremap <silent> <ESC> <ESC>
  inoremap <silent> <C-[> <ESC>

  "IME���[�h�Œ�
  inoremap <silent> <C-j> <C-^>
endif
"���ꕶ��(SpecialKey)�̌����鉻�Blistchars��lcs�ł��ݒ�\�B
"trail�͍s���X�y�[�X�B
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<
highlight SpecialKey guifg=gray    " GUI�łł̕����F�w��
"highlight SpecialKey guibg=#012345 " GUI�łł̔w�i�F�w��

set tabstop=4
"---------------------------------------------------------------------------
" �}�E�X�Ɋւ���ݒ�:
"
" ���:
" mousefocus�͊�����(���:�E�B���h�E�𕪊����Ă��郉�C���ɃJ�[�\��������
" �Ă��鎞�̋���)������̂Ńf�t�H���g�ł͐ݒ肵�Ȃ��BWindows�ł�mousehide
" ���A�}�E�X�J�[�\����Vim�̃^�C�g���o�[�ɒu�����{�����͂���ƃ`���`������
" �Ƃ������������N���B
"
" �ǂ̃��[�h�ł��}�E�X���g����悤�ɂ���
set mouse=a
" �}�E�X�̈ړ��Ńt�H�[�J�X�������I�ɐؑւ��Ȃ� (mousefocus:�ؑւ�)
set nomousefocus
" ���͎��Ƀ}�E�X�|�C���^���B�� (nomousehide:�B���Ȃ�)
set mousehide
" �r�W���A���I��(D&D��)�������I�ɃN���b�v�{�[�h�� (:help guioptions_a)
"set guioptions+=a
"---------------------------------------------------------------------------
" ���j���[�Ɋւ���ݒ�:
"
" ���:
" "M"�I�v�V�������w�肳�ꂽ�Ƃ��̓��j���[("m")�E�c�[���o�[("T")���ɓo�^����
" �Ȃ��̂ŁA�����I�ɂ����̗̈���폜����悤�ɂ����B����āA�f�t�H���g�̂�
" ���𖳎����ă��[�U���Ǝ��̈ꎮ��o�^�����ꍇ�ɂ́A����炪�\������Ȃ���
" ������肪��������B���������܂�Ƀ��A�ȃP�[�X�ł���ƍl������̂Ŗ�����
" ��B
"
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

"---------------------------------------------------------------------------
" ���̑��A���h���Ɋւ���ݒ�:
"
" ������������n�C���C�g���Ȃ�(_vimrc�ł͂Ȃ�_gvimrc�Őݒ肷��K�v������)
"set nohlsearch

"---------------------------------------------------------------------------
" ����Ɋւ���ݒ�:
"
" ����:
" �����GUI�łȂ��Ă��ł���̂�vimrc�Őݒ肵���ق����ǂ���������Ȃ��B���̕�
" ���Windows�ł͂��Ȃ�B���B��ʓI�Ɉ���ɂ͖����A�ƌ����邱�Ƃ�����炵
" ���̂Ńf�t�H���g�t�H���g�͖����ɂ��Ă����B�S�V�b�N���g�������ꍇ�̓R�����g
" �A�E�g���Ă���printfont���Q�l�ɁB
"
" �Q�l:
"   :hardcopy
"   :help 'printfont'
"
"   :help printing
"
" ����p�t�H���g
if has('printer')
  if has('win32')
    "set printfont=MS_Mincho:h9:cSHIFTJIS
    set printfont=Migu_1M:h7:cSHIFTJIS

set printheader=
set printoptions=

"set printoptions+=header:0  " �w�b�_�[��������Ȃ�
"set printoptions+=header:1  " �w�b�_�[�A�{���ԂɃX�y�[�X���󂯂Ȃ�
set printoptions+=header:2   " �w�b�_�[�A�{���Ԃ�1�s�����

"set printheader=-%N-                                     " -�y�[�W-
"set printheader=%t                                       " �t�@�C����
"set printheader=%F                                       " �t�@�C�����i�p�X�܂ށj
set printheader=%t\ -%N-                                  " �t�@�C���� -�y�[�W-
"set printheader=%{strftime('%Y/%m/%d\ %H:%M')}           " �ŏI�������
"set printheader=�R�c\ ���Y                               " �ŏI�ۑ��ҁA�쐬��
"set printheader=�R�c\ ���Y\ %N\ %{strftime('%Y/%m/%d')}  " �쐬�� �y�[�W ���t
"set printheader=�ЊO��\ %N\ %{strftime('%Y/%m/%d')}      " �ЊO�� �y�[�W ���t

" �w�b�_�[�̈ʒu
let &printheader = &printheader . "%="   " ����
"let &printheader = "%=" . &printheader  " �E��

"---------------------------------------------------------------------------
" ����ݒ�
"---------------------------------------------------------------------------
" �]���X�y�[�X
" [left ��]  [right �E]  [top ��]  [bottom ��]
" [in �C���`]  [pt 1/72�C���`]  [mm �~�����[�g��]  [pc �p���T�C�Y�ɑ΂��銄��]
set printoptions+=left:15mm,right:10mm,top:10mm,bottom:10mm

  endif
endif
" �s�ԍ��t���ň��
set printoptions=number:y
" �s�ԍ������ň��
"set printoptions=number:n
" Copyright (C) 2007 KaoriYa/MURAOKA Taro

"�V���^�b�N�X�ǉ�
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

"�o�b�t�@�ꗗ���g�b�v�ɕ\������
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
let g:airline_left_sep = '��'
"let g:airline_left_sep = '?'
let g:airline_right_sep = '��'
"let g:airline_right_sep = '?'
"let g:airline_symbols.crypt = '??'
"let g:airline_symbols.linenr = '?'
"let g:airline_symbols.linenr = '?'
"let g:airline_symbols.linenr = '?'
let g:airline_symbols.linenr = '��'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '?'
"let g:airline_symbols.branch = '?'
"let g:airline_symbols.paste = '��'
"let g:airline_symbols.paste = 'T'
"let g:airline_symbols.paste = '�a'
"let g:airline_symbols.spell = '?'
"let g:airline_symbols.notexists = '?'
let g:airline_symbols.whitespace = '��'

"TAGS
set tags=.tags;
"ESC-ESC-ESC
nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>

"SHIFT+F1 �J���Ă���t�@�C�����G�N�X�v���[���ŊJ��
map <S-F1> :silent ! start %:h<CR>

"vim-lsp
"LSP��Lint�@�\�𖳌��ɂ���I�v�V����
let g:lsp_diagnostics_enabled = 0
" debug
" ���O�o�͗p�̐ݒ�
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

" ����R�}���h��
:source $HOME\vimfiles\script\MyParse.vim
:source $HOME\vimfiles\script\Listener.vim
:source $HOME\vimfiles\script\FlowLog.vim
:source $HOME\vimfiles\script\Datapump.vim
:source $HOME\vimfiles\script\FTPLog.vim

