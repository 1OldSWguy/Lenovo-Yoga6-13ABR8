/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20230628 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT21.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000007D (125)
 *     Revision         0x01
 *     Checksum         0xEE
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    External (_SB_.PLTF, DeviceObj)

    Scope (\_SB.PLTF)
    {
        Name (_LPI, Package (0x04)  // _LPI: Low Power Idle States
        {
            Zero, 
            Zero, 
            One, 
            Package (0x0A)
            {
                0x000F4240, 
                0xC350, 
                One, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                ResourceTemplate ()
                {
                    Register (SystemMemory, 
                        0x00,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000000, // Address
                        ,)
                }, 

                ResourceTemplate ()
                {
                    Register (SystemMemory, 
                        0x00,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000000, // Address
                        ,)
                }, 

                "S0i3"
            }
        })
    }
}
