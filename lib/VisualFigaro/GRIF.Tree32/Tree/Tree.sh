#!/bin/sh
cd `dirname $0`
PATH=$PATH:../Lib
java -Dsun.java2d.d3d=false -ms128m -mx1024m -Xmixed -Xincgc -Djava.library.path="../Tools/Moca13:../Lib" -jar Tree.jar $1

