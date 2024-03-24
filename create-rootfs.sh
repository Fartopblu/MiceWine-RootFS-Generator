#!/bin/bash

symlink2sh() {
  rm -f $1/generateSymlinks.sh

  for folder in $(find $1); do
    if [ -d "$folder" ]; then
      cd "$folder"

      for file in $(find $PWD); do
        target=$(readlink $file)

        if [ "$target" != "" ]; then
          rm "$file"

          echo "ln -sf $target $file" >> $1/generateSymlinks.sh
        fi
      done

      cd $OLDPWD
    fi
  done
}

export PREFIX=/data/data/com.micewine.emu/files/usr

if [ ! -e "$PREFIX" ]; then
  echo "$PREFIX: Don't Exist. Run 'build-all.sh' for generate the needed libs for creating a rootfs for MiceWine."
  exit
fi

# Convert symlinks to a .sh file that need to be executed after zip extract
symlink2sh $PREFIX

case $* in *"--clean-all"*)
  echo "Removing Static Libraries..."
  rm -f $PREFIX/lib/*.la
  rm -f $PREFIX/lib/*.a

  echo "Removing Generated Folders..."
  rm -rf $PREFIX/lib/{python*,cmake,pkgconfig}
  rm -rf $PREFIX/share/{cmake,aclocal,bash-completion,doc,info,man,util-macros,zsh}
  rm -rf $PREFIX/local
esac

case $* in *"--strip-all"*)
  echo "Stripping Libraries..."
  
  llvm-strip $PREFIX/lib/*.so*
esac

case $* in *"--no-save-zip"*)
  ;;
  *"--strip-all"*|*"--clean-all"*)
  cd $PREFIX
  7z a ~/MiceWine-RootFS-Stripped.zip
  echo "RootFS Saved on $HOME."
  ;;
  *)
  cd $PREFIX
  7z a ~/MiceWine-RootFS.zip
  echo "RootFS Saved on $HOME."
esac
