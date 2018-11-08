Dim var1, var2, var3, var4, var5, var6
var1="X5O!P%@AP[4"
'dummie text
var2="\PZX54(P^)7CC)7"
'dummie text
var3="}$EICAR-STAND"
'dummie text
var4="ARD-ANTIVIRU"
'dummie text
var5="S-TEST-FI"
'dummie text
var6="LE!$H+H*"
'dummie text


Const Forwritting = 2
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.OpenTextFile("EICAR_test_file.txt", Forwritting, True)
objTextFile.WriteLine(var1 & var2 & var3 & var4 & var5 & var6)
objTextFile.Close


