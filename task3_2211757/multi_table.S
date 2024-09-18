.text
.file	"multi_table.c"
.globl	printMultiplicationTable        # 声明 printMultiplicationTable 函数为全局符号
.type	printMultiplicationTable,@function
printMultiplicationTable:               # printMultiplicationTable 函数的开始
	.cfi_startproc
# %bb.0:
	pushq	%rbp                           # 保存旧的基址寄存器值
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp                      # 设置新的基址寄存器
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp                       # 为局部变量分配栈空间
	movl	$1, -4(%rbp)                    # 将变量 i 初始化为 1

.LBB0_1:                                # 外层循环的开始
	cmpl	$9, -4(%rbp)                    # 比较 i 和 9
	jg	.LBB0_8                         # 如果 i > 9 跳转到 .LBB0_8（结束）

# %bb.2:                                # 外层循环体
	movl	$1, -8(%rbp)                    # 将变量 j 初始化为 1

.LBB0_3:                                # 内层循环的开始
	movl	-8(%rbp), %eax                  # 将 j 赋值到 %eax
	cmpl	-4(%rbp), %eax                  # 比较 j 和 i
	jg	.LBB0_6                         # 如果 j > i 跳转到 .LBB0_6（打印换行）

# %bb.4:                                # 内层循环体
	movl	-8(%rbp), %esi                  # 将 j 赋值到 %esi
	movl	-4(%rbp), %edx                  # 将 i 赋值到 %edx
	movl	-4(%rbp), %ecx                  # 将 i 赋值到 %ecx
	imull	-8(%rbp), %ecx                  # 计算 i * j，结果存储到 %ecx
	movabsq	$.L.str, %rdi                   # 将格式化字符串的地址加载到 %rdi
	movb	$0, %al                         # 将 %al 设置为 0，表明没有浮点数
	callq	printf@PLT                     # 调用 printf 函数输出结果

# %bb.5:                                # 内层循环体
	movl	-8(%rbp), %eax                  # 将 j 赋值到 %eax
	addl	$1, %eax                        # j = j + 1
	movl	%eax, -8(%rbp)                  # 更新栈上的 j
	jmp	.LBB0_3                         # 跳回内层循环开始

.LBB0_6:                                # 外层循环体的结束
	movabsq	$.L.str.1, %rdi                 # 将换行符的地址加载到 %rdi
	movb	$0, %al                         # 将 %al 设置为 0，表明没有浮点数
	callq	printf@PLT                     # 调用 printf 函数输出换行符

# %bb.7:                                # 外层循环体
	movl	-4(%rbp), %eax                  # 将 i 赋值到 %eax
	addl	$1, %eax                        # i = i + 1
	movl	%eax, -4(%rbp)                  # 更新栈上的 i
	jmp	.LBB0_1                         # 跳回外层循环开始

.LBB0_8:                                # 外层循环结束的标签
	addq	$16, %rsp                       # 释放栈空间
	popq	%rbp                           # 恢复旧的基址寄存器值
	.cfi_def_cfa %rsp, 8
	retq                                  # 返回到调用函数

.Lfunc_end0:
	.size	printMultiplicationTable, .Lfunc_end0-printMultiplicationTable
	.cfi_endproc
                                        # -- End function
	.globl	main                            # 声明 main 函数为全局符号
	.type	main,@function
main:                                   # main 函数的开始
	.cfi_startproc
# %bb.0:
	pushq	%rbp                           # 保存旧的基址寄存器值
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp                      # 设置新的基址寄存器
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp                       # 为局部变量分配栈空间
	movl	$0, -4(%rbp)                    # 将局部变量初始化为 0
	callq	printMultiplicationTable        # 调用 printMultiplicationTable 函数
	xorl	%eax, %eax                      # 将返回值寄存器 %eax 清零
	addq	$16, %rsp                       # 释放栈空间
	popq	%rbp                           # 恢复旧的基址寄存器值
	.cfi_def_cfa %rsp, 8
	retq                                  # 返回到调用函数

.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d * %d = %d\t"               # 定义格式化字符串 "%d * %d = %d\t"
	.size	.L.str, 14

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"\n"                           # 定义换行符字符串 "\n"
	.size	.L.str.1, 2
