@echo off
setlocal

set VCPP_PATH=C:\Program Files (x86)\Microsoft Visual C++ Toolkit 2003

set PATH=%VCPP_PATH%\bin;%PATH%
set INCLUDE=%VCPP_PATH%\include;%INCLUDE%
set LIB=%VCPP_PATH%\lib;%LIB%

cl /nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "__WINDOWS__" /D "_MBCS" /D "_USRDLL" -I. /LD Moca13.lib /o ./MocaAdd.dll MocaAdd.c
del MocaAdd.obj
del MocaAdd.lib
del MocaAdd.exp

endlocal
pause