"--------------------------------------------------------------------------------
"
"
"
"
"--------------------------------------------------------------------------------
let s:save_cpo = &cpo
set cpo&vim

command! LogParse1 call s:log_type1()
"--------------------------------------------------------------------------------
" �֐����F exp_type1
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:log_type1()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
	try
		execute "/\. " . SCHEME_NAME
		" �擪���猟���ł����ʒu�܂ō폜����
		g//norm!Vggd
		execute "/\. �V�m�j��"
		" �����ł����ʒu���疖���܂ō폜����
		g//norm!VGd
	catch
		echo v:exception
		echo "Undo���܂�[1]"
		undo
		return
	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	try
s		%s/\.\+\s\+�\//
		%s/���G�N�X�|�[�g��//
		%s/�s�G�N�X�|�[�g����܂����B//
		%s/\s\+/\t/g
		" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" �֐����F exp_type2
" �@�@�\�F Oracle Exp.exe���O����͂��e�[�u�����A������TSV�`���ɒu������
"--------------------------------------------------------------------------------
function! s:exp_type2()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = input("SCHEME_NAME ?")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
	try
		execute "/�w�肳�ꂽ�\���G�N�X�|�[�g"
		" �擪���猟���ł����ʒu�܂ō폜����
		g//norm!Vggd
		execute "/�G�N�X�|�[�g��"
		" �����ł����ʒu���疖���܂ō폜����
		g//norm!VGd
	catch
		echo v:exception
		echo "Undo���܂�[1]"
		undo
		return
	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	try
		%s/\.\+\s\+�\//
		%s/���G�N�X�|�[�g��//
		%s/�s�G�N�X�|�[�g����܂����B//
		%s/\s\+/\t/g
		" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" �֐����F exp_type3
" �@�@�\�F Oracle Exp.exe���O����͂��e�[�u�����A������TSV�`���ɒu������
"--------------------------------------------------------------------------------
function! s:exp_type3()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = input("SCHEME_NAME ?")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME

	let SCHEME_NAME_1          = input("SCHEME_NAME_1 ?")
	let SCHEME_NAME_2          = input("SCHEME_NAME_2 ?")
	echom "[SCHEME_NAME_1]"      . SCHEME_NAME_1
	echom "[SCHEME_NAME_2]"      . SCHEME_NAME_2
	"==================================================
	" �͈͓��菈��
	"==================================================
	try
		execute "/\. " . SCHEME_NAME_1
		" �擪���猟���ł����ʒu�܂ō폜����
		g//norm!Vggd
		execute "/\. " . SCHEME_NAME_2
		" �����ł����ʒu���疖���܂ō폜����
		g//norm!VGd
	catch
		echo v:exception
		echo "Undo���܂�[1]"
		undo
		return
	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	try
		%s/\.\+\s\+�\//
		%s/���G�N�X�|�[�g��//
		%s/�s�G�N�X�|�[�g����܂����B//
		%s/\s\+/\t/g
		" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction


"--------------------------------------------------------------------------------
" �֐����F exp_type4
" �@�@�\�F Oracle Expdp.exe���O����͂��e�[�u�����A������TSV�`���ɒu������
"--------------------------------------------------------------------------------
function! s:exp_type4()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
"	try
"		execute "/\. " . SCHEME_NAME_1
"		" �擪���猟���ł����ʒu�܂ō폜����
"		g//norm!Vggd
"		execute "/\. " . SCHEME_NAME_2
"		" �����ł����ʒu���疖���܂ō폜����
"		g//norm!VGd
"	catch
"		echo v:exception
"		echo "Undo���܂�[1]"
"		undo
"		return
"	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	try
		%v/^.*�s���G�N�X�|�[�g����܂���$/d
		%s/\.\+\s\+\.\+\s\+//
		%s/�s���G�N�X�|�[�g����܂���//
		%s/\d\+\(\.\d*\)*\s\+\(KB\)*\(MB\)*\(GB\)*//
		%s/"\."/\t/g
		%s/"//g
		%s/\s\+/\t/g
		" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^/" . BUFFER_FILE_NAME_R . "\t/"
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" �֐����F exp_type5
" �@�@�\�F Oracle Exp.exe���O����͂��e�[�u�����A������TSV�`���ɒu������
"--------------------------------------------------------------------------------
function! s:exp_type5()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = input("SCHEME_NAME ?")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME

	let SCHEME_NAME_1          = input("SCHEME_NAME_1 ?")
	echom "[SCHEME_NAME_1]"      . SCHEME_NAME_1
	"==================================================
	" �͈͓��菈��
	"==================================================
	try
		execute "/\. " . SCHEME_NAME_1
		" �擪���猟���ł����ʒu�܂ō폜����
		g//norm!Vggd
		execute "/�Q�Ɛ�����������G�N�X�|�[�g��"
		" �����ł����ʒu���疖���܂ō폜����
		g//norm!VGd
	catch
		echo v:exception
		echo "Undo���܂�[1]"
		undo
		return
	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	try
		%s/\.\+\s\+�\//
		%s/���G�N�X�|�[�g��//
		%s/�s�G�N�X�|�[�g����܂����B//
		%s/\s\+/\t/g
		" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" �֐����F imp_type1
" �@�@�\�F Oracle Imp.exe���O����͂��e�[�u�����A������TSV�`���ɒu������
"--------------------------------------------------------------------------------
function! s:imp_type1()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
	try
		execute "/\. " . SCHEME_NAME
		" �擪���猟���ł����ʒu�܂ō폜����
		g//norm!Vggd
		execute "/\�C���|�[�g��"
		" �����ł����ʒu���疖���܂ō폜����
		g//norm!VGd
	catch
		echo v:exception
		echo "Undo���܂�[1]"
		undo
		return
	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	try
		%v/^\.\+\s\+\.\+\s\+�\/d
		%s/\.\+\s\+\.\+\s\+�\//
		%s/���C���|�[�g���Ă��܂�//
		%s/�s�C���|�[�g����܂����B//
		%s/"//g
		%s/\s\+/\t/g
		" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" �֐����F imp_type2
" �@�@�\�F Oracle Impdp.exe���O����͂��e�[�u�����A������TSV�`���ɒu������
"--------------------------------------------------------------------------------
function! s:imp_type2()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	"let SCHEME_NAME          = input("SCHEME_NAME ?")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
"	try
"		execute "/\. " . SCHEME_NAME
"		" �擪���猟���ł����ʒu�܂ō폜����
"		g//norm!Vggd
"		execute "/\�C���|�[�g��"
"		" �����ł����ʒu���疖���܂ō폜����
"		g//norm!VGd
"	catch
"		echo v:exception
"		echo "Undo���܂�[1]"
"		undo
"		return
"	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	try
		%v/^.*�s���C���|�[�g����܂���$/d
		%s/\.\+\s\+\.\+\s\+//
		%s/�s���C���|�[�g����܂���//
		%s/\d\+\(\.\d*\)*\s\+\(KB\)*\(MB\)*\(GB\)*//
		%s/"\."/\t/g
		%s/"//g
		%s/\s\+/\t/g
		" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^/" . BUFFER_FILE_NAME_R . "\t/"
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction

function! s:plm_type1()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
	try
		%g/^\s\+\/\*.\+$/d
	catch
		echo v:exception
		echo "Undo���܂�[1]"
		undo
		return
	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	try
		"50���ڂ̃R�����g
		%s/\(^.\{49\}\)\(\/\*\s*\S\+\(\s*\)\*\/\)\(.\+\)$/\1\2\3/
		"%v/^.*�s���C���|�[�g����܂���$/d
		"%s/\.\+\s\+\.\+\s\+//
		"%s/�s���C���|�[�g����܂���//
		"%s/\d\+\(\.\d*\)*\s\+\(KB\)*\(MB\)*\(GB\)*//
		"%s/"\."/\t/g
		"%s/"//g
		"%s/\s\+/\t/g
		" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		"execute ":%s/^/" . BUFFER_FILE_NAME_R . "\t/"
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction
