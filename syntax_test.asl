// SYNTAX TEST "Packages/sublime-text-coreboot-syntax/coreboot-asl.sublime-syntax"

/* Block Comment */

/**
 * Block Comment
 */

#include <soc/iomap.h>
// <- keyword.control.import.include.asl
//       ^ string.quoted.double punctuation.definition.string.begin.asl
//        ^^^^^^^^^^^^ string.quoted.double
//                    ^

#include "soc/iomap.h"
// <- keyword.control.import.include.asl
//       ^ string.quoted.double punctuation.definition.string.begin.asl
//        ^^^^^^^^^^^^ string.quoted.double
//                    ^

External (\_SB.DPTF.TCHG, DeviceObj)
// <- keyword.other.asl
//       ^ meta.parens.asl punctuation.section.parens.begin.asl
//        ^^^^^^^^^^^^^^ meta.path.asl
//        ^ punctuation.root.asl
//         ^^^ variable.language.asl
//            ^ punctuation.accessor
//             ^^^^ variable.other.asl
//                 ^ punctuation.accessor
//                  ^^^^ variable.other.asl
//                      ^ punctuation.separator.asl
//                        ^^^^^^^^^^ meta.parens.asl

Scope (\_SB.PCI0.GP14)
// ^^ keyword.other.asl
//    ^ meta.parens.asl punctuation.section.parens.begin.asl
//     ^^^^^^^^^^^^^^^ meta.parens.asl
{
    Device (NVME)
    // <-storage.type.asl
    //      ^^^^ entity.name.other.asl
    {
        Name (_ADR, 0x0000000000000000)  // _ADR: Address
        // <- storage.type.asl
        //    ^^^^ variable.language.asl
        //          ^^^^^^^^^^^^^^^^^^ constant.numeric.integer.hexadecimal
        Method (_STA, 0, NotSerialized)  // _STA: Status
        // <- storage.type.asl
        //      ^^^^ variable.language.asl
        //            ^ constant.numeric.integer.decimal.asl
        //               ^^^^^^^^^^^^^ keyword.other.asl
        {
            Return (0x0F)
            // <- keyword.other.asl
            //      ^^^^ constant.numeric.integer.hexadecimal
        }

        Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
        // <- storage.type.asl
        //    ^^^^ variable.language.asl
        //          ^^^^^^^ keyword.other.asl
        //                   ^^^^ constant.numeric.integer.hexadecimal
        {
            ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0"), 
            // <- keyword.other.asl
            //      ^ string.quoted.double punctuation.definition.string.begin.asl
            Package (0x01)
            // <- keyword.other.asl
            //       ^^^^ constant.numeric.integer.hexadecimal
            {
                Package (0x02)
                //<- keyword.other.asl
                //       ^^^^ constant.numeric.integer.hexadecimal
                {
                    "StorageD3Enable", 
                    // <- punctuation.definition.string.begin.asl
                    One
                    // <- constant.numeric.asl
                }
            }
        })
    }
}

Device (\_SB.PCI0.GP15.SDHC)
// ^^^ storage.type.asl
//     ^ meta.parens.asl punctuation.section.parens.begin.asl
//      ^ punctuation.root.asl
//       ^^^ variable.language.asl
//          ^ punctuation.accessor
//           ^^^^ variable.other.asl
//               ^ punctuation.accessor
//                ^^^^ variable.other.asl
//                    ^ punctuation.accessor
//                     ^^^^ entity.name.other.asl
//                         ^ meta.parens.asl punctuation.section.parens.end.asl
{
// <- meta.block punctuation.section.block.begin
    Name (_ADR, 0x0000000000000000)  // _ADR: Address
//  ^^^^ storage.type.asl
//       ^ punctuation.section.parens.begin.asl
//        ^^^^ variable.language.asl
//            ^ punctuation.separator.asl
//              ^^^^^^^^^^^^^^^^^^ constant.numeric.integer.hexadecimal
//                                ^ punctuation.section.parens.end.asl
    Method (_STA, 0, NotSerialized)  // _STA: Status
    //      ^^^^ variable.language.asl
    //               ^^^^^^^^^^^^^ keyword.other.asl
    {
        Return (0x0F)
//      ^^^^^^ keyword.other.asl
    }
    Method (STA, 1, Serialized)
    //      ^^^ entity.name.other.asl
    //              ^^^^^^^^^^ keyword.other.asl
    {
        Local0 = \_SB.PCI0.LPCB.EC0.TSRD (TMPS)
//      ^^^^^^ variable.language.asl
//             ^ keyword.operator.assignment.asl
//               ^ meta.path.asl punctuation.root.asl
//                ^^^ meta.path.asl variable.language.asl
//                   ^ meta.path.asl punctuation.accessor
//                    ^^^^ meta.path.asl variable.other.asl
//                        ^ punctuation.accessor
        Return (Local4)
        //      ^^^^^^ variable.language.asl

        \_SB.PCI0.LPCB.EC0.TSRD (TMPS)
//      ^ meta.path.asl punctuation.root.asl
//       ^^^ meta.path.asl variable.language.asl
//          ^ meta.path.asl punctuation.accessor
//           ^^^^ meta.path.asl variable.other.asl
//               ^ punctuation.accessor

        Return (\PPKG (Local1))
        //      ^ punctuation.root.asl
        //       ^^^^ meta.path.asl variable.other.asl
        //            ^ meta.parens.asl punctuation.section.parens.begin.asl
        //             ^^^^^^ variable.language.asl
        //                   ^ meta.parens.asl punctuation.section.parens.end.asl
        //                    ^ meta.parens.asl punctuation.section.parens.end.asl
    }

    Method (_Q01, 0, NotSerialized)
//  ^^^^^^ meta.block storage.type.asl
//         ^ meta.parens.asl punctuation.section.parens.begin.asl
//          ^^^^ variable.language.asl
//              ^ punctuation.separator.asl
//                ^ constant.numeric.integer.decimal.asl
//                 ^ punctuation.separator.asl
//                   ^^^^^^^^^^^^^ keyword.other.asl
//                                ^ punctuation.section.parens.end.asl
    {
//  ^ meta.block meta.block punctuation.section.block.begin
        Store ("EC: LID CLOSE", Debug)
        Store (LIDS, \LIDS)
//      ^^^^^ keyword.other.asl
//             ^^^^ variable.other.asl
//                   ^ meta.path.asl punctuation.root.asl
//                    ^^^^ meta.path.asl variable.other.asl
#ifdef EC_ENABLE_LID_SWITCH
// <- keyword.control.import.asl
//     ^^^^^^^^^^^^^^^^^^^^ constant.other.macro.asl
        Notify (LID0, 0x80)
//      ^^^^^^ keyword.other.asl
//              ^^^^ meta.path.asl variable.other.asl
//                    ^^^^ constant.numeric.integer.hexadecimal.asl
#endif
// <- keyword.control.import.asl
    }

    Method (_CRS, 0) {
//                   ^ meta.block punctuation.section.block.begin.asl
        Local0 = ResourceTemplate() {
//      ^^^^^^ variable.language.asl
//             ^ keyword.operator.assignment.asl
//               ^^^^^^^^^^^^^^^^ meta.block keyword.other.asl
//                               ^ meta.parens.asl punctuation.section.parens.begin.asl
//                                ^ meta.parens.asl punctuation.section.parens.end.asl
//                                  ^ meta.block punctuation.section.block.begin.asl
            Interrupt (
//          ^^^^^^^^^ keyword.other.asl
                ResourceConsumer,
//              ^^^^^^^^^^^^^^^^ keyword.other.asl
//                              ^ punctuation.separator.asl
                Level,
                ActiveLow,
                Shared, , , IRQR
//              ^^^^^^ keyword.other.asl
//                          ^^^^ entity.name.other.asl
            )
            { 0 }
            Memory32Fixed (ReadWrite, ACPIMMIO_GPIO0_BASE, 0x400)
//          ^^^^^^^^^^^^^ keyword.other.asl
//                         ^^^^^^^^^ keyword.other.asl
//                                    ^^^^^^^^^^^^^^^^^^^ constant.other.macro.asl
//                                                         ^^^^^ constant.numeric.integer.hexadecimal
        }
        CreateDWordField (Local0, IRQR._INT, IRQN)
//      ^^^^^^^^^^^^^^^^ keyword.other.asl
//                        ^^^^^^ variable.language.asl
//                              ^ punctuation.separator.asl
//                                ^^^^ meta.path.asl variable.other.asl
//                                    ^ meta.path.asl punctuation.accessor
//                                     ^^^^ meta.path.asl variable.language.asl
//                                         ^ punctuation.separator.asl
//                                           ^^^^ entity.name.other.asl
        If (PICM) {
//      ^^ keyword.control.conditional.asl
//          ^^^^ variable.other.asl
            IRQN = IGPI
//          ^^^^ variable.other.asl
//                 ^^^^ variable.other.asl
        } Else {
//        ^^^^ keyword.control.conditional.asl
            IRQN = PGPI
//          ^^^^ variable.other.asl
//                 ^^^^ variable.other.asl
        }

        Return (Local0)
    }

    Method (ARTH, 0) {
        Z = X + Y
//            ^ keyword.operator.arithmetic.asl
        Add (X, Y, Z)
//      ^^^keyword.operator.word.asl
        Z = X / Y
//            ^ keyword.operator.arithmetic.asl
        Divide (X, Y, , Z)
//      ^^^^^^ keyword.operator.word.asl
        Z = X % Y
//            ^ keyword.operator.arithmetic.asl
        Mod (X, Y, Z)
//      ^^^keyword.operator.word.asl
        Z = X * Y
//            ^ keyword.operator.arithmetic.asl
        Multiply (X, Y, Z)
//      ^^^^^^^^keyword.operator.word.asl
        Z = X - Y
//            ^ keyword.operator.arithmetic.asl
        Subtract (X, Y, Z)
//      ^^^^^^^^keyword.operator.word.asl
        Z = X << Y
//            ^^ keyword.operator.arithmetic.asl
        ShiftLeft (X, Y, Z)
//      ^^^^^^^^^ keyword.operator.word.asl
        Z = X >> Y
//            ^^ keyword.operator.arithmetic.asl
        ShiftRight (X, Y, Z)
//      ^^^^^^^^^^ keyword.operator.word.asl
        Z = X & Y
//            ^ keyword.operator.arithmetic.asl
        And (X, Y, Z)
//      ^^^ keyword.operator.word.asl
        Z = X | Y
//            ^ keyword.operator.arithmetic.asl
        Or (X, Y, Z)
//      ^^ keyword.operator.word.asl
        Z = X ^ Y
//            ^ keyword.operator.arithmetic.asl
        Xor (X, Y, Z)
//      ^^^ keyword.operator.word.asl
        Z = ~X
//          ^ keyword.operator.arithmetic.asl
        Not (X, Z)
//      ^^^ keyword.operator.word.asl
        X++
//       ^^ keyword.operator.arithmetic.asl
        Increment (X)
//      ^^^^^^^^^ keyword.operator.word.asl
        X--
//       ^^ keyword.operator.arithmetic.asl
        Decrement (X)
//      ^^^^^^^^^ keyword.operator.word.asl
    }
    Method (LOPS, 0) {
        (X == Y)
//         ^^ keyword.operator.assignment.asl
        LEqual (X, Y)
//      ^ keyword.operator.word.asl
        (X != Y)
//         ^^ keyword.operator.comparison.asl
        LNotEqual (X, Y)
//      ^ keyword.operator.word.asl
        (X < Y)
//         ^ keyword.operator.comparison.asl
        LLess (X, Y)
//      ^ keyword.operator.word.asl
        (X > Y)
//         ^ keyword.operator.comparison.asl
        LGreater (X, Y)
//      ^ keyword.operator.word.asl
        (X <= Y)
//         ^^ keyword.operator.comparison.asl
        LLessEqual (X, Y)
//      ^ keyword.operator.word.asl
        (X >= Y)
//         ^^ keyword.operator.comparison.asl
        LGreaterEqual (X, Y)
//      ^ keyword.operator.word.asl
        (X && Y)
//         ^^ keyword.operator.logical.asl
        LAnd (X, Y)
//      ^ keyword.operator.word.asl
        (X || Y)
//         ^^ keyword.operator.logical.asl
        LOr (X, Y)
//      ^ keyword.operator.word.asl
        !X
//      ^ keyword.operator.logical.asl
        LNot (X)
//      ^ keyword.operator.word.asl
    }

    Method (COMP, 0) {
        X = Y
        Store (Y, X)
        X += Y
        Add (X, Y, X)
        X /= Y
        Divide (X, Y, , X)
        X %= Y
        Mod (X, Y, X)
        X *= Y
        Multiply (X, Y, X)
        X -= Y
        Subtract (X, Y, X)
        X <<= Y
        ShiftLeft (X, Y, X)
        X >>= Y
        ShiftRight (X, Y, X)
        X &= Y
        And (X, Y, X)
        X |= Y
        Or (X, Y, X)
        X ^= Y
        Xor (X, Y, X)
    }

    Name (_AEI, ResourceTemplate () {
        GpioInt(Edge, ActiveLow, ExclusiveAndWake, PullNone, 0x0000, "\\_SB.GPIO", 0x00, ResourceConsumer, , ) {22} /* lpc_pme_l_agpio22 */
    })
    OperationRegion(OOPR, SystemMemory, 0xDEADBEEF, 0x100)
//  ^^^^^^^^^^^^^^^ storage.type.asl
//                  ^^^^ meta.entity-path.asl entity.name.other.asl
//                        ^^^^^^^^^^^^ keyword.other.asl
//                                      ^^^^^^^^^^ constant.numeric.integer.hexadecimal.asl
//                                                  ^^^^^ constant.numeric.integer.hexadecimal.asl
    Field(OOPR, AnyAcc, NoLock, Preserve) {
//  ^^^^^ keyword.other.field.asl
//        ^^^^ variable.other.asl
//              ^^^^^^ keyword.other.asl
//                      ^^^^^^ keyword.other.asl
//                              ^^^^^^^^ keyword.other.asl
//                                        ^ meta.block.field.asl punctuation.section.block.begin.asl
        Offset (0x4),
//      ^^^^^^ keyword.other.offset.asl
//              ^^^ constant.numeric.integer.hexadecimal.asl
//                  ^ punctuation.separator.asl
        FAAD, 2,
//      ^^^^ entity.name.field.asl
//          ^ punctuation.separator.asl
//            ^ constant.numeric.integer.decimal.asl
//             ^ punctuation.separator.asl
        Offset (0x22),
//      ^^^^^^ keyword.other.offset.asl
//              ^^^^ constant.numeric.integer.hexadecimal.asl
//                   ^ punctuation.separator.asl
        BARR, 16,
//      ^^^^ entity.name.field.asl
//            ^^ constant.numeric.integer.decimal.asl
        Offset (0xF0),
//      ^^^^^^ keyword.other.offset.asl
//              ^^^^ constant.numeric.integer.hexadecimal.asl
        ABCD,1,
//      ^^^^ entity.name.field.asl
//           ^ constant.numeric.integer.decimal.asl
        , 2,
//      ^ punctuation.separator.asl
//        ^ constant.numeric.integer.decimal.asl
        BAED,1,
//      ^^^^ entity.name.field.asl
//           ^ constant.numeric.integer.decimal.asl
    }
//  ^ meta.block meta.block.field.asl punctuation.section.block.end.asl
}
// <- meta.block punctuation.section.block.end.asl

#if CONFIG(HELLO_WORLD)
// <- keyword.control.import.asl
//  ^^^^^^ constant.other.macro.asl
//         ^^^^^^^^^^^ constant.other.macro.asl
#endif
// <- keyword.control.import.asl

ThermalZone (THRM) {
// <- storage.type.asl
//           ^^^^ entity.name.other.asl
}

#define AOAC_DEVICE(DEV_ID, SX) \
// <- meta.preprocessor.define.asl keyword.control.import.define.asl
//      ^^^^^^^^^^^ meta.preprocessor.define.asl entity.name.function.asl
    PowerResource(AOAC, SX, 0) { \
    }

#define HELLO           33
// <- keyword.control.import.define.asl
//      ^^^^^ entity.name.asl
//                      ^^ constant.numeric.integer.decimal.asl
#define HELLO_WORLD     33
// <- keyword.control.import.define.asl
//      ^^^^^^^^^^^ entity.name.asl
//                      ^^ constant.numeric.integer.decimal.asl
