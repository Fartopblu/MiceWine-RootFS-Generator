SRC_URL=https://xorg.freedesktop.org/releases/individual/lib/libXcursor-1.2.1.tar.xz
CONFIGURE_ARGS="--host=$TOOLCHAIN_TRIPLE host_alias=$TOOLCHAIN_TRIPLE --enable-malloc0returnsnull"
USE_NDK_VERSION=26b
