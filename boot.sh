#!/bin/sh
#

[ ! -e disk-qemu ] && cat chunk_* > disk-qemu

    # --enable-kvm \
    # --cpu host \

qemu-system-x86_64 \
    -smp 2 \
    --cpu max \
    -m 1G \
    -drive file=disk-qemu.vmdk,if=ide,id=drv0 \
    -netdev bridge,br=virbr0,id=net0 \
    -device virtio-net-pci,netdev=net0,mac=52:54:00:cb:95:f2 \
    -pidfile qemu.pid \
    -nographic \
    -kernel ifs.bin \
    -serial mon:stdio \
    -object rng-random,filename=/dev/urandom,id=rng0 \
    -device virtio-rng-pci,rng=rng0 \
    -nographic \
    -no-reboot
