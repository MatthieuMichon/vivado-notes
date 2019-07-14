This document contains notes and thoughts regarding the Vivado EDA tool provided by Xilinx, while focusing on headless operation.

# Version 2019.1

## Installation

According to document UG 973, chapter 4, section *Batch Mode Installation Flow*, headless installation can be done through several flows. The following instructions cover installation using the web installation flow.

Download and confirm installer file integrity:

```bash
$ md5sum Xilinx_Vivado_SDK_Web_2019.1_0524_1430_Lin64.bin
533000dc5324be422915eb4e93f9ce59  Xilinx_Vivado_SDK_Web_2019.1_0524_1430_Lin64.bin
$ chmod +x Xilinx_Vivado_SDK_Web_2019.1_0524_1430_Lin64.bin
```

Create the token file.

```bash
$ ./Xilinx_Vivado_SDK_Web_2019.1_0524_1430_Lin64.bin --keep --noexec --target ./wi
$ ./wi/xsetup -b AuthTokenGen
$ file ~/.Xilinx/wi_authentication_key
/home/<user>/.Xilinx/wi_authentication_key: ASCII text, with no line terminators
```

Run web installer to download content:

```bash
$ ./wi/xsetup -b Install -a XilinxEULA,3rdPartyEULA,WebTalkTerms -c ~/.Xilinx/wi_authentication_key -e "Vivado HL WebPACK"  -l <dir>
```
## Sample Project

Sample project for the Digilent Arty A7 board.

```bash
$ cd arty_a7_sample
$ vivado -mode batch -source ./script.tcl
```
