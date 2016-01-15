"--------------------------------------------------
"
"
"
"
"
"--------------------------------------------------
let s:save_cpo = &cpo
set cpo&vim

command! ExpParse1 call s:exp_type1()
command! ExpParse2 call s:exp_type2()
command! ExpParse3 call s:exp_type3()
command! ImpParse1 call s:imp_type1()

"--------------------------------------------------------------------------------
" �֐����F exp_type1
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:exp_type1()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	"
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
	"
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
" �֐����F exp_type2
" �@�@�\�F Oracle Exp.exe���O����͂��e�[�u�����A������TSV�`���ɒu������
"--------------------------------------------------------------------------------
function! s:exp_type2()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = input("SCHEME_NAME ?")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	"
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
	"
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
	"
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
	"
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
	"
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
	"
	"==================================================
	try
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
