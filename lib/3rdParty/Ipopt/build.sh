./configure --prefix=/f/dev/ipopt/ -C --enable-doscompile --disable-shared --enable-static --with-blas-lib="-llapack-mingw -ltmglib-mingw -lblas-mingw -lf2c -L\"\"$OPENMODELICAHOME/lib/omc\"\"" --with-lapack-lib="-llapack-mingw -ltmglib-mingw -lblas-mingw -lf2c -L\"\"$OPENMODELICAHOME/lib/omc\"\"" LDFLAGS='-static'
make
make test
make install
