[ -d "out" ] && rm -rf out || mkdir -p out

make O=out ARCH=arm64 nethunter_defconfig

PATH="${HOME}/proton-clang/bin:${PATH}" \
make                  O=out \
                      ARCH=arm64 \
                      CC=clang \
                      AR=llvm-ar \
                      NM=llvm-nm \
                      OBJCOPY=llvm-objcopy \
                      OBJDUMP=llvm-objdump \
                      STRIP=llvm-strip \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
                      CONFIG_NO_ERROR_ON_MISMATCH=y \
                      -j8
