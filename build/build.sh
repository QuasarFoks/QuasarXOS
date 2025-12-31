#!/usr/bin/env sh

export MAKE_GLASS="$1"
source config-build


export DIR_INSTALL=/root

start() {
    cd "$FREEBSD_SRC_DIR"
    make "$MAKE_GLASS" buildworld 2&> "$XOS_DIR"/log/log_world.txt
    make "$MAKE_GLASS" kernelworld 2&> "$XOS_DIR"/log/log_kernel.txt
}

install() {
    make DESTDIR="$DIR_INSTALL" installworld
    make DESTDIR="$DIR_INSTALL" kernelworld
}
