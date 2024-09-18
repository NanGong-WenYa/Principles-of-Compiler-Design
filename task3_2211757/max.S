	.text
	.file	"max.c"
	.globl	max                             # 声明全局函数 max
	.p2align	4, 0x90
	.type	max,@function                   # 定义 max 函数类型
max:                                    # max 函数的开始
	.cfi_startproc                       # 函数开始标记
# %bb.0:
	pushq	%rbp                          # 保存旧的基指针
	.cfi_def_cfa_offset 16               # 设置栈帧偏移量
	.cfi_offset %rbp, -16                # 保存当前栈帧基地址
	movq	%rsp, %rbp                    # 设置当前基指针为栈顶
	.cfi_def_cfa_register %rbp           # 设置栈帧基地址为 %rbp
	movl	%edi, -8(%rbp)                # 将第一个参数 a (位于 %edi) 存入栈中 -8(%rbp)
	movl	%esi, -4(%rbp)                # 将第二个参数 b (位于 %esi) 存入栈中 -4(%rbp)
	movl	-8(%rbp), %eax                # 将 a 加载到寄存器 %eax
	cmpl	-4(%rbp), %eax                # 比较 a 和 b
	jle	.LBB0_2                        # 如果 a <= b，跳转到 .LBB0_2 (执行 b 分支)
# %bb.1:
	movl	-8(%rbp), %eax                # 如果 a > b，继续执行，将 a 放入 %eax
	movl	%eax, -12(%rbp)               # 将 %eax 的值存入 -12(%rbp) (局部变量存储区)
	jmp	.LBB0_3                        # 跳转到 .LBB0_3，结束比较
.LBB0_2:
	movl	-4(%rbp), %eax                # 如果 a <= b，将 b 的值存入 %eax
	movl	%eax, -12(%rbp)               # 将 %eax 的值存入 -12(%rbp)
.LBB0_3:
	movl	-12(%rbp), %eax               # 从 -12(%rbp) 加载结果到 %eax (a 或 b)
	popq	%rbp                          # 恢复基指针
	.cfi_def_cfa %rsp, 8
	retq                                # 返回结果
.Lfunc_end0:
	.size	max, .Lfunc_end0-max            # max 函数大小
	.cfi_endproc                         # 函数结束
                                        # max 函数结束

	.globl	main                            # 声明全局函数 main
	.p2align	4, 0x90
	.type	main,@function                  # 定义 main 函数类型
main:                                   # main 函数的开始
	.cfi_startproc                       # 函数开始标记
# %bb.0:
	pushq	%rbp                          # 保存旧的基指针
	.cfi_def_cfa_offset 16               # 设置栈帧偏移量
	.cfi_offset %rbp, -16                # 保存当前栈帧基地址
	movq	%rsp, %rbp                    # 设置当前基指针为栈顶
	.cfi_def_cfa_register %rbp           # 设置栈帧基地址为 %rbp
	subq	$16, %rsp                     # 为局部变量分配 16 字节的栈空间
	movl	$0, -12(%rbp)                 # 初始化局部变量
	movabsq	$.L.str, %rdi                 # 加载第一个字符串常量 (提示输入两个数字)
	movb	$0, %al                       # 清除 %al 寄存器
	callq	printf@PLT                     # 调用 printf 函数，输出提示信息
	movabsq	$.L.str.1, %rdi               # 加载格式字符串 "%d %d"
	leaq	-8(%rbp), %rsi                # 加载 num1 的地址 (-8(%rbp))，作为第一个参数
	leaq	-4(%rbp), %rdx                # 加载 num2 的地址 (-4(%rbp))，作为第二个参数
	movb	$0, %al                       # 清除 %al 寄存器
	callq	__isoc99_scanf@PLT            # 调用 scanf 函数，读取两个整数
	movl	-8(%rbp), %edi                # 将 num1 的值加载到 %edi，作为 max 函数的第一个参数
	movl	-4(%rbp), %esi                # 将 num2 的值加载到 %esi，作为 max 函数的第二个参数
	callq	max                           # 调用 max 函数
	movabsq	$.L.str.2, %rdi               # 加载结果格式字符串 "%d\n"
	movl	%eax, %esi                    # 将 max 的返回值存入 %esi，作为 printf 的第二个参数
	movb	$0, %al                       # 清除 %al 寄存器
	callq	printf@PLT                     # 调用 printf 函数，输出最大值
	xorl	%eax, %eax                    # 设置返回值为 0
	addq	$16, %rsp                     # 释放 16 字节的栈空间
	popq	%rbp                          # 恢复旧的基指针
	.cfi_def_cfa %rsp, 8
	retq                                # 返回
.Lfunc_end1:
	.size	main, .Lfunc_end1-main          # main 函数大小
	.cfi_endproc                         # main 函数结束
                                        # main 函数结束

	.type	.L.str,@object                  # 定义字符串常量类型
	.section	.rodata.str1.1,"aMS",@progbits,1  # 只读数据段
.L.str:
	.asciz	"请输入两个整数: "            # 定义提示字符串
	.size	.L.str, 24                     # 提示字符串大小

	.type	.L.str.1,@object                # 定义格式字符串类型
.L.str.1:
	.asciz	"%d %d"                        # 定义格式字符串，用于 scanf
	.size	.L.str.1, 6                    # 格式字符串大小

	.type	.L.str.2,@object                # 定义结果字符串类型
.L.str.2:
	.asciz	"最大值: %d\n"                 # 定义结果字符串，用于 printf 输出
	.size	.L.str.2, 18                   # 结果字符串大小
	