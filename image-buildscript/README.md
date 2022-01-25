# Archlinux-Hadoop Image

This image provides:

-   Hadoop, reconfigured to be run with `root`
-   Spark
-   SBT (Simple build tool)

## Step to Build

You may also run `make` to get it.

1.   Prepare an Arch Linux system. These modified packages needs to be built with Arch Build System.
2.   Rename the packed result as below and put them into `packages`:
     1.   apache-spark-3.2.0-0-any.pkg.pacman
     2.   hadoop-3.3.1-1-x86_64.pkg.pacman
4.   run `./build-host.sh`.
5.   Get the image from `output`.

## Modifications Compared to original Arch-boxes

1.   Build script and cloud-cfg script for cloud-init.
1.   Add packages
2.   Removed unneeded scripts.

## LICENSE

This image script is created with GPLv3, as the original one is also GPLv3.
