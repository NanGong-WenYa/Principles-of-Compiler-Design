	.text
	.file	"fib.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI0_0:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	main
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
	subq	$32, %rsp
	movl	$0, -28(%rbp)
	movabsq	$.L.str, %rdi
	leaq	-12(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movslq	-12(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.LBB0_2
# %bb.1:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movabsq	$.L.str.1, %rsi
	movb	$0, %al
	callq	fprintf@PLT
	movl	$1, -28(%rbp)
	jmp	.LBB0_13
.LBB0_2:
	movq	-24(%rbp), %rax
	xorps	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	cmpl	$1, -12(%rbp)
	jle	.LBB0_4
# %bb.3:
	movq	-24(%rbp), %rax
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rax)
.LBB0_4:
	movl	$2, -4(%rbp)
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %ecx
	subl	$2, %ecx
	movslq	%ecx, %rcx
	addsd	(%rax,%rcx,8), %xmm0
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movsd	%xmm0, (%rax,%rcx,8)
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_5
.LBB0_8:
	movl	$0, -8(%rbp)
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB0_12
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=1
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	movabsq	$.L.str.2, %rdi
	movb	$1, %al
	callq	printf@PLT
# %bb.11:                               #   in Loop: Header=BB0_9 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_9
.LBB0_12:
	movq	-24(%rbp), %rdi
	callq	free@PLT
	movl	$0, -28(%rbp)
.LBB0_13:
	movl	-28(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Memory allocation failed\n"
	.size	.L.str.1, 26

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%lf\n"
	.size	.L.str.2, 5

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
