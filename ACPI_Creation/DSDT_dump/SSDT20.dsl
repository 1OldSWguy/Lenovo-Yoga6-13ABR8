/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20230628 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT20.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000031F (799)
 *     Revision         0x01
 *     Checksum         0x0E
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    /*
     * iASL Warning: There was 1 external control method found during
     * disassembly, but only 0 were resolved (1 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods. Note: SSDTs can be dynamically loaded at
     * runtime and may or may not be available via the host OS.
     *
     * To specify the tables needed to resolve external control method
     * references, the -e option can be used to specify the filenames.
     * Example iASL invocations:
     *     iasl -e ssdt1.aml ssdt2.aml ssdt3.aml -d dsdt.aml
     *     iasl -e dsdt.aml ssdt2.aml -d ssdt1.aml
     *     iasl -e ssdt*.aml -d dsdt.aml
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_SB_.GPIO, DeviceObj)
    External (_SB_.PCI0.GP17.ACP_, UnknownObj)
    External (_SB_.PCI0.GP17.AZAL, UnknownObj)
    External (_SB_.PCI0.GP17.MP2C, UnknownObj)
    External (_SB_.PCI0.GP17.XHC0, UnknownObj)
    External (_SB_.PCI0.GP17.XHC1, UnknownObj)
    External (_SB_.PCI0.GPP0, UnknownObj)
    External (_SB_.PCI0.GPP6, UnknownObj)
    External (_SB_.PWRB, UnknownObj)
    External (M000, MethodObj)    // Warning: Unknown method, guessing 1 arguments

    Scope (\_SB)
    {
        OperationRegion (P000, SystemMemory, 0xFED80300, 0x04)
        Field (P000, ByteAcc, NoLock, Preserve)
        {
            Offset (0x01), 
            SMBA,   8
        }
    }

    Method (MSTP, 1, Serialized)
    {
        Local0 = (Arg0 - 0x0C00)
        M000 (Local0)
    }

    Scope (\_SB.GPIO)
    {
        Method (_AEI, 0, NotSerialized)  // _AEI: ACPI Event Interrupts
        {
            Name (BUF0, ResourceTemplate ()
            {
                GpioInt (Edge, ActiveHigh, ExclusiveAndWake, PullDefault, 0x1388,
                    "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
                GpioInt (Edge, ActiveHigh, ExclusiveAndWake, PullNone, 0x0000,
                    "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x002C
                    }
                GpioInt (Level, ActiveHigh, ExclusiveAndWake, PullNone, 0x0000,
                    "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x003D
                    }
                GpioInt (Level, ActiveHigh, ExclusiveAndWake, PullNone, 0x0000,
                    "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x003E
                    }
                GpioInt (Level, ActiveHigh, ExclusiveAndWake, PullNone, 0x0000,
                    "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x003A
                    }
                GpioInt (Level, ActiveHigh, ExclusiveAndWake, PullNone, 0x0000,
                    "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x003B
                    }
                GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullNone, 0x0000,
                    "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0012
                    }
            })
            Return (BUF0) /* \_SB_.GPIO._AEI.BUF0 */
        }

        Method (_EVT, 1, Serialized)  // _EVT: Event
        {
            Switch (ToInteger (Arg0))
            {
                Case (Zero)
                {
                    MSTP (0x3900)
                    Notify (\_SB.PWRB, 0x80) // Status Change
                }
                Case (0x12)
                {
                    MSTP (0x3918)
                    Notify (\_SB.PCI0.GPP6, 0x02) // Device Wake
                }
                Case (0x31)
                {
                    MSTP (0x3949)
                    Local0 = ((SMBA * 0x0100) + 0x20)
                    OperationRegion (ASFA, SystemIO, Local0, 0x10)
                    Field (ASFA, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x0A), 
                        ASTS,   8
                    }

                    If (((ASTS & 0x44) == 0x44))
                    {
                        Notify (\_SB.PWRB, 0x80) // Status Change
                    }

                    ASTS = 0xFF
                }
                Case (0x36)
                {
                    MSTP (0x3954)
                    Notify (\_SB.PCI0.GP17.MP2C, 0x02) // Device Wake
                }
                Case (0x3A)
                {
                    MSTP (0x3958)
                    Notify (\_SB.PCI0.GP17.XHC0, 0x02) // Device Wake
                }
                Case (0x3B)
                {
                    MSTP (0x3959)
                    Notify (\_SB.PCI0.GP17.XHC1, 0x02) // Device Wake
                }
                Case (0x3D)
                {
                    MSTP (0x3961)
                    Notify (\_SB.PCI0.GP17.AZAL, 0x02) // Device Wake
                }
                Case (0x3E)
                {
                    MSTP (0x3961)
                    Notify (\_SB.PCI0.GP17.ACP, 0x02) // Device Wake
                }
                Case (0x44)
                {
                    MSTP (0x3962)
                    Notify (\_SB.PCI0.GPP0, Zero) // Bus Check
                }

            }
        }
    }
}

