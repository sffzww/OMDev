@echo off

if %OMDEV%a==a (goto :OMDEV_NOTOK) else (goto :OMDEV_OK)

:OMDEV_NOTOK
echo OMDEV environment variable not defined! Please define it!
pause
exit 1

:OMDEV_OK
REM patch Qt5 files
echo patch Qt5 files
cd %OMDEV%/tools/msys/mingw32/bin
.\qtbinpatcher --nobackup --force
cd %OMDEV%/tools/msys/mingw64/bin
.\qtbinpatcher --nobackup --force

