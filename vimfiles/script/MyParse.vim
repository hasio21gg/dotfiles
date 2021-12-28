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
"command! CaclParse1A call s:cacl_type1A()
"command! CaclParse1B call s:cacl_type1B()
command! CaclParse2 call s:cacl_type2()
command! ResParse1 call s:cacl_res1()
command! ResParse1Macro call s:cacl_res1_main()

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

function! s:cacl_type1A()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		%s/\(共有名\)\s\+/\1\t/ 
		%s/\(ﾊﾟｽ\)\s\+/\1\t/ 
		%s/\(注釈\)\s\+/\1\t/ 
		%s/\(最大ﾕｰｻﾞｰ数\)\s\+/\1\t/ 
		%s/\(ﾕｰｻﾞｰ名\)\s\+/\1\t/ 
		%g/ｺﾏﾝﾄﾞは正常に終了しました。/d
		%g/^$/d
		try
			%s/\s\{3,\}$\n\s\+/\t/g
		endtry
		try
			%s/\s\{3,\}/\t/g
		endtry
		%s/\n\(ﾊﾟｽ\)/\t\1/
		%s/\n\(注釈\)/\t\1/ 
		%s/\n\(最大ﾕｰｻﾞｰ数\)/\t\1/ 
		%s/\n\(ﾕｰｻﾞｰ名\)/\t\1/
		"execute "%s/^/" . BUFFER_FILE_NAME . "\t/"
		"execute "w ..\out\" . substitute(BUFFER_FILE_NAME,"_NET_SHARE_DETAIL","","g")
		"bd!
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
endfunction

function! s:cacl_type1B()
	let BUFFER_FILE_NAME     = expand("%")
	let SCHEME_NAME          = expand("<cword>")
	echom "[SCHEME_NAME]"      . SCHEME_NAME
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		%s/\(共有名\)\s\+/\1\t/ 
		%s/\(パス\)\s\+/\1\t/ 
		%s/\(注釈\)\s\+/\1\t/ 
		%s/\(最大ユーザー数\)\s\+/\1\t/ 
		%s/\(ユーザー \)\s\+/\1\t/ 
		%g/キャッシュ/d
		%g/コマンドは正常に終了しました。/d
		v/\S/d
		"%g/^$/d
		"try
		"	%s/\s\{3,\}$\n\s\+/\t/g
		"endtry
		"try
		"	%s/\s\{3,\}/\t/g
		"endtry
		%s/\n\(パス\)/\t\1/
		%s/\n\(注釈\)/\t\1/ 
		%s/\n\(最大ユーザー数\)/\t\1/ 
		%s/\n\(ユーザー\)/\t\1/
		"execute "%s/^/" . BUFFER_FILE_NAME . "\t/"
		"execute "w ..\out\" . substitute(BUFFER_FILE_NAME,"_NET_SHARE_DETAIL","","g")
		"bd!
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
endfunction

function! s:cacl_type2()
	let BUFFER_FILE_NAME     = expand("%")
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	try
		"execute "/\. " . SCHEME_NAME
		execute "/^-\\+"
		" 先頭から検索できた位置まで削除する
		g//norm!Vggd
		execute "/コマンドは正常に終了しました"
		" 検索できた位置から末尾まで削除する
		g//norm!VGd
		normal! gg
		%s/\s\+\([C-Zc-z]:\)/\t\1/
		%s/\s\+\(\(Remote IPC\)\s\+\)/\t\2/
		%s/\s\+\(\(Default share\)\s\+\)/\t\2/
		%s/\s\+\(\(Remote Admin\)\s\+\)/\t\2/
		%s/\s\+$//
		%s/^\s\+/\t/
		%s/$\n\t/\t/
		v/\S/d
		sort
		
		let OUTPUTFILE = substitute(BUFFER_FILE_NAME, "NET_SHARE", "CACLS_LIST", "g")
		echom "[OUTPUTFILE]" . OUTPUTFILE
		let inp =  input("ファイル作成しますか?[Y/N]")
		if inp == "Y"
			execute "w! " . OUTPUTFILE
			undo
			bd!
			execute "e " . OUTPUTFILE
		endif
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
endfunction

function! s:cacl_res1_main()
	call s:cacl_res1_macro("20190728_Resource.log")
	call s:cacl_res1_macro("20190729_Resource.log")
	call s:cacl_res1_macro("20190730_Resource.log")
	call s:cacl_res1_macro("20190731_Resource.log")
	call s:cacl_res1_macro("20190801_Resource.log")
	call s:cacl_res1_macro("20190802_Resource.log")
	call s:cacl_res1_macro("20190803_Resource.log")
	call s:cacl_res1_macro("20190804_Resource.log")
	call s:cacl_res1_macro("20190805_Resource.log")
	call s:cacl_res1_macro("20180706_Resource.log")
	call s:cacl_res1_macro("20180707_Resource.log")
	call s:cacl_res1_macro("20180708_Resource.log")
	call s:cacl_res1_macro("20180709_Resource.log")
	call s:cacl_res1_macro("20180710_Resource.log")
	call s:cacl_res1_macro("20180711_Resource.log")
	call s:cacl_res1_macro("20180712_Resource.log")
	call s:cacl_res1_macro("20180713_Resource.log")
	call s:cacl_res1_macro("20180714_Resource.log")
	call s:cacl_res1_macro("20180715_Resource.log")
	call s:cacl_res1_macro("20180716_Resource.log")
	call s:cacl_res1_macro("20180717_Resource.log")
	call s:cacl_res1_macro("20180718_Resource.log")
	call s:cacl_res1_macro("20180719_Resource.log")
	call s:cacl_res1_macro("20180720_Resource.log")
	call s:cacl_res1_macro("20180721_Resource.log")
	call s:cacl_res1_macro("20180722_Resource.log")
	call s:cacl_res1_macro("20180723_Resource.log")
	call s:cacl_res1_macro("20180724_Resource.log")
	call s:cacl_res1_macro("20180725_Resource.log")
	call s:cacl_res1_macro("20180726_Resource.log")
	call s:cacl_res1_macro("20180727_Resource.log")
	call s:cacl_res1_macro("20180728_Resource.log")
	call s:cacl_res1_macro("20180729_Resource.log")
	call s:cacl_res1_macro("20180730_Resource.log")
	call s:cacl_res1_macro("20180731_Resource.log")
	call s:cacl_res1_macro("20180801_Resource.log")
	call s:cacl_res1_macro("20180802_Resource.log")
	call s:cacl_res1_macro("20180803_Resource.log")
	call s:cacl_res1_macro("20180804_Resource.log")
	call s:cacl_res1_macro("20180805_Resource.log")
	call s:cacl_res1_macro("20180806_Resource.log")
	call s:cacl_res1_macro("20180807_Resource.log")
	call s:cacl_res1_macro("20180808_Resource.log")
	call s:cacl_res1_macro("20180809_Resource.log")
	call s:cacl_res1_macro("20180810_Resource.log")
	call s:cacl_res1_macro("20180811_Resource.log")
	call s:cacl_res1_macro("20180812_Resource.log")
	call s:cacl_res1_macro("20180813_Resource.log")
	call s:cacl_res1_macro("20180814_Resource.log")
	call s:cacl_res1_macro("20180815_Resource.log")
	call s:cacl_res1_macro("20180816_Resource.log")
	call s:cacl_res1_macro("20180817_Resource.log")
	call s:cacl_res1_macro("20180818_Resource.log")
	call s:cacl_res1_macro("20180819_Resource.log")
	call s:cacl_res1_macro("20180820_Resource.log")
	call s:cacl_res1_macro("20180821_Resource.log")
	call s:cacl_res1_macro("20180822_Resource.log")
	call s:cacl_res1_macro("20180823_Resource.log")
	call s:cacl_res1_macro("20180824_Resource.log")
	call s:cacl_res1_macro("20180825_Resource.log")
	call s:cacl_res1_macro("20180826_Resource.log")
	call s:cacl_res1_macro("20180827_Resource.log")
	call s:cacl_res1_macro("20180828_Resource.log")
	call s:cacl_res1_macro("20180829_Resource.log")
	call s:cacl_res1_macro("20180830_Resource.log")
	call s:cacl_res1_macro("20180831_Resource.log")
	call s:cacl_res1_macro("20180901_Resource.log")
	call s:cacl_res1_macro("20180902_Resource.log")
	call s:cacl_res1_macro("20180903_Resource.log")
	call s:cacl_res1_macro("20180904_Resource.log")
	call s:cacl_res1_macro("20180905_Resource.log")
	call s:cacl_res1_macro("20180906_Resource.log")
	call s:cacl_res1_macro("20180907_Resource.log")
	call s:cacl_res1_macro("20180908_Resource.log")
	call s:cacl_res1_macro("20180909_Resource.log")
	call s:cacl_res1_macro("20180910_Resource.log")
	call s:cacl_res1_macro("20180911_Resource.log")
	call s:cacl_res1_macro("20180912_Resource.log")
	call s:cacl_res1_macro("20180913_Resource.log")
	call s:cacl_res1_macro("20180914_Resource.log")
	call s:cacl_res1_macro("20180915_Resource.log")
	call s:cacl_res1_macro("20180916_Resource.log")
	call s:cacl_res1_macro("20180917_Resource.log")
	call s:cacl_res1_macro("20180918_Resource.log")
	call s:cacl_res1_macro("20180919_Resource.log")
	call s:cacl_res1_macro("20180920_Resource.log")
	call s:cacl_res1_macro("20180921_Resource.log")
	call s:cacl_res1_macro("20180922_Resource.log")
	call s:cacl_res1_macro("20180923_Resource.log")
	call s:cacl_res1_macro("20180924_Resource.log")
	call s:cacl_res1_macro("20180925_Resource.log")
	call s:cacl_res1_macro("20180926_Resource.log")
	call s:cacl_res1_macro("20180927_Resource.log")
	call s:cacl_res1_macro("20180928_Resource.log")
	call s:cacl_res1_macro("20180929_Resource.log")
	call s:cacl_res1_macro("20180930_Resource.log")
	call s:cacl_res1_macro("20181001_Resource.log")
	call s:cacl_res1_macro("20181002_Resource.log")
	call s:cacl_res1_macro("20181003_Resource.log")
	call s:cacl_res1_macro("20181004_Resource.log")
	call s:cacl_res1_macro("20181005_Resource.log")
	call s:cacl_res1_macro("20181006_Resource.log")
	call s:cacl_res1_macro("20181007_Resource.log")
	call s:cacl_res1_macro("20181008_Resource.log")
	call s:cacl_res1_macro("20181009_Resource.log")
	call s:cacl_res1_macro("20181010_Resource.log")
	call s:cacl_res1_macro("20181011_Resource.log")
	call s:cacl_res1_macro("20181012_Resource.log")
	call s:cacl_res1_macro("20181013_Resource.log")
	call s:cacl_res1_macro("20181014_Resource.log")
	call s:cacl_res1_macro("20181015_Resource.log")
	call s:cacl_res1_macro("20181016_Resource.log")
	call s:cacl_res1_macro("20181017_Resource.log")
	call s:cacl_res1_macro("20181018_Resource.log")
	call s:cacl_res1_macro("20181019_Resource.log")
	call s:cacl_res1_macro("20181020_Resource.log")
	call s:cacl_res1_macro("20181021_Resource.log")
	call s:cacl_res1_macro("20181022_Resource.log")
	call s:cacl_res1_macro("20181023_Resource.log")
	call s:cacl_res1_macro("20181024_Resource.log")
	call s:cacl_res1_macro("20181025_Resource.log")
	call s:cacl_res1_macro("20181026_Resource.log")
	call s:cacl_res1_macro("20181027_Resource.log")
	call s:cacl_res1_macro("20181028_Resource.log")
	call s:cacl_res1_macro("20181029_Resource.log")
	call s:cacl_res1_macro("20181030_Resource.log")
	call s:cacl_res1_macro("20181031_Resource.log")
	call s:cacl_res1_macro("20181101_Resource.log")
	call s:cacl_res1_macro("20181102_Resource.log")
	call s:cacl_res1_macro("20181103_Resource.log")
	call s:cacl_res1_macro("20181104_Resource.log")
	call s:cacl_res1_macro("20181105_Resource.log")
	call s:cacl_res1_macro("20181106_Resource.log")
	call s:cacl_res1_macro("20181107_Resource.log")
	call s:cacl_res1_macro("20181108_Resource.log")
	call s:cacl_res1_macro("20181109_Resource.log")
	call s:cacl_res1_macro("20181110_Resource.log")
	call s:cacl_res1_macro("20181111_Resource.log")
	call s:cacl_res1_macro("20181112_Resource.log")
	call s:cacl_res1_macro("20181113_Resource.log")
	call s:cacl_res1_macro("20181114_Resource.log")
	call s:cacl_res1_macro("20181115_Resource.log")
	call s:cacl_res1_macro("20181116_Resource.log")
	call s:cacl_res1_macro("20181117_Resource.log")
	call s:cacl_res1_macro("20181118_Resource.log")
	call s:cacl_res1_macro("20181119_Resource.log")
	call s:cacl_res1_macro("20181120_Resource.log")
	call s:cacl_res1_macro("20181121_Resource.log")
	call s:cacl_res1_macro("20181122_Resource.log")
	call s:cacl_res1_macro("20181123_Resource.log")
	call s:cacl_res1_macro("20181124_Resource.log")
	call s:cacl_res1_macro("20181125_Resource.log")
	call s:cacl_res1_macro("20181126_Resource.log")
	call s:cacl_res1_macro("20181127_Resource.log")
	call s:cacl_res1_macro("20181128_Resource.log")
	call s:cacl_res1_macro("20181129_Resource.log")
	call s:cacl_res1_macro("20181130_Resource.log")
	call s:cacl_res1_macro("20181201_Resource.log")
	call s:cacl_res1_macro("20181202_Resource.log")
	call s:cacl_res1_macro("20181203_Resource.log")
	call s:cacl_res1_macro("20181204_Resource.log")
	call s:cacl_res1_macro("20181205_Resource.log")
	call s:cacl_res1_macro("20181206_Resource.log")
	call s:cacl_res1_macro("20181207_Resource.log")
	call s:cacl_res1_macro("20181208_Resource.log")
	call s:cacl_res1_macro("20181209_Resource.log")
	call s:cacl_res1_macro("20181210_Resource.log")
	call s:cacl_res1_macro("20181211_Resource.log")
	call s:cacl_res1_macro("20181212_Resource.log")
	call s:cacl_res1_macro("20181213_Resource.log")
	call s:cacl_res1_macro("20181214_Resource.log")
	call s:cacl_res1_macro("20181215_Resource.log")
	call s:cacl_res1_macro("20181216_Resource.log")
	call s:cacl_res1_macro("20181217_Resource.log")
	call s:cacl_res1_macro("20181218_Resource.log")
	call s:cacl_res1_macro("20181219_Resource.log")
	call s:cacl_res1_macro("20181220_Resource.log")
	call s:cacl_res1_macro("20181221_Resource.log")
	call s:cacl_res1_macro("20181222_Resource.log")
	call s:cacl_res1_macro("20181223_Resource.log")
	call s:cacl_res1_macro("20181224_Resource.log")
	call s:cacl_res1_macro("20181225_Resource.log")
	call s:cacl_res1_macro("20181226_Resource.log")
	call s:cacl_res1_macro("20181227_Resource.log")
	call s:cacl_res1_macro("20181228_Resource.log")
	call s:cacl_res1_macro("20181229_Resource.log")
	call s:cacl_res1_macro("20181230_Resource.log")
	call s:cacl_res1_macro("20181231_Resource.log")
	call s:cacl_res1_macro("20190101_Resource.log")
	call s:cacl_res1_macro("20190102_Resource.log")
	call s:cacl_res1_macro("20190103_Resource.log")
	call s:cacl_res1_macro("20190104_Resource.log")
	call s:cacl_res1_macro("20190105_Resource.log")
	call s:cacl_res1_macro("20190106_Resource.log")
	call s:cacl_res1_macro("20190107_Resource.log")
	call s:cacl_res1_macro("20190108_Resource.log")
	call s:cacl_res1_macro("20190109_Resource.log")
	call s:cacl_res1_macro("20190110_Resource.log")
	call s:cacl_res1_macro("20190111_Resource.log")
	call s:cacl_res1_macro("20190112_Resource.log")
	call s:cacl_res1_macro("20190113_Resource.log")
	call s:cacl_res1_macro("20190114_Resource.log")
	call s:cacl_res1_macro("20190115_Resource.log")
	call s:cacl_res1_macro("20190116_Resource.log")
	call s:cacl_res1_macro("20190117_Resource.log")
	call s:cacl_res1_macro("20190118_Resource.log")
	call s:cacl_res1_macro("20190119_Resource.log")
	call s:cacl_res1_macro("20190120_Resource.log")
	call s:cacl_res1_macro("20190121_Resource.log")
	call s:cacl_res1_macro("20190122_Resource.log")
	call s:cacl_res1_macro("20190123_Resource.log")
	call s:cacl_res1_macro("20190124_Resource.log")
	call s:cacl_res1_macro("20190125_Resource.log")
	call s:cacl_res1_macro("20190126_Resource.log")
	call s:cacl_res1_macro("20190127_Resource.log")
	call s:cacl_res1_macro("20190128_Resource.log")
	call s:cacl_res1_macro("20190129_Resource.log")
	call s:cacl_res1_macro("20190130_Resource.log")
	call s:cacl_res1_macro("20190131_Resource.log")
	call s:cacl_res1_macro("20190201_Resource.log")
	call s:cacl_res1_macro("20190202_Resource.log")
	call s:cacl_res1_macro("20190203_Resource.log")
	call s:cacl_res1_macro("20190204_Resource.log")
	call s:cacl_res1_macro("20190205_Resource.log")
	call s:cacl_res1_macro("20190206_Resource.log")
	call s:cacl_res1_macro("20190207_Resource.log")
	call s:cacl_res1_macro("20190208_Resource.log")
	call s:cacl_res1_macro("20190209_Resource.log")
	call s:cacl_res1_macro("20190210_Resource.log")
	call s:cacl_res1_macro("20190211_Resource.log")
	call s:cacl_res1_macro("20190212_Resource.log")
	call s:cacl_res1_macro("20190213_Resource.log")
	call s:cacl_res1_macro("20190214_Resource.log")
	call s:cacl_res1_macro("20190215_Resource.log")
	call s:cacl_res1_macro("20190216_Resource.log")
	call s:cacl_res1_macro("20190217_Resource.log")
	call s:cacl_res1_macro("20190218_Resource.log")
	call s:cacl_res1_macro("20190219_Resource.log")
	call s:cacl_res1_macro("20190220_Resource.log")
	call s:cacl_res1_macro("20190221_Resource.log")
	call s:cacl_res1_macro("20190222_Resource.log")
	call s:cacl_res1_macro("20190223_Resource.log")
	call s:cacl_res1_macro("20190224_Resource.log")
	call s:cacl_res1_macro("20190225_Resource.log")
	call s:cacl_res1_macro("20190226_Resource.log")
	call s:cacl_res1_macro("20190227_Resource.log")
	call s:cacl_res1_macro("20190228_Resource.log")
	call s:cacl_res1_macro("20190301_Resource.log")
	call s:cacl_res1_macro("20190302_Resource.log")
	call s:cacl_res1_macro("20190303_Resource.log")
	call s:cacl_res1_macro("20190304_Resource.log")
	call s:cacl_res1_macro("20190305_Resource.log")
	call s:cacl_res1_macro("20190306_Resource.log")
	call s:cacl_res1_macro("20190307_Resource.log")
	call s:cacl_res1_macro("20190308_Resource.log")
	call s:cacl_res1_macro("20190309_Resource.log")
	call s:cacl_res1_macro("20190310_Resource.log")
	call s:cacl_res1_macro("20190311_Resource.log")
	call s:cacl_res1_macro("20190312_Resource.log")
	call s:cacl_res1_macro("20190313_Resource.log")
	call s:cacl_res1_macro("20190314_Resource.log")
	call s:cacl_res1_macro("20190315_Resource.log")
	call s:cacl_res1_macro("20190316_Resource.log")
	call s:cacl_res1_macro("20190317_Resource.log")
	call s:cacl_res1_macro("20190318_Resource.log")
	call s:cacl_res1_macro("20190319_Resource.log")
	call s:cacl_res1_macro("20190320_Resource.log")
	call s:cacl_res1_macro("20190321_Resource.log")
	call s:cacl_res1_macro("20190322_Resource.log")
	call s:cacl_res1_macro("20190323_Resource.log")
	call s:cacl_res1_macro("20190324_Resource.log")
	call s:cacl_res1_macro("20190325_Resource.log")
	call s:cacl_res1_macro("20190326_Resource.log")
	call s:cacl_res1_macro("20190327_Resource.log")
	call s:cacl_res1_macro("20190328_Resource.log")
	call s:cacl_res1_macro("20190329_Resource.log")
	call s:cacl_res1_macro("20190330_Resource.log")
	call s:cacl_res1_macro("20190331_Resource.log")
	call s:cacl_res1_macro("20190401_Resource.log")
	call s:cacl_res1_macro("20190402_Resource.log")
	call s:cacl_res1_macro("20190403_Resource.log")
	call s:cacl_res1_macro("20190404_Resource.log")
	call s:cacl_res1_macro("20190405_Resource.log")
	call s:cacl_res1_macro("20190406_Resource.log")
	call s:cacl_res1_macro("20190407_Resource.log")
	call s:cacl_res1_macro("20190408_Resource.log")
	call s:cacl_res1_macro("20190409_Resource.log")
	call s:cacl_res1_macro("20190410_Resource.log")
	call s:cacl_res1_macro("20190411_Resource.log")
	call s:cacl_res1_macro("20190412_Resource.log")
	call s:cacl_res1_macro("20190413_Resource.log")
	call s:cacl_res1_macro("20190414_Resource.log")
	call s:cacl_res1_macro("20190415_Resource.log")
	call s:cacl_res1_macro("20190416_Resource.log")
	call s:cacl_res1_macro("20190417_Resource.log")
	call s:cacl_res1_macro("20190418_Resource.log")
	call s:cacl_res1_macro("20190419_Resource.log")
	call s:cacl_res1_macro("20190420_Resource.log")
	call s:cacl_res1_macro("20190421_Resource.log")
	call s:cacl_res1_macro("20190422_Resource.log")
	call s:cacl_res1_macro("20190423_Resource.log")
	call s:cacl_res1_macro("20190424_Resource.log")
	call s:cacl_res1_macro("20190425_Resource.log")
	call s:cacl_res1_macro("20190426_Resource.log")
	call s:cacl_res1_macro("20190427_Resource.log")
	call s:cacl_res1_macro("20190428_Resource.log")
	call s:cacl_res1_macro("20190429_Resource.log")
	call s:cacl_res1_macro("20190430_Resource.log")
	call s:cacl_res1_macro("20190501_Resource.log")
	call s:cacl_res1_macro("20190502_Resource.log")
	call s:cacl_res1_macro("20190503_Resource.log")
	call s:cacl_res1_macro("20190504_Resource.log")
	call s:cacl_res1_macro("20190505_Resource.log")
	call s:cacl_res1_macro("20190506_Resource.log")
	call s:cacl_res1_macro("20190507_Resource.log")
	call s:cacl_res1_macro("20190508_Resource.log")
	call s:cacl_res1_macro("20190509_Resource.log")
	call s:cacl_res1_macro("20190510_Resource.log")
	call s:cacl_res1_macro("20190511_Resource.log")
	call s:cacl_res1_macro("20190512_Resource.log")
	call s:cacl_res1_macro("20190513_Resource.log")
	call s:cacl_res1_macro("20190514_Resource.log")
	call s:cacl_res1_macro("20190515_Resource.log")
	call s:cacl_res1_macro("20190516_Resource.log")
	call s:cacl_res1_macro("20190517_Resource.log")
	call s:cacl_res1_macro("20190518_Resource.log")
	call s:cacl_res1_macro("20190519_Resource.log")
	call s:cacl_res1_macro("20190520_Resource.log")
	call s:cacl_res1_macro("20190521_Resource.log")
	call s:cacl_res1_macro("20190522_Resource.log")
	call s:cacl_res1_macro("20190523_Resource.log")
	call s:cacl_res1_macro("20190524_Resource.log")
	call s:cacl_res1_macro("20190525_Resource.log")
	call s:cacl_res1_macro("20190526_Resource.log")
	call s:cacl_res1_macro("20190527_Resource.log")
	call s:cacl_res1_macro("20190528_Resource.log")
	call s:cacl_res1_macro("20190529_Resource.log")
	call s:cacl_res1_macro("20190530_Resource.log")
	call s:cacl_res1_macro("20190531_Resource.log")
	call s:cacl_res1_macro("20190601_Resource.log")
	call s:cacl_res1_macro("20190602_Resource.log")
	call s:cacl_res1_macro("20190603_Resource.log")
	call s:cacl_res1_macro("20190604_Resource.log")
	call s:cacl_res1_macro("20190605_Resource.log")
	call s:cacl_res1_macro("20190606_Resource.log")
	call s:cacl_res1_macro("20190607_Resource.log")
	call s:cacl_res1_macro("20190608_Resource.log")
	call s:cacl_res1_macro("20190609_Resource.log")
	call s:cacl_res1_macro("20190610_Resource.log")
	call s:cacl_res1_macro("20190611_Resource.log")
	call s:cacl_res1_macro("20190612_Resource.log")
	call s:cacl_res1_macro("20190613_Resource.log")
	call s:cacl_res1_macro("20190614_Resource.log")
	call s:cacl_res1_macro("20190615_Resource.log")
	call s:cacl_res1_macro("20190616_Resource.log")
	call s:cacl_res1_macro("20190617_Resource.log")
	call s:cacl_res1_macro("20190618_Resource.log")
	call s:cacl_res1_macro("20190619_Resource.log")
	call s:cacl_res1_macro("20190620_Resource.log")
	call s:cacl_res1_macro("20190621_Resource.log")
	call s:cacl_res1_macro("20190622_Resource.log")
	call s:cacl_res1_macro("20190623_Resource.log")
	call s:cacl_res1_macro("20190624_Resource.log")
	call s:cacl_res1_macro("20190625_Resource.log")
	call s:cacl_res1_macro("20190626_Resource.log")
	call s:cacl_res1_macro("20190627_Resource.log")
	call s:cacl_res1_macro("20190628_Resource.log")
	call s:cacl_res1_macro("20190629_Resource.log")
	call s:cacl_res1_macro("20190630_Resource.log")
	call s:cacl_res1_macro("20190701_Resource.log")
	call s:cacl_res1_macro("20190702_Resource.log")
	call s:cacl_res1_macro("20190703_Resource.log")
	call s:cacl_res1_macro("20190704_Resource.log")
	call s:cacl_res1_macro("20190705_Resource.log")
	call s:cacl_res1_macro("20190706_Resource.log")
	call s:cacl_res1_macro("20190707_Resource.log")
	call s:cacl_res1_macro("20190708_Resource.log")
	call s:cacl_res1_macro("20190709_Resource.log")
	call s:cacl_res1_macro("20190710_Resource.log")
	call s:cacl_res1_macro("20190711_Resource.log")
	call s:cacl_res1_macro("20190712_Resource.log")
	call s:cacl_res1_macro("20190713_Resource.log")
	call s:cacl_res1_macro("20190714_Resource.log")
	call s:cacl_res1_macro("20190715_Resource.log")
	call s:cacl_res1_macro("20190716_Resource.log")
	call s:cacl_res1_macro("20190717_Resource.log")
	call s:cacl_res1_macro("20190718_Resource.log")
	call s:cacl_res1_macro("20190719_Resource.log")
	call s:cacl_res1_macro("20190720_Resource.log")
	call s:cacl_res1_macro("20190721_Resource.log")
	call s:cacl_res1_macro("20190722_Resource.log")
	call s:cacl_res1_macro("20190723_Resource.log")
	call s:cacl_res1_macro("20190724_Resource.log")
	call s:cacl_res1_macro("20190725_Resource.log")
	call s:cacl_res1_macro("20190726_Resource.log")
	call s:cacl_res1_macro("20190727_Resource.log")
endfunction

function! s:cacl_res1_macro(piFILENAME)
	execute ":e " a:piFILENAME
	call s:cacl_res1()
	execute ":bd!"
endfunction

function! s:cacl_res1()
	let BUFFER_FILE_NAME     = expand("%")
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	let YYYY = strpart(BUFFER_FILE_NAME, 0,4)
	try
		g/^$/d
		g/^-\+/d
		g/^SQL\*Plus/d
		g/^Copyright/d
		g/^Oracle Database/d
		g/^に接続/d
		g/^【.\+】/d
		g/^リソース/d
		g/選択されました/d
		%s/\(TIME\)\n\(\d\d-\d\d \d\d:\d\d:\d\d\)\n/\1\t\2\t/
		%s/\n\(sessions\)/\t\1/
		%v/TIME/d
		%s/\t\{2,\}/\t/g
		%s/ \{2,\}//g
		execute "%s/TIME\t/TIME\t" . YYYY . "-/"
		"
		let BUFFER_FILE_NAME=substitute(BUFFER_FILE_NAME,"Resource.","Resource","")
		execute ":w! txt\\" . BUFFER_FILE_NAME . ".txt"
		u
	catch
		echo v:exception
		echo "Undoします[1]"
		undo
		return
	endtry
endfunction
