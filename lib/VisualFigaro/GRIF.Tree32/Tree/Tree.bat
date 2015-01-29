cd /D %~dp0
set PATH=%PATH%;../Lib
start ..\Java\bin\javaw -ms128m -mx1024M -Xmixed -Xincgc -Dcom.total.albizia.bdd.PrCache.MaxSize=524287 -Dcom.total.albizia.bdd.PrCache.Size=131071 -Djava.library.path="../Tools/Moca13;../Lib" -jar Tree.jar  %1 %2 %3 %4
