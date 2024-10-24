/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20230628 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT13.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000016C (364)
 *     Revision         0x01
 *     Checksum         0xCF
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    External (_SB_.PCI0.GPP6.WLAN, DeviceObj)

    Scope (\_SB.PCI0.GPP6.WLAN)
    {
        Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
        {
            \_SB.PCI0.GPP6.WLAN.PRWL
        })
        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
        {
            Return (Zero)
        }
    }

    Scope (\_SB.PCI0.GPP6.WLAN)
    {
        OperationRegion (PCIS, PCI_Config, Zero, 0x0F)
        Field (PCIS, AnyAcc, NoLock, Preserve)
        {
            VDID,   32, 
            Offset (0x0B), 
            CLSC,   8
        }

        Method (WIST, 0, Serialized)
        {
            If (CondRefOf (VDID))
            {
                Switch (ToInteger (VDID))
                {
                    Case (0x796114C3)
                    {
                        Return (0x84)
                    }
                    Case (0x766314C3)
                    {
                        Return (0x84)
                    }
                    Default
                    {
                        Return (Zero)
                    }

                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Name (WLPS, One)
        PowerResource (PRWL, 0x00, 0x0000)
        {
            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
                Local1 = WIST ()
                If ((Local1 == Zero)){}
                Else
                {
                    OperationRegion (FLDR, PCI_Config, Local1, 0x06)
                    Field (FLDR, ByteAcc, NoLock, Preserve)
                    {
                        DCAP,   32, 
                        DCTR,   16
                    }

                    If ((DCAP & 0x10000000))
                    {
                        Local0 = DCTR /* \_SB_.PCI0.GPP6.WLAN.PRWL._RST.DCTR */
                        Local0 |= 0x8000
                        DCTR = Local0
                    }
                    Else
                    {
                    }
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (WLPS) /* \_SB_.PCI0.GPP6.WLAN.WLPS */
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                WLPS = One
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                WLPS = Zero
            }
        }
    }
}

