### Setup QEMU
```
sudo apt update
sudo apt install qemu-system-x86 libvirt-daemon-system libvirt-clients bridge-utils virt-manager

sudo mkdir /etc/qemu/
echo 'allow virbr0' | sudo tee /etc/qemu/bridge.conf > /dev/null

sudo chmod u+s /usr/lib/qemu/qemu-bridge-helper
```

### Boot QNX Neutrino
```
./boot.sh
```
