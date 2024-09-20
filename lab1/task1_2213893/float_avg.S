	.text
	.file	"float_avg.ll"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$824, %rsp                      # imm = 0x338
	.cfi_offset %rbx, -24
	movabsq	$.L.str, %rdi
	movl	$100, %esi
	movb	$0, %al
	callq	printf@PLT
	movabsq	$.L.str.1, %rdi
	leaq	-16(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	cmpl	$100, -16(%rbp)
	jle	.LBB0_2
# %bb.1:
	movabsq	$.L.str.2, %rdi
	movl	$100, %esi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB0_7
.LBB0_2:
	movl	-16(%rbp), %esi
	movabsq	$.L.str.3, %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$0, -12(%rbp)
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movl	-12(%rbp), %ebx
	movl	%ebx, %esi
	addl	$1, %esi
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf@PLT
	movslq	%ebx, %rax
	leaq	-832(%rbp), %rsi
	shlq	$3, %rax
	addq	%rax, %rsi
	movabsq	$.L.str.5, %rdi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB0_3
.LBB0_6:
	leaq	-832(%rbp), %rdi
	movl	-16(%rbp), %esi
	callq	calculateAverage
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	movabsq	$.L.str.6, %rdi
	movb	$1, %al
	callq	printf@PLT
.LBB0_7:
	xorl	%eax, %eax
	addq	$824, %rsp                      # imm = 0x338
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	calculateAverage                # -- Begin function calculateAverage
	.p2align	4, 0x90
	.type	calculateAverage,@function
calculateAverage:                       # @calculateAverage
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movl	%esi, -8(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	$0, -4(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	addsd	-16(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	cmpl	$0, -8(%rbp)
	jle	.LBB1_6
# %bb.5:
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	cvtsi2sdl	-8(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	jmp	.LBB1_7
.LBB1_6:
	xorps	%xmm0, %xmm0
	jmp	.LBB1_7
.LBB1_7:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	calculateAverage, .Lfunc_end1-calculateAverage
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Enter the number of elements (max %d): "
	.size	.L.str, 40

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%d"
	.size	.L.str.1, 3

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Error: The number of elements cannot exceed %d.\n"
	.size	.L.str.2, 49

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Enter %d floating-point numbers:\n"
	.size	.L.str.3, 34

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Number %d: "
	.size	.L.str.4, 12

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"%lf"
	.size	.L.str.5, 4

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"The average is: %f\n"
	.size	.L.str.6, 20

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
