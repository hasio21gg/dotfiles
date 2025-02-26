"--------------------------------------------------------------------------------
"
"
"
"
"--------------------------------------------------------------------------------
let s:save_cpo = &cpo
set cpo&vim

command! ApacheAccessLog call s:ApacheAccLog()

"--------------------------------------------------------------------------------
" 関数名： ApacheAccLog
" 機　能： 
"--------------------------------------------------------------------------------
function! s:ApacheAccLog()
	let BUFFER_FILE_NAME     = expand("%:r")
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		"
		%v/^\(\d\+\.\)\{3\}\d\+/d
		%g/^\<\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\d\?\)\.\)\{3\}\(25[0-5]\|2[0-4]\d\|[01]\?\d\d\?\)\>,/d
		%g/"\([^"]*\(OPTIONS\|PROPFIND\|HEAD\)[^"]*\)"/d
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
		%s/"\zs[^"]*\ze"/\=substitute(submatch(0), ' ', '\t', 'g')/g
		%s/\s/\t/g
		%s/\(\d\{2\}\/\)JAN/\101/ei
		%s/\(\d\{2\}\/\)FEB/\102/ei
		%s/\(\d\{2\}\/\)MAR/\103/ei
		%s/\(\d\{2\}\/\)APR/\104/ei
		%s/\(\d\{2\}\/\)MAY/\105/ei
		%s/\(\d\{2\}\/\)JUN/\106/ei
		%s/\(\d\{2\}\/\)JUL/\107/ei
		%s/\(\d\{2\}\/\)AUG/\108/ei
		%s/\(\d\{2\}\/\)SEP/\109/ei
		%s/\(\d\{2\}\/\)OCT/\110/ei
		%s/\(\d\{2\}\/\)NOV/\111/ei
		%s/\(\d\{2\}\/\)DEC/\112/ei
		%s/[\[\]]//g
		%s/\(\(\d\d\)\/\(\d\d\)\/\(\d\d\d\d\)\):\(\d\d:\d\d:\d\d\)/\4\/\3\/\2\t\5/
		"%s/^\(\<\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\d\?\)\.\)\{3\}\(25[0-5]\|2[0-4]\d\|[01]\?\d\d\?\)\>\)\t/\1\t\t/
		%s/"\(GET\|POST\)/\1\t"/
		%s/"\zs[^"]*\ze"/\=substitute(submatch(0), 'HTTP\/', 'HTTP_', 'g')/g
		%s/"\zs[^"]*\ze"/\=substitute(submatch(0), '.*\/', '', 'g')/g
		%s/"//g
		"%s/"\zs[^"]*\ze"/\=substitute(submatch(0), '"', '', 'g')/g
		"let BUFFER_FILE_NAME=substitute(BUFFER_FILE_NAME,"listener.","listener","")
		execute ":w! txt\\" . BUFFER_FILE_NAME . ".txt"
		"undo
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction
