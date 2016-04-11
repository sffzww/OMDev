CONFIG+= debug shared rtti no_plugin_manifest directwrite qpa
host_build {
    QT_ARCH = i386
    QT_TARGET_ARCH = i386
} else {
    QT_ARCH = i386
    QMAKE_DEFAULT_LIBDIRS = F:/OMDev/tools/msys/mingw32/lib/gcc/i686-w64-mingw32/5.3.0 F:/OMDev/tools/msys/mingw32/lib/gcc F:/OMDev/tools/msys/mingw32/i686-w64-mingw32/lib F:/OMDev/tools/msys/mingw32/lib
    QMAKE_DEFAULT_INCDIRS = F:/OMDev/tools/msys/mingw32/lib/gcc/i686-w64-mingw32/5.3.0/include F:/OMDev/tools/msys/mingw32/include F:/OMDev/tools/msys/mingw32/lib/gcc/i686-w64-mingw32/5.3.0/include-fixed F:/OMDev/tools/msys/mingw32/i686-w64-mingw32/include F:/OMDev/tools/msys/mingw32/include/c++/5.3.0 F:/OMDev/tools/msys/mingw32/include/c++/5.3.0/i686-w64-mingw32 F:/OMDev/tools/msys/mingw32/include/c++/5.3.0/backward
}
QT_CONFIG += minimal-config small-config medium-config large-config full-config debug_and_release build_all release debug c++11 c++14 c++1z shared system-zlib icu system-jpeg png system-png system-freetype system-harfbuzz build_all accessibility opengl ssl openssl dbus dbus-linked audio-backend directwrite native-gestures qpa fontconfig concurrent
#versioning 
QT_VERSION = 5.6.0
QT_MAJOR_VERSION = 5
QT_MINOR_VERSION = 6
QT_PATCH_VERSION = 0

QT_EDITION = OpenSource
QT_GCC_MAJOR_VERSION = 5
QT_GCC_MINOR_VERSION = 3
QT_GCC_PATCH_VERSION = 0

