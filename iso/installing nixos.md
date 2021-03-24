# partitioning
sudo parted /dev/nvme0n1 -- mklabel gpt

sudo parted /dev/nvme0n1 -- mkpart primary 512MiB 100%

sudo parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB

sudo parted /dev/nvme0n1 -- set 2 esp on


# lvm'ing
sudo pvcreate /dev/nvme0n1p1

sudo vgcreate vg /dev/nvme0n1p1

sudo lvcreate -L 8G -n swap vg

sudo lvcreate -l '100%FREE' -n root vg

sudo lvchange -a y /dev/vg/swap

sudo lvchange -a y /dev/vg/root


# formatting
sudo mkfs.fat -F 32 -n boot /dev/nvme0n1p2

sudo mkswap -L swap /dev/vg/swap

sudo mkfs.ext4 -L nixos /dev/vg/root


# installing
sudo mount /dev/vg/root /mnt

sudo mkdir -p /mnt/boot

sudo mount /dev/nvme0n1p2 /mnt/boot

sudo swapon /dev/vg/swap


# initializing 
sudo nixos-generate-config --root /mnt

sudo vim /mnt/etc/nixos/configuration.nix // do what you want 

sudo nixos-install

sudo reboot


# deleting
sudo parted /dev/nvme0n1 -- mklabel gpt // will clear out all partitions and start fresh

sudo pvremove /dev/nvme0n1p1

sudo vgremove vg

sudo lvremove /dev/vg/swap

sudo lvremove /dev/vg/root

