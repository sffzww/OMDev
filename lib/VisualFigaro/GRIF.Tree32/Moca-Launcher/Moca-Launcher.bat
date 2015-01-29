cd /D %~dp0
set PATH=%PATH%;../Lib
start ..\Java\bin\javaw  -ms128m -mx256M -Xmixed -Xincgc -Djava.library.path="../Tools/Moca13;../Lib" -jar Moca-Launcher.jar %1 %2 %3 %4
