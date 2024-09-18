.text
.file	"fac.c"                              # 源文件名是 fac.c
.globl	factorial                           # 声明 factorial 函数是全局可见的
.p2align	4, 0x90                          # 对齐指令，优化性能
.type	factorial,@function                 # 声明 factorial 是一个函数
factorial:                                 # 函数 factorial 的入口
	.cfi_startproc                         # 标记函数的开始
# %bb.0:
	pushq	%rbp                           # 保存调用者的基指针
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp                     # 将栈指针保存在基指针中
	.cfi_def_cfa_register %rbp
	movl	%edi, -12(%rbp)                # 将参数 n 保存到栈中（%edi 中保存第一个参数 n）
	movl	$1, -8(%rbp)                   # 初始化 result 为 1
	movl	$1, -4(%rbp)                   # 初始化 i 为 1
.LBB0_1:                                  # 循环开始
	movl	-4(%rbp), %eax                 # 将 i 的值存入 %eax 寄存器
	cmpl	-12(%rbp), %eax                # 比较 i 和 n
	jg	.LBB0_4                         # 如果 i > n 跳转到循环结束
# %bb.2:                                  # 循环体
	movl	-4(%rbp), %eax                 # 将 i 的值存入 %eax 寄存器
	imull	-8(%rbp), %eax                 # 计算 result * i
	movl	%eax, -8(%rbp)                 # 将结果保存到 result
# %bb.3:                                  # 更新循环变量 i
	movl	-4(%rbp), %eax                 # 将 i 的值存入 %eax 寄存器
	addl	$1, %eax                       # i += 1
	movl	%eax, -4(%rbp)                 # 将更新后的 i 保存到栈中
	jmp	.LBB0_1                         # 跳转回循环开始
.LBB0_4:                                  # 循环结束
	movl	-8(%rbp), %eax                 # 将 result 的值存入 %eax
	popq	%rbp                           # 恢复调用者的基指针
	.cfi_def_cfa %rsp, 8
	retq                                 # 返回
.Lfunc_end0:
	.size	factorial, .Lfunc_end0-factorial  # 定义函数大小
	.cfi_endproc                           # 标记函数结束

# 主函数开始
.globl	main                               # 声明 main 函数是全局可见的
.p2align	4, 0x90                         # 对齐指令，优化性能
.type	main,@function                    # 声明 main 是一个函数
main:                                    # main 函数入口
	.cfi_startproc                         # 标记函数的开始
# %bb.0:
	pushq	%rbp                           # 保存调用者的基指针
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp                     # 将栈指针保存在基指针中
	.cfi_def_cfa_register %rbp
	pushq	%rbx                           # 保存 %rbx 寄存器的值
	pushq	%rax                           # 保存 %rax 寄存器的值
	.cfi_offset %rbx, -24
	movl	$0, -16(%rbp)                  # 初始化 number 变量
	movabsq	$.L.str, %rdi                  # 加载第一个字符串常量到 %rdi，作为 printf 的参数
	movb	$0, %al                        # 清除 %al 寄存器
	callq	printf@PLT                     # 调用 printf 打印提示信息
	movabsq	$.L.str.1, %rdi                # 加载第二个字符串常量到 %rdi，作为 scanf 的格式化字符串
	leaq	-12(%rbp), %rsi                # 计算 number 变量的地址，并存入 %rsi
	movb	$0, %al                        # 清除 %al 寄存器
	callq	__isoc99_scanf@PLT             # 调用 scanf 获取用户输入
	cmpl	$0, -12(%rbp)                  # 检查 number 是否为非负数
	jge	.LBB1_2                         # 如果 number >= 0，跳转到计算阶乘部分
# %bb.1:
	movabsq	$.L.str.2, %rdi                # 加载错误消息字符串到 %rdi
	movb	$0, %al                        # 清除 %al 寄存器
	callq	printf@PLT                     # 打印错误消息
	jmp	.LBB1_3                         # 跳转到程序结束部分
.LBB1_2:                                  # 计算阶乘部分
	movl	-12(%rbp), %ebx                # 将 number 的值存入 %ebx
	movl	-12(%rbp), %edi                # 将 number 的值作为 factorial 的参数
	callq	factorial                      # 调用 factorial 函数
	movabsq	$.L.str.3, %rdi                # 加载输出格式字符串到 %rdi
	movl	%ebx, %esi                     # 将原始 number 的值作为输出的第一个参数
	movl	%eax, %edx                     # 将 factorial 的结果作为输出的第二个参数
	movb	$0, %al                        # 清除 %al 寄存器
	callq	printf@PLT                     # 打印阶乘结果
.LBB1_3:                                  # 程序结束部分
	xorl	%eax, %eax                     # 返回 0
	addq	$8, %rsp                       # 恢复栈指针
	popq	%rbx                           # 恢复 %rbx 寄存器的值
	popq	%rbp                           # 恢复调用者的基指针
	.cfi_def_cfa %rsp, 8
	retq                                 # 返回
.Lfunc_end1:
	.size	main, .Lfunc_end1-main           # 定义函数大小
	.cfi_endproc                           # 标记函数结束

# 字符串常量部分
.type	.L.str,@object                     # 字符串类型定义
.section	.rodata.str1.1,"aMS",@progbits,1  # 只读数据段
.L.str:                                    # 定义第一个字符串（提示信息）
	.size	.L.str, 24                      # 字符串大小

.type	.L.str.1,@object                   # 字符串类型定义
.L.str.1:                                  # 定义第二个字符串（scanf 格式化字符串）
	.asciz	"%d"                           # "%d"
	.size	.L.str.1, 3                     # 字符串大小


.type	.L.str.3,@object                   # 结果输出格式字符串定义
.L.str.3:
	.size	.L.str.3, 20                    # 字符串大小


