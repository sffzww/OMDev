
if %OMDEV%a==a (goto :OMDEV_NOTOK) else (goto :OMDEV_OK)

:OMDEV_NOTOK
echo OMDEV environment variable not defined! Please define it!
exit 1

:OMDEV_OK
REM generate passwd and group
echo Generate %OMDEV%/tools/msys/etc/passwd and %OMDEV%/tools/msys/etc/group
%OMDEV%/tools/msys/usr/bin/mkpasswd -l -c > %OMDEV%//tools/msys/etc/passwd
%OMDEV%/tools/msys/usr/bin/mkgroup -l -c > %OMDEV%//tools/msys/etc/group

REM Fix Qt5 files for the current OMDev installation
echo Fix Qt5 files for the current OMDev installation
%OMDEV%/tools/msys/mingw32/bin/qtbinpatcher --nobackup
%OMDEV%/tools/msys/mingw64/bin/qtbinpatcher --nobackup


