/*
 * Copyright (c) 2016-2023, ARM Limited and Contributors. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */
#ifndef ASM_MACROS_S
#define ASM_MACROS_S

#include <arch.h>
#include <common/asm_macros_common.S>
#include <lib/cpus/cpu_ops.h>
#include <lib/spinlock.h>

/*
 * TLBI instruction with type specifier that implements the workaround for
 * errata 813419 of Cortex-A57.
 */
#if ERRATA_A57_813419
#define TLB_INVALIDATE(_reg, _coproc) \
	stcopr	_reg, _coproc; \
	dsb	ish; \
	stcopr	_reg, _coproc
#else
#define TLB_INVALIDATE(_reg, _coproc) \
	stcopr	_reg, _coproc
#endif

	/*
	 * Co processor register accessors
	 */
	.macro ldcopr reg, coproc, opc1, CRn, CRm, opc2
	mrc	\coproc, \opc1, \reg, \CRn, \CRm, \opc2
	.endm

	.macro ldcopr16 reg1, reg2, coproc, opc1, CRm
	mrrc	\coproc, \opc1, \reg1, \reg2, \CRm
	.endm

	.macro stcopr reg, coproc, opc1, CRn, CRm, opc2
	mcr	\coproc, \opc1, \reg, \CRn, \CRm, \opc2
	.endm

	.macro stcopr16 reg1, reg2, coproc, opc1, CRm
	mcrr	\coproc, \opc1, \reg1, \reg2, \CRm
	.endm

	/* Cache line size helpers */
	.macro	dcache_line_size  reg, tmp
	ldcopr	\tmp, CTR
	ubfx	\tmp, \tmp, #CTR_DMINLINE_SHIFT, #CTR_DMINLINE_WIDTH
	mov	\reg, #CPU_WORD_SIZE
	lsl	\reg, \reg, \tmp
	.endm

	.macro	icache_line_size  reg, tmp
	ldcopr	\tmp, CTR
	and	\tmp, \tmp, #CTR_IMINLINE_MASK
	mov	\reg, #CPU_WORD_SIZE
	lsl	\reg, \reg, \tmp
	.endm

	/*
	 * Declare the exception vector table, enforcing it is aligned on a
	 * 32 byte boundary.
	 */
	.macro vector_base  label
	.section .vectors, "ax"
	.align 5
	\label:
	.endm

	/*
	 * This macro calculates the base address of the current CPU's multi
	 * processor(MP) stack using the plat_my_core_pos() index, the name of
	 * the stack storage and the size of each stack.
	 * Out: r0 = physical address of stack base
	 * Clobber: r14, r1, r2
	 */
	.macro get_my_mp_stack _name, _size
	bl	plat_my_core_pos
	ldr r2, =(\_name + \_size)
	mov r1, #\_size
	mla r0, r0, r1, r2
	.endm

	/*
	 * This macro calculates the base address of a uniprocessor(UP) stack
	 * using the name of the stack storage and the size of the stack
	 * Out: r0 = physical address of stack base
	 */
	.macro get_up_stack _name, _size
	ldr r0, =(\_name + \_size)
	.endm

#if ARM_ARCH_MAJOR == 7 && !defined(ARMV7_SUPPORTS_VIRTUALIZATION)
	/*
	 * Macro for mitigating against speculative execution.
	 * ARMv7 cores without Virtualization extension do not support the
	 * eret instruction.
	 */
	.macro exception_return
	movs	pc, lr
	dsb	nsh
	isb
	.endm

#else
	/*
	 * Macro for mitigating against speculative execution beyond ERET. Uses the
	 * speculation barrier instruction introduced by FEAT_SB, if it's enabled.
	 */
	.macro exception_return
	eret
#if ENABLE_FEAT_SB
	sb
#else
	dsb	nsh
	isb
#endif
	.endm
#endif

	/* Macro for error synchronization */
	.macro synchronize_errors
	/* Complete any stores that may return an abort */
	dsb	sy
	/* Synchronise the CPU context with the completion of the dsb */
	isb
	.endm

#if (ARM_ARCH_MAJOR == 7)
	/* ARMv7 does not support stl instruction */
	.macro stl _reg, _write_lock
	dmb
	str	\_reg, \_write_lock
	dsb
	.endm
#endif

	/*
	 * Helper macro to generate the best mov/movw/movt combinations
	 * according to the value to be moved.
	 */
	.macro mov_imm _reg, _val
		.if ((\_val) & 0xffff0000) == 0
			mov	\_reg, #(\_val)
		.else
			movw	\_reg, #((\_val) & 0xffff)
			movt	\_reg, #((\_val) >> 16)
		.endif
	.endm

	/*
	 * Macro to mark instances where we're jumping to a function and don't
	 * expect a return. To provide the function being jumped to with
	 * additional information, we use 'bl' instruction to jump rather than
	 * 'b'.
         *
	 * Debuggers infer the location of a call from where LR points to, which
	 * is usually the instruction after 'bl'. If this macro expansion
	 * happens to be the last location in a function, that'll cause the LR
	 * to point a location beyond the function, thereby misleading debugger
	 * back trace. We therefore insert a 'nop' after the function call for
	 * debug builds, unless 'skip_nop' parameter is non-zero.
	 */
	.macro no_ret _func:req, skip_nop=0
	bl	\_func
#if DEBUG
	.ifeq \skip_nop
	nop
	.endif
#endif
	.endm

	/*
	 * Reserve space for a spin lock in assembly file.
	 */
	.macro define_asm_spinlock _name:req
	.align	SPINLOCK_ASM_ALIGN
	\_name:
	.space	SPINLOCK_ASM_SIZE
	.endm

	/*
	 * Helper macro to OR the bottom 32 bits of `_val` into `_reg_l`
	 * and the top 32 bits of `_val` into `_reg_h`.  If either the bottom
	 * or top word of `_val` is zero, the corresponding OR operation
	 * is skipped.
	 */
	.macro orr64_imm _reg_l, _reg_h, _val
		.if (\_val >> 32)
			orr \_reg_h, \_reg_h, #(\_val >> 32)
		.endif
		.if (\_val & 0xffffffff)
			orr \_reg_l, \_reg_l, #(\_val & 0xffffffff)
		.endif
	.endm

	/*
	 * Helper macro to bitwise-clear bits in `_reg_l` and
	 * `_reg_h` given a 64 bit immediate `_val`.  The set bits
	 * in the bottom word of `_val` dictate which bits from
	 * `_reg_l` should be cleared.  Similarly, the set bits in
	 * the top word of `_val` dictate which bits from `_reg_h`
	 * should be cleared.  If either the bottom or top word of
	 * `_val` is zero, the corresponding BIC operation is skipped.
	 */
	.macro bic64_imm _reg_l, _reg_h, _val
		.if (\_val >> 32)
			bic \_reg_h, \_reg_h, #(\_val >> 32)
		.endif
		.if (\_val & 0xffffffff)
			bic \_reg_l, \_reg_l, #(\_val & 0xffffffff)
		.endif
	.endm

	/*
	 * Helper macro for carrying out division in software when
	 * hardware division is not suported. \top holds the dividend
	 * in the function call and the remainder after
	 * the function is executed. \bot holds the divisor. \div holds
	 * the quotient and \temp is a temporary registed used in calcualtion.
	 * The division algorithm has been obtained from:
	 * http://www.keil.com/support/man/docs/armasm/armasm_dom1359731155623.htm
	 */
	.macro	softudiv	div:req,top:req,bot:req,temp:req

	mov     \temp, \bot
	cmp     \temp, \top, lsr #1
div1:
	movls   \temp, \temp, lsl #1
	cmp     \temp, \top, lsr #1
	bls     div1
	mov     \div, #0

div2:
	cmp     \top, \temp
	subcs   \top, \top,\temp
	ADC     \div, \div, \div
	mov     \temp, \temp, lsr #1
	cmp     \temp, \bot
	bhs     div2
	.endm

	/*
	 * Helper macro to instruction adr <reg>, <symbol> where <symbol> is
	 * within the range +/- 4 GB.
	 */
	.macro adr_l, dst, sym
	adrp	\dst, \sym
	add	\dst, \dst, :lo12:\sym
	.endm
#endif /* ASM_MACROS_S */
