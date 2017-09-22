:let BUFFER_FILE_NAME     = expand("%")
:echom "[BUFFER_FILE_NAME]" . BUFFER_FILE_NAME
:bufdo %v/menuAction/d
:%s/ - - /\t/
:%s/]"/]\t/
:%s/" \(\d\+\) \(\d\+\)/"\t\1\t\2/
:%s/

:%s/Jan/01/
:%s/Feb/02/
:%s/Mar/03/
:%s/Apr/04/
:%s/May/05/
:%s/Jun/06/
:%s/Jul/07/
:%s/Aug/08/
:%s/Sep/09/
:%s/Oct/10/
:%s/Nov/11/
:%s/Dec/12/

:%s/\[\(\d\{2\}\)\/\(\d\{2\}\)\/\(\d\{4\}\):\(.*\) +0900\]\s\+/\3\/\2\/\1 \4\t/

:%s/?u=\(.\+\) HTTP\/1\.1"/\0\t\1/

:let OUTPUTFILE = "out/AccessLog.txt"
:execute ":w! >> " . OUTPUTFILE
:quit!
