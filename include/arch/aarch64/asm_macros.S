/*
 * Copyright (c) 2013-2025, Arm Limited and Contributors. All rights reserved.
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
 * errata 813419 of Cortex-A57 or errata 1286807 of Cortex-A76.
 */
#if ERRATA_A57_813419 || ERRATA_A76_1286807
#define TLB_INVALIDATE(_type) \
	tlbi	_type; \
	dsb	ish; \
	tlbi	_type
#else
#define TLB_INVALIDATE(_type) \
	tlbi	_type
#endif


	/*
	 * Create a stack frame at the start of an assembly function. Will also
	 * add all necessary call frame information (cfi) directives for a
	 * pretty stack trace. This is necessary as there is quite a bit of
	 * flexibility within a stack frame and the stack pointer can move
	 * around throughout the function. If the debugger isn't told where to
	 * find things, it gets lost, gives up and displays nothing. So inform
	 * the debugger of what's where. Anchor the Canonical Frame Address
	 * (CFA; the thing used to track what's where) to the frame pointer as
	 * that's not expected to change in the function body and no extra
	 * bookkeeping will be necessary, allowing free movement of the sp
	 *
	 *   _frame_size: requested space for caller to use. Must be a mutliple
	 *     of 16 for stack pointer alignment
	 */
	.macro	func_prologue _frame_size=0
	.if \_frame_size & 0xf
	.error "frame_size must have stack pointer alignment (multiple of 16)"
	.endif

	/* put frame record at top of frame */
	stp	x29, x30, [sp, #-0x10]!
	mov	x29,sp
	.if \_frame_size
	sub	sp, sp, #\_frame_size
	.endif

	/* point CFA to start of frame record, i.e. x29 + 0x10 */
	.cfi_def_cfa	x29,  0x10
	/* inform it about x29, x30 locations */
	.cfi_offset	x30, -0x8
	.cfi_offset	x29, -0x10
	.endm

	/*
	 * Clear stack frame at the end of an assembly function.
	 *
	 *   _frame_size: the value passed to func_prologue
	 */
	.macro	func_epilogue _frame_size=0
	/* remove requested space */
	.if \_frame_size
	add	sp, sp, #\_frame_size
	.endif
	ldp	x29, x30, [sp], #0x10
	.endm


	.macro	dcache_line_size  reg, tmp
	mrs	\tmp, ctr_el0
	ubfx	\tmp, \tmp, #16, #4
	mov	\reg, #4
	lsl	\reg, \reg, \tmp
	.endm


	.macro	icache_line_size  reg, tmp
	mrs	\tmp, ctr_el0
	and	\tmp, \tmp, #0xf
	mov	\reg, #4
	lsl	\reg, \reg, \tmp
	.endm


	.macro	smc_check  label
	mrs	x0, esr_el3
	ubfx	x0, x0, #ESR_EC_SHIFT, #ESR_EC_LENGTH
	cmp	x0, #EC_AARCH64_SMC
	b.ne	$label
	.endm

	/*
	 * Declare the exception vector table, enforcing it is aligned on a
	 * 2KB boundary, as required by the ARMv8 architecture.
	 * Use zero bytes as the fill value to be stored in the padding bytes
	 * so that it inserts illegal AArch64 instructions. This increases
	 * security, robustness and potentially facilitates debugging.
	 */
	.macro vector_base  label, section_name=.vectors
	.section \section_name, "ax"
	.align 11, 0
	\label:
	.endm

	/*
	 * Create an entry in the exception vector table, enforcing it is
	 * aligned on a 128-byte boundary, as required by the ARMv8 architecture.
	 * Use zero bytes as the fill value to be stored in the padding bytes
	 * so that it inserts illegal AArch64 instructions. This increases
	 * security, robustness and potentially facilitates debugging.
	 */
	.macro vector_entry  label, section_name=.vectors
	.cfi_sections .debug_frame
	.section \section_name, "ax"
	.align 7, 0
	.type \label, %function
	.cfi_startproc
	\label:
	.endm

	/*
	 * Add the bytes until fill the full exception vector, whose size is always
	 * 32 instructions. If there are more than 32 instructions in the
	 * exception vector then an error is emitted.
	 */
	.macro end_vector_entry label
	.cfi_endproc
	.fill	\label + (32 * 4) - .
	.endm

	/*
	 * This macro calculates the base address of the current CPU's MP stack
	 * using the plat_my_core_pos() index, the name of the stack storage
	 * and the size of each stack
	 * Out: X0 = physical address of stack base
	 * Clobber: X30, X1, X2
	 */
	.macro get_my_mp_stack _name, _size
	bl	plat_my_core_pos
	adrp	x2, (\_name + \_size)
	add	x2, x2, :lo12:(\_name + \_size)
	mov x1, #\_size
	madd x0, x0, x1, x2
	.endm

	/*
	 * This macro calculates the base address of a UP stack using the
	 * name of the stack storage and the size of the stack
	 * Out: X0 = physical address of stack base
	 */
	.macro get_up_stack _name, _size
	adrp	x0, (\_name + \_size)
	add	x0, x0, :lo12:(\_name + \_size)
	.endm

	/*
	 * Helper macro to generate the best mov/movk combinations according
	 * the value to be moved. The 16 bits from '_shift' are tested and
	 * if not zero, they are moved into '_reg' without affecting
	 * other bits.
	 */
	.macro _mov_imm16 _reg, _val, _shift
		.if (\_val >> \_shift) & 0xffff
			.if (\_val & (1 << \_shift - 1))
				movk	\_reg, (\_val >> \_shift) & 0xffff, LSL \_shift
			.else
				mov	\_reg, \_val & (0xffff << \_shift)
			.endif
		.endif
	.endm

	/*
	 * Helper macro to load arbitrary values into 32 or 64-bit registers
	 * which generates the best mov/movk combinations. Many base addresses
	 * are 64KB aligned the macro will eliminate updating bits 15:0 in
	 * that case
	 */
	.macro mov_imm _reg, _val
		.if (\_val) == 0
			mov	\_reg, #0
		.else
			_mov_imm16	\_reg, (\_val), 0
			_mov_imm16	\_reg, (\_val), 16
			_mov_imm16	\_reg, (\_val), 32
			_mov_imm16	\_reg, (\_val), 48
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
	 * Helper macro to read system register value into x0
	 */
	.macro	read reg:req
#if ENABLE_BTI
	bti	j
#endif
	mrs	x0, \reg
	ret
	.endm

	/*
	 * Helper macro to write value from x1 to system register
	 */
	.macro	write reg:req
#if ENABLE_BTI
	bti	j
#endif
	msr	\reg, x1
	ret
	.endm

	/*
	 * The "sb" instruction was introduced later into the architecture,
	 * so not all toolchains understand it. Some deny its usage unless
	 * a supported processor is specified on the build command line.
	 * Use sb's system register encoding to work around this, we already
	 * guard the sb execution with a feature flag.
	 */

	.macro sb_barrier_insn
	msr	SYSREG_SB, xzr
	.endm

	.macro psb_csync
	hint #17 /* use the hint synonym for compatibility */
	.endm

	.macro tsb_csync
	hint #18 /* use the hint synonym for compatibility */
	.endm

	/*
	 * Macro for using speculation barrier instruction introduced by
	 * FEAT_SB, if it's enabled.
	 */
	.macro speculation_barrier
#if ENABLE_FEAT_SB
	sb_barrier_insn
#else
	dsb	sy
	isb
#endif
	.endm

	/*
	 * Macro for mitigating against speculative execution beyond ERET. Uses the
	 * speculation barrier instruction introduced by FEAT_SB, if it's enabled.
	 */
	.macro exception_return
	eret
#if ENABLE_FEAT_SB
	sb_barrier_insn
#else
	dsb	nsh
	isb
#endif
	.endm

	/*
	 * Macro to unmask External Aborts by changing PSTATE.A bit.
	 * Put explicit synchronization event to ensure newly unmasked interrupt
	 * is taken immediately.
	 */
	.macro  unmask_async_ea
	msr     daifclr, #DAIF_ABT_BIT
	isb
	.endm

	/* Macro for error synchronization on exception boundries.
	 * With FEAT_RAS enabled, it is assumed that FEAT_IESB is also present
	 * and enabled.
	 * FEAT_IESB provides an implicit error synchronization event at exception
	 * entry and exception return, so there is no need for any explicit instruction.
	 */
	.macro synchronize_errors
#if !ENABLE_FEAT_RAS
	/* Complete any stores that may return an abort */
	dsb	sy
	/* Synchronise the CPU context with the completion of the dsb */
	isb
#endif
	.endm

	/*
	 * Helper macro to instruction adr <reg>, <symbol> where <symbol> is
	 * within the range +/- 4 GB.
	 */
	.macro adr_l, dst, sym
	adrp	\dst, \sym
	add	\dst, \dst, :lo12:\sym
	.endm

	/*
	* is_feat_XYZ_present_asm - Set flags and reg if FEAT_XYZ
	* is enabled at runtime.
	*
	* Arguments:
	* reg: Register for temporary use.
	*
	* Clobbers: reg
	*/
	.macro is_feat_sysreg128_present_asm reg:req
	mrs	\reg, ID_AA64ISAR2_EL1
	ands	\reg, \reg, #(ID_AA64ISAR2_SYSREG128_MASK << ID_AA64ISAR2_SYSREG128_SHIFT)
	.endm

	.macro is_feat_pauth_present_asm reg:req, clobber:req
	mrs	\reg, ID_AA64ISAR1_EL1
	mov_imm	\clobber, ((ID_AA64ISAR1_GPI_MASK << ID_AA64ISAR1_GPI_SHIFT) \
			 | (ID_AA64ISAR1_GPA_MASK << ID_AA64ISAR1_GPA_SHIFT) \
			 | (ID_AA64ISAR1_API_MASK << ID_AA64ISAR1_API_SHIFT) \
			 | (ID_AA64ISAR1_APA_MASK << ID_AA64ISAR1_APA_SHIFT))
	tst	\reg, \clobber
	.endm

.macro call_reset_handler
#if !(defined(IMAGE_BL2) && ENABLE_RME)
	/* ---------------------------------------------------------------------
	 * It is a cold boot.
	 * Perform any processor specific actions upon reset e.g. cache, TLB
	 * invalidations etc.
	 * ---------------------------------------------------------------------
	 */
	/* The plat_reset_handler can clobber x0 - x18, x30 */
	bl	plat_reset_handler

	/* Get the matching cpu_ops pointer */
	bl	get_cpu_ops_ptr

	/* Get the cpu_ops reset handler */
	ldr	x2, [x0, #CPU_RESET_FUNC]

	/* The cpu_ops reset handler can clobber x0 - x19, x30 */
	blr	x2
#endif
.endm
#endif /* ASM_MACROS_S */
