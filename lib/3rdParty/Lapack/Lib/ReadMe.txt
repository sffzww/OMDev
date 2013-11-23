Lapack and blas was build as dll for windows with the version 3.1.0 downloaded from here:
http://www.netlib.org/lapack/
Compiled with mingw a later version does not work becaus g90 is need wich is not part of current mingw version

Copy dlamch.f and slamch.f from INSTALL directory SRC directory 
From lapack directory call
g77 –shared -o blas.dll BLAS/SRC/*.f –O 
cd SRC
g77 -c *.f 
cd ..
g77 -shared -o lapack.dll SRC/*.o blas.dll 