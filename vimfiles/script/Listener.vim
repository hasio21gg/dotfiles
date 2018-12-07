"--------------------------------------------------------------------------------
"
"
"
"
"--------------------------------------------------------------------------------
let s:save_cpo = &cpo
set cpo&vim

command! Test call s:Test()
command! ListenerOra9 call s:Ora9Proc1()
command! ListenerOra11 call s:Ora11()
command! ListenerOra9Macro call s:Ora9Macro()
command! ListenerOra11Macro call s:Ora11Macro()
command! ListenerOra9Macro2 call s:Ora9Macro2()
command! ListenerOra9Macro3 call s:Ora9Macro3()

"--------------------------------------------------------------------------------
" �֐����F Ora9
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora9(YYYY, MM)
	let BUFFER_FILE_NAME     = expand("%:r")
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
"	let inp =  input("1)�ꊇ�u�����܂�?[Y/N]")
	let cnt = 0
	"let MM   = input("��")
	"let YYYY = input("�N")
	let MM   = a:MM
	let YYYY = a:YYYY
	echom YYYY . "�N" . MM . "��"
	let TMP0FILE = "tmp0_" . YYYY . MM . "_" . BUFFER_FILE_NAME . ".txt"
	let TMP1FILE = "tmp1_" . YYYY . MM . "_" . BUFFER_FILE_NAME . ".txt"
	let OUT1FILE = YYYY . MM . "_" . BUFFER_FILE_NAME . ".txt"
	let OUT2FILE = YYYY . MM . "_" . BUFFER_FILE_NAME . ".2.txt"

	let MM = substitute(MM, "01", "JAN" ,"g")
	let MM = substitute(MM, "02", "FEB" ,"g")
	let MM = substitute(MM, "03", "MAR" ,"g")
	let MM = substitute(MM, "04", "APR" ,"g")
	let MM = substitute(MM, "05", "MAY" ,"g")
	let MM = substitute(MM, "06", "JUN" ,"g")
	let MM = substitute(MM, "07", "JUL" ,"g")
	let MM = substitute(MM, "08", "AUG" ,"g")
	let MM = substitute(MM, "09", "SEP" ,"g")
	let MM = substitute(MM, "10", "OCT" ,"g")
	let MM = substitute(MM, "11", "NOV" ,"g")
	let MM = substitute(MM, "12", "DEC" ,"g")

	execute ":redir! > " . TMP0FILE
	execute ":redir! >> " . TMP0FILE
	for line in readfile(expand("%"))
		let cnt = cnt + 1
		if line =~ "^\\d\\d-" . MM . "-" . YYYY
			silent! echon line . "\r\n"
		endif
	endfor
	redir END
"	if inp == "Y"
		execute ":e! " . TMP0FILE
		try
			"%g/(HOST=\(\d\{,3\}\.\)\{3\}\d\{,3\})/d
			%g/^���X�j���O/d
			%v/(HOST=\(\d\{,3\}\.\)\{3\}\d\{,3\})/d
			execute ":w " . TMP1FILE
			execute ":e! " . TMP1FILE
		catch
			echo v:exception
			echo "Undo���܂�[1]"
			undo
			return
		endtry
"	endif
	"==================================================
	" ��͏o�͏���
	"==================================================
"	let inp =  input("2)�ꊇ�u�����܂�?[Y/N]")
"	if inp == "Y"
		" Ora8 ��2000�N�\�L���Ȃ�
		%s/\v^(\d{2}-)((JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)-)(\d{2}) /\1\220\4 /e
		:w
		%s/^\(\d\{2\}-\)JAN/\101/e
		%s/^\(\d\{2\}-\)FEB/\102/e
		%s/^\(\d\{2\}-\)MAR/\103/e
		%s/^\(\d\{2\}-\)APR/\104/e
		%s/^\(\d\{2\}-\)MAY/\105/e
		%s/^\(\d\{2\}-\)JUN/\106/e
		%s/^\(\d\{2\}-\)JUL/\107/e
		%s/^\(\d\{2\}-\)AUG/\108/e
		%s/^\(\d\{2\}-\)SEP/\109/e
		%s/^\(\d\{2\}-\)OCT/\110/e
		%s/^\(\d\{2\}-\)NOV/\111/e
		%s/^\(\d\{2\}-\)DEC/\112/e
		
		execute ":w! " . OUT1FILE
		execute ":e! " . OUT1FILE

		try
			%s/^\(\d\{2\}\)-\(\d\{2\}\)-\(\d\{4\}\)\s\(\d\{2\}:\d\{2\}:\d\{2\}\) \* /\3\/\2\/\1@\4\t\3\/\2\/\1\t\4\t/e
			%s/[()]/ /ge
			%s/ \* / /ge
			"%s/Program Files/Program_Files/ge
			"%s/Microsoft Office/Microsoft_Office/ge
			"%s/SQL Developer/SQL_Developer/ge
			%s/JDBC Thin Client/JDBC_Thin_Client/ge
			%s/\v(\\*)(\w+) (\w+)(\\*)/\1\2_\3\4/ge
			%s/\(Microsoft_SQL\) \(Server\)/\1_\2/ge
			%s/CONNECT_DATA=//e
			%s/ CID= //e
			%s/ PORT=\w\+ //e
			%s/establish.\+$//e
			%s/SERVER=\w\+ //e
			%s/ADDRESS= PROTOCOL=tcp //e
			%s/ \+/\t/ge
			%s/\t\+/\t/ge
			%s/\v(HOST\=(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}))/\1\t\2/e
			%s/\(PROGRAM=\)\t/\1NULL\t/e
			%s/\t\(PROGRAM=\w\+\)\(.\+\t\)\(SERVICE_NAME=\w\+\t\)/\t\3\1\2/ei
			"execute ":w! " . OUT2FILE
			"execute ":e! " . OUT2FILE
			%s/SID=//e
			%s/SERVICE_NAME=//ei
			%s/PROGRAM=//e
			%s/HOST=//ge
			%s/USER=//e
			%s/@/ /e
		catch
			echo v:exception
			echo "Undo���܂�[2]"
			undo
			return
		endtry
		execute "w! " . OUT1FILE
		execute ":e! " . OUT1FILE
		execute ":bd " . TMP0FILE
		execute ":bd " . TMP1FILE
		execute ":bd " . OUT1FILE
"	endif
call delete(TMP0FILE)
call delete(TMP1FILE)

endfunction
function LParse001(BASEFILE, SAVEFILE, YYYY)

		let inp =  input("3)�w��N���o���܂���?[Y/N]")
	if inp == "Y"
		let YYYY = ""
		let BASEFILE = BUFFER_FILE_NAME . ".tmp2.txt"
		while YYYY != "Q"
			let YYYY =  input("�N ?[nnnn or Q]")
			let SAVEFILE = BUFFER_FILE_NAME . "." . YYYY . ".txt"
		
			if YYYY != "Q"
			" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
				call LParse001(BASEFILE, SAVEFILE, YYYY)
			endif
		endwhile
		execute ":e! " . BUFFER_FILE_NAME . ".tmp2.txt"
	endif

	execute ":e! " . a:BASEFILE
	"execute "%v/\\d\\{2\\}-\\d\\{2\\}-" . a:YYYY ."/d"
	execute "%v/^" .  a:YYYY  . "/d"
	execute ":w! " . a:SAVEFILE
endfunction
"--------------------------------------------------------------------------------
" �֐����F Ora11
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora11()
	let BUFFER_FILE_NAME     = expand("%:r")
	echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
	"==================================================
	" �͈͓��菈��
	"==================================================
	try
		"%g/(HOST=\(\d\{,3\}\.\)\{3\}\d\{,3\})/d
		"%g/���X�j���O���Ă��܂�/de
		%v/(HOST=\(\d\{,3\}\.\)\{3\}\d\{,3\})/d
	catch
		echo v:exception
		echo "Undo���܂�[1]"
		undo
		return
	endtry
	"==================================================
	" ��͏o�͏���
	"==================================================
	%s/^\(\d\{2\}-\)1. /\101/e
	%s/^\(\d\{2\}-\)2. /\102/e
	%s/^\(\d\{2\}-\)3. /\103/e
	%s/^\(\d\{2\}-\)4. /\104/e
	%s/^\(\d\{2\}-\)5. /\105/e
	%s/^\(\d\{2\}-\)6. /\106/e
	%s/^\(\d\{2\}-\)7. /\107/e
	%s/^\(\d\{2\}-\)8. /\108/e
	%s/^\(\d\{2\}-\)9. /\109/e
	%s/^\(\d\{2\}-\)10. /\110/e
	%s/^\(\d\{2\}-\)11. /\111/e
	%s/^\(\d\{2\}-\)12. /\112/e
	" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
	try
		%s/^\(\d\{2\}\)-\(\d\{2\}\)-\(\d\{4\}\)\s\(\d\{2\}:\d\{2\}:\d\{2\}\) \* /\3\/\2\/\1\t\4\t/e
		%s/[()]/ /ge
		%s/ \* / /ge
		"%s/Program Files/Program_Files/ge
		"%s/Microsoft Office/Microsoft_Office/ge
		"%s/SQL Developer/SQL_Developer/ge
		%s/\v(\\*)(\w+) (\w+)(\\*)/\1\2_\3\4/ge
		%s/JDBC.Thin.Client/JDBC_Thin_Client/ge
		%s/CONNECT_DATA=//e
		%s/ CID= //e
		%s/ PORT=\w\+ //e
		%s/establish.\+$//e
		%s/SERVER=\w\+ //e
		%s/ADDRESS= PROTOCOL=tcp //e
		%s/ \+/\t/ge
		%s/\t\+/\t/ge
		%s/\v(HOST\=(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}))/\1\t\2/e
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
"--------------------------------------------------------------------------------
" �֐����F Ora9Macro1
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora9Macro1(piFILENAME)
	execute ":e " a:piFILENAME
	call s:Ora9()
	execute ":bd!"
endfunction
"--------------------------------------------------------------------------------
" �֐����F Ora11Macro1
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora11Macro1(piFILENAME)
	execute ":e " a:piFILENAME
	call s:Ora11()
	execute ":bd!"
endfunction
"--------------------------------------------------------------------------------
" �֐����F Ora9Macro
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora9Macro()
	call s:Ora9Macro1("20150906_listener.log")
	call s:Ora9Macro1("20150913_listener.log")
	call s:Ora9Macro1("20150920_listener.log")
	call s:Ora9Macro1("20150927_listener.log")
	call s:Ora9Macro1("20151004_listener.log")
	call s:Ora9Macro1("20151011_listener.log")
	call s:Ora9Macro1("20151018_listener.log")
	call s:Ora9Macro1("20151025_listener.log")
	call s:Ora9Macro1("20151101_listener.log")
	call s:Ora9Macro1("20151108_listener.log")
	call s:Ora9Macro1("20151115_listener.log")
	call s:Ora9Macro1("20151122_listener.log")
	call s:Ora9Macro1("20151129_listener.log")
	call s:Ora9Macro1("20151206_listener.log")
	call s:Ora9Macro1("20151213_listener.log")
	call s:Ora9Macro1("20151220_listener.log")
	call s:Ora9Macro1("20151227_listener.log")
	call s:Ora9Macro1("20160103_listener.log")
	call s:Ora9Macro1("20160110_listener.log")
	call s:Ora9Macro1("20160117_listener.log")
	call s:Ora9Macro1("20160124_listener.log")
	call s:Ora9Macro1("20160131_listener.log")
	call s:Ora9Macro1("20160207_listener.log")
	call s:Ora9Macro1("listener.log")
endfunction
"--------------------------------------------------------------------------------
" �֐����F Ora9Macro2
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora9Macro2()
	call s:Ora9Macro1("x00.txt")
	call s:Ora9Macro1("x01.txt")
	call s:Ora9Macro1("x02.txt")
	call s:Ora9Macro1("x03.txt")
	call s:Ora9Macro1("x04.txt")
	call s:Ora9Macro1("x05.txt")
	call s:Ora9Macro1("x06.txt")
	call s:Ora9Macro1("x07.txt")
	call s:Ora9Macro1("x08.txt")
	call s:Ora9Macro1("x09.txt")
	call s:Ora9Macro1("x10.txt")
	call s:Ora9Macro1("x11.txt")
	call s:Ora9Macro1("x12.txt")
	call s:Ora9Macro1("x13.txt")
	call s:Ora9Macro1("x14.txt")
	call s:Ora9Macro1("x15.txt")
	call s:Ora9Macro1("x16.txt")
	call s:Ora9Macro1("x17.txt")
	call s:Ora9Macro1("x18.txt")
	call s:Ora9Macro1("x19.txt")
	call s:Ora9Macro1("x20.txt")
	call s:Ora9Macro1("x21.txt")
	call s:Ora9Macro1("x22.txt")
	call s:Ora9Macro1("x23.txt")
	call s:Ora9Macro1("x24.txt")
	call s:Ora9Macro1("x25.txt")
	call s:Ora9Macro1("x26.txt")
	call s:Ora9Macro1("x27.txt")
	call s:Ora9Macro1("x28.txt")
	call s:Ora9Macro1("x29.txt")
	call s:Ora9Macro1("x30.txt")
	call s:Ora9Macro1("x31.txt")
	call s:Ora9Macro1("x32.txt")
endfunction
"--------------------------------------------------------------------------------
" �֐����F Ora9Macro3
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora9Macro3()
"	call s:Ora9Macro1("x00.txt")
"	call s:Ora9Macro1("x01.txt")
"	call s:Ora9Macro1("x02.txt")
"	call s:Ora9Macro1("x03.txt")
"	call s:Ora9Macro1("x04.txt")
"	call s:Ora9Macro1("x05.txt")
"	call s:Ora9Macro1("x06.txt")
"	call s:Ora9Macro1("x07.txt")
"	call s:Ora9Macro1("x08.txt")
"	call s:Ora9Macro1("x09.txt")
"	call s:Ora9Macro1("x10.txt")
"	call s:Ora9Macro1("x11.txt")
"	call s:Ora9Macro1("x12.txt")
"	call s:Ora9Macro1("x13.txt")
"	call s:Ora9Macro1("x14.txt")
"	call s:Ora9Macro1("x15.txt")
"	call s:Ora9Macro1("x16.txt")
"	call s:Ora9Macro1("x17.txt")
"	call s:Ora9Macro1("x18.txt")
"	call s:Ora9Macro1("x19.txt")
"	call s:Ora9Macro1("x20.txt")
"	call s:Ora9Macro1("x21.txt")
"	call s:Ora9Macro1("x22.txt")
"	call s:Ora9Macro1("x23.txt")
"	call s:Ora9Macro1("x24.txt")
"	call s:Ora9Macro1("x25.txt")
"	call s:Ora9Macro1("x26.txt")
"	call s:Ora9Macro1("x27.txt")
"	call s:Ora9Macro1("x28.txt")
"	call s:Ora9Macro1("x29.txt")
"	call s:Ora9Macro1("x30.txt")
"	call s:Ora9Macro1("x31.txt")
"	call s:Ora9Macro1("x32.txt")
"	call s:Ora9Macro1("x33.txt")
"	call s:Ora9Macro1("x34.txt")
"	call s:Ora9Macro1("x35.txt")
"	call s:Ora9Macro1("x36.txt")
"	call s:Ora9Macro1("x37.txt")
"	call s:Ora9Macro1("x38.txt")
	call s:Ora9Macro1("x39.txt")
	call s:Ora9Macro1("x40.txt")
	call s:Ora9Macro1("x41.txt")
	call s:Ora9Macro1("x42.txt")
	call s:Ora9Macro1("x43.txt")
	call s:Ora9Macro1("x44.txt")
	call s:Ora9Macro1("x45.txt")
	call s:Ora9Macro1("x46.txt")
	call s:Ora9Macro1("x47.txt")
	call s:Ora9Macro1("x48.txt")
	call s:Ora9Macro1("x49.txt")
	call s:Ora9Macro1("x50.txt")
	call s:Ora9Macro1("x51.txt")
	call s:Ora9Macro1("x52.txt")
	call s:Ora9Macro1("x53.txt")
endfunction
"--------------------------------------------------------------------------------
" �֐����F Ora11Macro
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora11Macro()
	call s:Ora11Macro1("listener.20160102.log")
	call s:Ora11Macro1("listener.20160103.log")
	call s:Ora11Macro1("listener.20160104.log")
	call s:Ora11Macro1("listener.20160105.log")
	call s:Ora11Macro1("listener.20160106.log")
	call s:Ora11Macro1("listener.20160107.log")
	call s:Ora11Macro1("listener.20160108.log")
	call s:Ora11Macro1("listener.20160109.log")
	call s:Ora11Macro1("listener.20160110.log")
	call s:Ora11Macro1("listener.20160111.log")
	call s:Ora11Macro1("listener.20160112.log")
	call s:Ora11Macro1("listener.20160113.log")
	call s:Ora11Macro1("listener.20160114.log")
	call s:Ora11Macro1("listener.20160115.log")
	call s:Ora11Macro1("listener.20160116.log")
	call s:Ora11Macro1("listener.20160117.log")
	call s:Ora11Macro1("listener.20160118.log")
	call s:Ora11Macro1("listener.20160119.log")
	call s:Ora11Macro1("listener.20160120.log")
	call s:Ora11Macro1("listener.20160121.log")
	call s:Ora11Macro1("listener.20160122.log")
	call s:Ora11Macro1("listener.20160123.log")
	call s:Ora11Macro1("listener.20160124.log")
	call s:Ora11Macro1("listener.20160125.log")
	call s:Ora11Macro1("listener.20160126.log")
	call s:Ora11Macro1("listener.20160127.log")
	call s:Ora11Macro1("listener.20160128.log")
	call s:Ora11Macro1("listener.20160129.log")
	call s:Ora11Macro1("listener.20160130.log")
	call s:Ora11Macro1("listener.20160131.log")
	call s:Ora11Macro1("listener.20160201.log")
	call s:Ora11Macro1("listener.20160202.log")
	call s:Ora11Macro1("listener.20160203.log")
	call s:Ora11Macro1("listener.20160204.log")
	call s:Ora11Macro1("listener.20160205.log")
	call s:Ora11Macro1("listener.20160206.log")
	call s:Ora11Macro1("listener.20160207.log")
	call s:Ora11Macro1("listener.20160208.log")
	call s:Ora11Macro1("listener.20160209.log")
	call s:Ora11Macro1("listener.log")
endfunction
"--------------------------------------------------------------------------------
" �֐����F 
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Ora9Proc1()
	let inp =  input("1)���o���܂���?[Y/N]")
	if inp == "Y"
		let YYYYMM = ""
		let YYYYMM_O = ""
		while YYYYMM != "Q"
			let QUEST = YYYYMM_O == "" ? "*" : YYYYMM_O
			let YYYYMM =  input("�N�� ?[YYYYMM or Q](" . QUEST . ")")
		
			if YYYYMM != "Q"
			" �t�@�C������u���}�����邽�߁A\��\\�ɂ��Ă���
				call s:Ora9(strpart(YYYYMM, 0, 4), strpart(YYYYMM, 4, 2))
			endif
			let YYYYMM_O = YYYYMM
		endwhile
	endif
endfunction
"--------------------------------------------------------------------------------
" �֐����F 
" �@�@�\�F 
"--------------------------------------------------------------------------------
function! s:Test()
	call s:Ora9("2017","03")
	call s:Ora9("2017","02")
	call s:Ora9("2017","01")
	call s:Ora9("2016","12")
	call s:Ora9("2016","11")
	call s:Ora9("2016","10")
	call s:Ora9("2016","09")
	call s:Ora9("2016","08")
	call s:Ora9("2016","07")
	call s:Ora9("2016","06")
	call s:Ora9("2016","05")
	call s:Ora9("2016","04")
	call s:Ora9("2016","03")
endfunction
