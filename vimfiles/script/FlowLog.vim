"--------------------------------------------------------------------------------
"
"
"
"
"--------------------------------------------------------------------------------
let s:save_cpo = &cpo
set cpo&vim

command! FlowLog call s:Flow()
command! FlowMacro call s:FlowMacro()
"--------------------------------------------------------------------------------
" 関数名： Flow
" 機　能： 
"--------------------------------------------------------------------------------
function! s:Flow()
	let BUFFER_FILE_NAME     = expand("%:r")
	let BUFFER_FILE_EXT      = expand("%:e")
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	echom "[BUFFER_FILE_EXT]" . BUFFER_FILE_EXT
	"==================================================
	" 範囲特定処理
	"==================================================
	try
		%s///ge
		%v/フローの実行を開始します/de
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
		%s/^\[\(\d\{4\}\)-\(\d\{2\}\)-\(\d\{2\}\)T\(\d\{2\}:\d\{2\}:\d\{2\}\)\.\(\d\{3\}\) \(JST\)\]/\1\/\2\/\3\t\4\t\5\t\6\t/
		%s/\t\s\(INFO\)\s/\t\1\t/
		%s/\(\S\+\) \,/\1,/e
		%s/ \[\(\S\+\)\,\(\S\+\)*\]\s\+/\1\t\2\t/
		%s/\t\([A-Z0-9]\+_[A-Z]_[0-9]\+\):\s\[\(\S\+\)\]/\t\1\t\2/
		"let BUFFER_FILE_NAME=substitute(BUFFER_FILE_NAME,"FlowService.","FlowService","")
		execute ":w! txt\\" . BUFFER_FILE_EXT . "_" . BUFFER_FILE_NAME . ".txt"
		"undo
	catch
		echo v:exception
		echo "Undoします[2]"
		undo
		return
	endtry
endfunction
"--------------------------------------------------------------------------------
" 関数名： FlowMacro1
" 機　能： 
"--------------------------------------------------------------------------------
function! s:FlowMacro1(piFILENAME)
	execute ":e " a:piFILENAME
	call s:Flow()
	execute ":bd!"
endfunction
"--------------------------------------------------------------------------------
" 関数名： FlowMacro
" 機　能： 
"--------------------------------------------------------------------------------
function! s:FlowMacro()
	call s:FlowMacro1("FlowService.log.2020-10-05")
	call s:FlowMacro1("FlowService.log.2020-08-31")
	call s:FlowMacro1("FlowService.log.2020-09-01")
	call s:FlowMacro1("FlowService.log.2020-09-02")
	call s:FlowMacro1("FlowService.log.2020-09-03")
	call s:FlowMacro1("FlowService.log.2020-09-04")
	call s:FlowMacro1("FlowService.log.2020-09-05")
	call s:FlowMacro1("FlowService.log.2020-09-06")
	call s:FlowMacro1("FlowService.log.2020-09-07")
	call s:FlowMacro1("FlowService.log.2020-09-08")
	call s:FlowMacro1("FlowService.log.2020-09-09")
	call s:FlowMacro1("FlowService.log.2020-09-10")
	call s:FlowMacro1("FlowService.log.2020-09-11")
	call s:FlowMacro1("FlowService.log.2020-09-12")
	call s:FlowMacro1("FlowService.log.2020-09-13")
	call s:FlowMacro1("FlowService.log.2020-09-14")
	call s:FlowMacro1("FlowService.log.2020-09-15")
	call s:FlowMacro1("FlowService.log.2020-09-16")
	call s:FlowMacro1("FlowService.log.2020-09-17")
	call s:FlowMacro1("FlowService.log.2020-09-18")
	call s:FlowMacro1("FlowService.log.2020-09-19")
	call s:FlowMacro1("FlowService.log.2020-09-20")
	call s:FlowMacro1("FlowService.log.2020-09-21")
	call s:FlowMacro1("FlowService.log.2020-09-22")
	call s:FlowMacro1("FlowService.log.2020-09-23")
	call s:FlowMacro1("FlowService.log.2020-09-24")
	call s:FlowMacro1("FlowService.log.2020-09-25")
	call s:FlowMacro1("FlowService.log.2020-09-26")
	call s:FlowMacro1("FlowService.log.2020-09-27")
	call s:FlowMacro1("FlowService.log.2020-09-28")
	call s:FlowMacro1("FlowService.log.2020-09-29")
	call s:FlowMacro1("FlowService.log.2020-09-30")
	call s:FlowMacro1("FlowService.log.2020-10-01")
	call s:FlowMacro1("FlowService.log.2020-10-02")
	call s:FlowMacro1("FlowService.log.2020-10-03")
	call s:FlowMacro1("FlowService.log.2020-10-04")
endfunction

