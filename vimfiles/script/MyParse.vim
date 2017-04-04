"--------------------------------------------------------------------------------
"
"
"
"
"--------------------------------------------------------------------------------
let s:save_cpo = &cpo
set cpo&vim

command! ExpParse1 call s:exp_type1()
command! ExpParse2 call s:exp_type2()
command! ExpParse3 call s:exp_type3()
command! ExpParse4 call s:exp_type4()
command! ExpParse5 call s:exp_type5()
command! ImpParse1 call s:imp_type1()
command! ImpParse2 call s:imp_type2()
command! PlmParse1 call s:plm_type1()

"--------------------------------------------------------------------------------
" 関数名： exp_type1
" 機　能： 
"--------------------------------------------------------------------------------
function! s:exp_type1()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		execute "/\. " . SCHEME_NAME
		" 先頭から検索できた位置まで削除する
		g//norm!Vggd
		execute "/\. シノニム"
		" 検索できた位置から末尾まで削除する
		g//norm!VGd
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
	"==================================================
	" 解析出力処理
	"==================================================
	try
		%s/\.\+\s\+表//
		%s/をエクスポート中//
		%s/行エクスポートされました。//
		%s/\s\+/\t/g
		" ファイル名を置換挿入するため、\を\\にしておく
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" 関数名： exp_type2
" 機　能： Oracle Exp.exeログを解析しテーブル名、件数のTSV形式に置換する
"--------------------------------------------------------------------------------
function! s:exp_type2()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = input("SCHEME_NAME ?")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		execute "/指定された表をエクスポート"
		" 先頭から検索できた位置まで削除する
		g//norm!Vggd
		execute "/エクスポートは"
		" 検索できた位置から末尾まで削除する
		g//norm!VGd
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
	"==================================================
	" 解析出力処理
	"==================================================
	try
		%s/\.\+\s\+表//
		%s/をエクスポート中//
		%s/行エクスポートされました。//
		%s/\s\+/\t/g
		" ファイル名を置換挿入するため、\を\\にしておく
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" 関数名： exp_type3
" 機　能： Oracle Exp.exeログを解析しテーブル名、件数のTSV形式に置換する
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
	" 範囲特定処理
	"==================================================
	try
		execute "/\. " . SCHEME_NAME_1
		" 先頭から検索できた位置まで削除する
		g//norm!Vggd
		execute "/\. " . SCHEME_NAME_2
		" 検索できた位置から末尾まで削除する
		g//norm!VGd
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
	"==================================================
	" 解析出力処理
	"==================================================
	try
		%s/\.\+\s\+表//
		%s/をエクスポート中//
		%s/行エクスポートされました。//
		%s/\s\+/\t/g
		" ファイル名を置換挿入するため、\を\\にしておく
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction


"--------------------------------------------------------------------------------
" 関数名： exp_type4
" 機　能： Oracle Expdp.exeログを解析しテーブル名、件数のTSV形式に置換する
"--------------------------------------------------------------------------------
function! s:exp_type4()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
"	try
"		execute "/\. " . SCHEME_NAME_1
"		" 先頭から検索できた位置まで削除する
"		g//norm!Vggd
"		execute "/\. " . SCHEME_NAME_2
"		" 検索できた位置から末尾まで削除する
"		g//norm!VGd
"	catch
"		echo v:exception
"		echo "Undoします[1]"
"		undo
"		return
"	endtry
	"==================================================
	" 解析出力処理
	"==================================================
	try
		%v/^.*行がエクスポートされました$/d
		%s/\.\+\s\+\.\+\s\+//
		%s/行がエクスポートされました//
		%s/\d\+\(\.\d*\)*\s\+\(KB\)*\(MB\)*\(GB\)*//
		%s/"\."/\t/g
		%s/"//g
		%s/\s\+/\t/g
		" ファイル名を置換挿入するため、\を\\にしておく
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^/" . BUFFER_FILE_NAME_R . "\t/"
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" 関数名： exp_type5
" 機　能： Oracle Exp.exeログを解析しテーブル名、件数のTSV形式に置換する
"--------------------------------------------------------------------------------
function! s:exp_type5()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = input("SCHEME_NAME ?")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME

	let SCHEME_NAME_1          = input("SCHEME_NAME_1 ?")
	echom "[SCHEME_NAME_1]"      . SCHEME_NAME_1
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		execute "/\. " . SCHEME_NAME_1
		" 先頭から検索できた位置まで削除する
		g//norm!Vggd
		execute "/参照整合性制約をエクスポート中"
		" 検索できた位置から末尾まで削除する
		g//norm!VGd
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
	"==================================================
	" 解析出力処理
	"==================================================
	try
		%s/\.\+\s\+表//
		%s/をエクスポート中//
		%s/行エクスポートされました。//
		%s/\s\+/\t/g
		" ファイル名を置換挿入するため、\を\\にしておく
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" 関数名： imp_type1
" 機　能： Oracle Imp.exeログを解析しテーブル名、件数のTSV形式に置換する
"--------------------------------------------------------------------------------
function! s:imp_type1()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		execute "/\. " . SCHEME_NAME
		" 先頭から検索できた位置まで削除する
		g//norm!Vggd
		execute "/\インポートは"
		" 検索できた位置から末尾まで削除する
		g//norm!VGd
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
	"==================================================
	" 解析出力処理
	"==================================================
	try
		%v/^\.\+\s\+\.\+\s\+表/d
		%s/\.\+\s\+\.\+\s\+表//
		%s/をインポートしています//
		%s/行インポートされました。//
		%s/"//g
		%s/\s\+/\t/g
		" ファイル名を置換挿入するため、\を\\にしておく
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^\t/" . BUFFER_FILE_NAME_R . "\t" . SCHEME_NAME . "\t/"
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction

"--------------------------------------------------------------------------------
" 関数名： imp_type2
" 機　能： Oracle Impdp.exeログを解析しテーブル名、件数のTSV形式に置換する
"--------------------------------------------------------------------------------
function! s:imp_type2()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	"let SCHEME_NAME          = input("SCHEME_NAME ?")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
"	try
"		execute "/\. " . SCHEME_NAME
"		" 先頭から検索できた位置まで削除する
"		g//norm!Vggd
"		execute "/\インポートは"
"		" 検索できた位置から末尾まで削除する
"		g//norm!VGd
"	catch
"		echo v:exception
"		echo "Undoします[1]"
"		undo
"		return
"	endtry
	"==================================================
	" 解析出力処理
	"==================================================
	try
		%v/^.*行がインポートされました$/d
		%s/\.\+\s\+\.\+\s\+//
		%s/行がインポートされました//
		%s/\d\+\(\.\d*\)*\s\+\(KB\)*\(MB\)*\(GB\)*//
		%s/"\."/\t/g
		%s/"//g
		%s/\s\+/\t/g
		" ファイル名を置換挿入するため、\を\\にしておく
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		execute ":%s/^/" . BUFFER_FILE_NAME_R . "\t/"
	catch
		echo v:exception
		echo "Undoします[2]"
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
	" 範囲特定処理
	"==================================================
	try
		%g/^\s\+\/\*.\+$/d
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
	"==================================================
	" 解析出力処理
	"==================================================
	try
		"50桁目のコメント
		%s/\(^.\{49\}\)\(\/\*\s*\S\+\(\s*\)\*\/\)\(.\+\)$/\1\2\3/
		"%v/^.*行がインポートされました$/d
		"%s/\.\+\s\+\.\+\s\+//
		"%s/行がインポートされました//
		"%s/\d\+\(\.\d*\)*\s\+\(KB\)*\(MB\)*\(GB\)*//
		"%s/"\."/\t/g
		"%s/"//g
		"%s/\s\+/\t/g
		" ファイル名を置換挿入するため、\を\\にしておく
		let BUFFER_FILE_NAME_R = substitute(BUFFER_FILE_NAME,'\\', '\\\\', "g")
		"execute ":%s/^/" . BUFFER_FILE_NAME_R . "\t/"
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction
