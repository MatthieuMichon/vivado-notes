Steps for installing Xilinx's [Vivado software](https://www.xilinx.com/products/design-tools/vivado.html) using a Linux terminal.

# Requirements

* 100+ GB of available disk space.
* Vivado full installer file (30+ GB) available on [Xilinx's website](https://www.xilinx.com/support/download.html).

# Instructions

## Bare Metal

After checking the integrity of the installer archive its contents must be extracted.

```shell
$ sha256sum --check Xilinx_Unified_<version>.tar.gz.digests
$ tar xaf Xilinx_Unified_<version>.tar.gz
```

Generate the installation configuration file.

```shell
$ ./xsetup --batch ConfigGen
```

> **NOTE**: The installer creates a configuration file which can be found in  `~/.Xilinx/install_config.txt`. The occupied disk usage can be significantly reduced by removing unused device families.

Launch the installer:

```shell
$ ./xsetup --batch Install --config <configuration file>
```

Installation quick check:
```shell
$ vivado -version

Vivado v2020.1 (64-bit)
SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
IP Build 2902112 on Wed May 27 22:43:36 MDT 2020
Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

$ echo $?

0
```

# References

* [UG973: Vivado release notes](https://www.xilinx.com/cgi-bin/docs/rdoc?v=latest;d=ug973-vivado-release-notes-install-license.pdf) ([all versions](https://www.xilinx.com/support/documentation-navigation/see-all-versions.html?xlnxproducttypes=Design%20Tools&xlnxdocumentid=UG973))
