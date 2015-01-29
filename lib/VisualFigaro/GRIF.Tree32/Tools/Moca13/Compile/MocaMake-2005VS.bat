@echo off
rem ---------------------------------------------------------------------
rem Visual C++ 9.0 doit etre installe et 
rem vc9varsxx.bat doit avoir ete execute avant l'execution de ce script
rem ---------------------------------------------------------------------

setlocal

cl /MT /W3 /EHsc /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "__WINDOWS__" /D "_MBCS" /D "_USRDLL"  /D "_CRT_SECURE_NO_WARNINGS" -I. Moca13.lib /LD /FeMocaAdd.dll MocaAdd.c

del MocaAdd.obj
del MocaAdd.lib
del MocaAdd.exp

endlocal
pause