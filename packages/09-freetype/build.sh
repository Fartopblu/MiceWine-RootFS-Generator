SRC_URL=https://downloads.sourceforge.net/freetype/freetype-2.13.2.tar.xz
CONFIGURE_ARGS="--host=$TOOLCHAIN_TRIPLE host_alias=$TOOLCHAIN_TRIPLE --without-bzip2 --without-harfbuzz"
USE_NDK_VERSION=26b
CHECK_FILES="$PREFIX/lib/libfreetype.so"
