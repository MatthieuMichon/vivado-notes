# Xilinx Vivado Installation Notes

Complementary remarks and thoughts regarding installation of [Vivado][vivado] absent from the [official release notes][ug-973-all] on headless (i.e using a text-mode terminal) Linux-based devices. 

## Table of Contents

* [Requirements](#requirements)
* [Software Download](#software-download)
* [Installation](#installation)

## Requirements

* A valid Xilinx account, required for downloading software files and creating an installation license file.
* A storage partition with at least 100 GB of available data space. 

## Software Download

Installation package files for both offline and online installation are available on a [dedicated downloads page][vivado-download].

> The package file URL contains a unique non-permanent token. Terminal-based utilities such as `curl` or `wget` will work provided the non-permanent URL is used.

```shell
$ file ./Xilinx_Unified_<version>.tar.gz
Xilinx_Unified_<version>.tar.gz: gzip compressed data, last modified: 
Thu Nov 19 04:02:39 2020, from Unix, original size modulo 2^32 708521984 gzip 
compressed data, unknown method, ASCII, has CRC, extra field, has comment, 
encrypted, from FAT filesystem (MS-DOS, OS/2, NT), original size modulo 2^32 
708521984
```

Data integrity of the downloaded file can be checked against the relevant digests file containing the values of various types of hashes.

```shell
$ sha256sum --check ./Xilinx_Unified_<version>.tar.gz.digests
Xilinx_Unified_<version>.tar.gz: OK
sha256sum: WARNING: 22 lines are improperly formatted
```

## Installation

### Installation Configuration

> This section compliments information found in the [user-guide UG973][ug-973-2020.2-batch-flow].

A configuration file must generated for the installation process to proceed. Although the user guide states `- Specify a standard edition and installation location`, repeated testing fails on the selection of the *WebPACK Edition* which is the only edition of Vivado which can be used free of charge.

```shell
$ ./xsetup --batch ConfigGen
```

> The installer creates a configuration file which can be found in  `~/.Xilinx/install_config.txt`. The occupied disk usage can be significantly reduced by removing non-relevant device families.

Launch the installer:

```shell
$ ./xsetup --batch Install --config <configuration file>
```

### Installation Check

Installation quick check:

```shell
$ vivado -version && echo 'OK'
Vivado v2020.2 (64-bit)
SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
OK
```

[vivado]: https://www.xilinx.com/products/design-tools/vivado.html
[vivado-download]:https://www.xilinx.com/support/download.html
[ug-973-latest]: https://www.xilinx.com/cgi-bin/docs/rdoc?v=latest;d=ug973-vivado-release-notes-install-license.pdf
[ug-973-2020.2-batch-flow]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug973-vivado-release-notes-install-license.pdf#_OPENTOPIC_TOC_PROCESSING_d103e7223
[ug-973-all]: https://www.xilinx.com/support/documentation-navigation/see-all-versions.html?xlnxproducttypes=Design%20Tools&xlnxdocumentid=UG973
