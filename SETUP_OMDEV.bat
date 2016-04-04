@echo off

if %OMDEV%a==a (goto :OMDEV_NOTOK) else (goto :OMDEV_OK)

:OMDEV_NOTOK
echo OMDEV environment variable not defined! Please define it!
pause
exit 1

:OMDEV_OK
REM generate passwd and group
echo Generate %OMDEV%/tools/msys/etc/passwd and %OMDEV%/tools/msys/etc/group
%OMDEV%/tools/msys/usr/bin/mkpasswd -l -c > %OMDEV%//tools/msys/etc/passwd
%OMDEV%/tools/msys/usr/bin/mkgroup -l -c > %OMDEV%//tools/msys/etc/group
