PKG_VER=[gss]
PKG_CATEGORY="VulkanDriver"
PKG_PRETTY_NAME="Mesa Turnip Driver"
VK_DRIVER_LIB="libvulkan_freedreno.so"

BLACKLIST_ARCHITECTURE=x86_64

GIT_URL=https://gitlab.freedesktop.org/mesa/mesa
GIT_COMMIT=a02dd9b36fac2837491e052b9b860ab64408b03a
LDFLAGS="-L$PREFIX/lib -landroid-shmem"
CPPFLAGS="-D__USE_GNU"
MESON_ARGS="-Dgallium-drivers= -Dvulkan-drivers=freedreno -Dfreedreno-kmds=kgsl -Dglvnd=disabled -Dplatforms=x11 -Dxmlconfig=disabled -Dllvm=disabled -Dopengl=false -Degl=disabled -Dzstd=enabled"
