SRC_URL=https://github.com/libevent/libevent/archive/release-2.1.12-stable.tar.gz
USE_NDK_VERSION=26b
CMAKE_ARGS="-DEVENT__BUILD_SHARED_LIBRARIES=ON -DEVENT__DISABLE_BENCHMARK=ON -DEVENT__DISABLE_OPENSSL=ON -DEVENT__DISABLE_REGRESS=ON -DEVENT__DISABLE_SAMPLES=ON -DEVENT__DISABLE_TESTS=ON -DEVENT__DISABLE_TESTS=ON -DEVENT__HAVE_WAITPID_WITH_WNOWAIT=ON -DEVENT__SIZEOF_PTHREAD_T=8"
