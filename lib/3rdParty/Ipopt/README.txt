Ipopt version 3.11.3 downloaded from here:
http://www.coin-or.org/download/source/Ipopt/Ipopt-3.11.3.tgz
-------------------------------------------------------------
Compiled by Adrian.Pop@liu.se using OMDev/MinGW in 2013-09-05

Unpacked Ipopt-3.11.3.tgz.

The IPopt, Mumps, Metis licenses are present in this directory.

Got Mumps from here:
http://mumps.enseeiht.fr/MUMPS_4.10.0.tar.gz
and put it in ThirdParty\Mumps\MUMPS
Applied the patch:
$ patch -p0 < mumps.patch

Got Metis from here:
http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-4.0.3.tar.gz
and put it in ThirdParty\Metis\metis-4.3

Check also build.sh and build.sh-trace.txt.

Configured and compiled with with:
adrpo@ida-liu050 /f/dev/ipopt/Ipopt-3.11.3
./configure --prefix=/f/dev/ipopt/ -C --enable-doscompile --disable-shared --enable-static --with-blas-lib="-llapack-mingw -ltmglib-mingw -lblas-mingw -lf2c -L\"\"$OPENMODELICAHOME/lib/omc\"\"" --with-lapack-lib="-llapack-mingw -ltmglib-mingw -lblas-mingw -lf2c -L\"\"$OPENMODELICAHOME/lib/omc\"\"" LDFLAGS='-static'
$ make
$ make test
$ make install
# copy /f/dev/ipopt/include -> $OMDEV/lib/3rdParty/Ipopt/include
# copy /f/dev/ipopt/lib     -> $OMDEV/lib/3rdParty/Ipopt/lib
# copy /f/dev/ipopt/share   -> $OMDEV/lib/3rdParty/Ipopt/share

----------
See more here:
https://projects.coin-or.org/Ipopt/wiki/CompilationHints

Contact Adrian.Pop@liu.se if you have issues.