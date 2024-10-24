/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20230628 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembly of TPM2.aml
 *
 * ACPI Data Table [TPM2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "TPM2"    [Trusted Platform Module hardware interface Table]
[004h 0004 004h]                Table Length : 0000004C
[008h 0008 001h]                    Revision : 04
[009h 0009 001h]                    Checksum : A1
[00Ah 0010 006h]                      Oem ID : "LENOVO"
[010h 0016 008h]                Oem Table ID : "CB-01   "
[018h 0024 004h]                Oem Revision : 00000001
[01Ch 0028 004h]             Asl Compiler ID : "ACPI"
[020h 0032 004h]       Asl Compiler Revision : 00040000

[024h 0036 002h]              Platform Class : 0000
[026h 0038 002h]                    Reserved : 0000
[028h 0040 008h]             Control Address : 00000000FDC10510
[030h 0048 004h]                Start Method : 02 [ACPI Start Method]

[034h 0052 00Ch]           Method Parameters : 00 00 00 00 00 00 00 00 00 00 00 00
[040h 0064 004h]          Minimum Log Length : 00010000
[044h 0068 008h]                 Log Address : 00000000B5996000

Raw Table Data: Length 76 (0x4C)

    0000: 54 50 4D 32 4C 00 00 00 04 A1 4C 45 4E 4F 56 4F  // TPM2L.....LENOVO
    0010: 43 42 2D 30 31 20 20 20 01 00 00 00 41 43 50 49  // CB-01   ....ACPI
    0020: 00 00 04 00 00 00 00 00 10 05 C1 FD 00 00 00 00  // ................
    0030: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 01 00 00 60 99 B5 00 00 00 00              // .....`......
