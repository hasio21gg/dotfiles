"--------------------------------------------------------------------------------
"
"
"
"
"--------------------------------------------------------------------------------
let s:save_cpo = &cpo
set cpo&vim

command! DatapumpEsti call s:Estimate()

"--------------------------------------------------------------------------------
" �֐����F Estimate
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Estimate()
	let BUFFER_FILE_NAME     = expand("%:r")
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
	try
		%v/\s����.\+\(GB\|MB\|KB\)/d
	catch
		echo v:exception
		echo "Undo���܂�[1]"
		undo
		return
	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================

	" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
	try
		%s/^.  ����//ge
		%s/"//ge
		%s/\s\+/\t/ge
		%s/\t\(\d*\)\.\(\d*\)\t/\t\1_\2\t/ge
		%s/\./\t/ge
		%s/\t\(\d*\)_\(\d*\)\t/\t\1\.\2\t/ge
		%s/\(GB\)$/\1\t3/ge
		%s/\(MB\)$/\1\t2/ge
		%s/\(KB\)$/\1\t1/ge
		let BUFFER_FILE_NAME=substitute(BUFFER_FILE_NAME,"listener.","listener","")
		execute ":w! txt\\" . BUFFER_FILE_NAME . ".txt"
		"undo
	catch
		echo v:exception
		echo "Undo���܂�[2]"
		undo
		return
	endtry
endfunction
