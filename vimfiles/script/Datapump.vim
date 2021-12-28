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
" 関数名： Estimate
" 機　能： 
"--------------------------------------------------------------------------------
function! s:Estimate()
	let BUFFER_FILE_NAME     = expand("%:r")
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		%v/\s見積.\+\(GB\|MB\|KB\)/d
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
	"==================================================
	" 解析出力処理
	"==================================================

	" ファイル名を置換挿入するため、\を\\にしておく
	try
		%s/^.  見積//ge
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
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction
