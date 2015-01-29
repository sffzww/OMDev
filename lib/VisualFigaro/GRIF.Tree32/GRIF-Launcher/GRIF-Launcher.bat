cd /D %~dp0
set PATH=%PATH%;../Lib
start ..\Java\bin\javaw -jar GRIF-Launcher.jar %1 %2 %3 %4
