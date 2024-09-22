.option nopic                               
.text                                        
.align	1                                   
.globl	factorial                           
.type	factorial, @function                  

factorial:
	addi	sp,sp,-128                          # 分配栈空间
	sd	s0,120(sp)                           # 保存 s0 到栈上
	addi	s0,sp,128                           # 设置 s0 指针
	mv	a5,a0                                 # 将输入 n 移动到 a5
	sw	a5,-116(s0)                          # 将 n 存储到栈上
	lui	a5,%hi(.LC0)                        # 加载浮点常量的高位
	flw	fa5,%lo(.LC0)(a5)                   # 加载浮点常量
	fsw	fa5,-20(s0)                         # 将其存储到栈上
	li	a5,1                                 # 初始化结果为 1
	sw	a5,-24(s0)                          # 将 1 存储到栈上
	j	.L2                                   # 跳转到循环条件

.L3:                                          # 循环标签
	lw	a5,-24(s0)                           # 加载当前阶乘值
	fcvt.s.w	fa5,a5                           # 将整数转换为浮点数
	flw	fa4,-20(s0)                          # 加载之前的结果
	fmul.s	fa5,fa4,fa5                        # 乘法: 结果 *= i
	fsw	fa5,-20(s0)                         # 存储更新后的结果
	lw	a5,-24(s0)                           # 加载当前 i
	slli	a5,a5,2                             # 将 i 乘以 4 用于索引
	addi	a5,a5,-16                           # 调整索引以存储结果
	add	a5,a5,s0                             # 获取结果存储地址
	flw	fa5,-20(s0)                          # 加载最新结果
	fsw	fa5,-88(a5)                          # 存储到结果数组中
	lw	a5,-24(s0)                           # 加载当前 i
	addiw	a5,a5,1                             # 递增 i
	sw	a5,-24(s0)                           # 存储更新后的 i

.L2:                                          # 检查循环条件
	lw	a5,-24(s0)                           # 加载 i
	mv	a4,a5                                 # 将 i 复制到 a4
	lw	a5,-116(s0)                          # 加载 n
	sext.w	a4,a4                              # 符号扩展 i
	sext.w	a5,a5                              # 符号扩展 n
	ble	a4,a5,.L3                            # 如果 i <= n，继续循环

	flw	fa5,-20(s0)                          # 加载最终结果
	fmv.s	fa0,fa5                            # 将结果移动到 a0（返回值）
	ld	s0,120(sp)                           # 恢复保存的 s0
	addi	sp,sp,128                           # 释放栈空间
	jr	ra                                   # 从函数返回
	.size	factorial, .-factorial

.section	.rodata                            
.align	3                                   # 对齐到8字节边界
.LC1:                                         
	.string	"请输入一个非负整数: "
	.align	3
.LC2:                                         
	.string	"%d"
	.align	3
.LC3:                                         
	.string	"阶乘只适用于非负整数。"
	.align	3
.LC4:                                         
	.string	"请输入一个小于 %d 的整数。\n"
	.align	3
.LC5:                                         
	.string	"%d 的阶乘是 %.1f\n"
	.text
	.align	1
	.globl	main                               
	.type	main, @function                    

main:
	addi	sp,sp,-48                          # 分配栈空间
	sd	ra,40(sp)                           # 保存返回地址
	sd	s0,32(sp)                           # 保存 s0
	sd	s1,24(sp)                           # 保存 s1
	addi	s0,sp,48                           # 设置 s0 指针
	lui	a5,%hi(.LC1)                       # 加载输入提示的高位
	addi	a0,a5,%lo(.LC1)                   # 加载输入提示字符串的地址
	call	printf                             # 调用 printf 显示提示
	addi	a5,s0,-36                          # 准备存储输入
	mv	a1,a5                               # 将地址移动用于 scanf
	lui	a5,%hi(.LC2)                       # 加载 scanf 格式的高位
	addi	a0,a5,%lo(.LC2)                   # 加载格式字符串
	call	__isoc99_scanf                    # 调用 scanf 读取输入
	lw	a5,-36(s0)                          # 加载输入的数字
	bge	a5,zero,.L6                        # 如果数字 >= 0，继续

	lui	a5,%hi(.LC3)                       # 加载错误信息的高位
	addi	a0,a5,%lo(.LC3)                   # 加载错误信息的地址
	call	puts                              # 调用 puts 显示错误信息
	j	.L7                                  # 跳转到退出

.L6:                                          # 检查输入范围
	lw	a5,-36(s0)                          # 加载数字
	mv	a4,a5                               # 将数字移动到 a4
	li	a5,19                               # 设置阶乘的最大值
	ble	a4,a5,.L8                          # 如果数字 <= 19，继续

	li	a1,20                               # 设置 a1 为 20 用于错误信息
	lui	a5,%hi(.LC4)                       # 加载范围错误信息的高位
	addi	a0,a5,%lo(.LC4)                   # 加载格式字符串
	call	printf                             # 调用 printf 显示错误信息
	j	.L7                                  # 跳转到退出

.L8:                                          # 调用阶乘函数
	lw	s1,-36(s0)                          # 加载原始数字
	lw	a5,-36(s0)                          # 再次加载数字
	mv	a0,a5                               # 将数字移动到 a0 以调用阶乘
	call	factorial                          # 调用阶乘函数
	fmv.s	fa5,fa0                            # 将结果移动到 fa5
	fcvt.d.s	fa5,fa5                          # 将浮点数转换为双精度
	fmv.x.d	a2,fa5                            # 将双精度移动到整数以打印
	mv	a1,s1                               # 准备参数用于 printf
	lui	a5,%hi(.LC5)                       # 加载结果信息的高位
	addi	a0,a5,%lo(.LC5)                   # 加载格式字符串
	call	printf                             # 调用 printf 显示结果

.L7:                                          # 退出序列
	li	a5,0                                # 设置返回值为 0
	mv	a0,a5                               # 将返回值移动到 a0
	ld	ra,40(sp)                           # 恢复返回地址
	ld	s0,32(sp)                           # 恢复 s0
	ld	s1,24(sp)                           # 恢复 s1
	addi	sp,sp,48                           # 释放栈空间
	jr	ra                                   # 从 main 返回
	.size	main, .-main
	.section	.rodata                          # 只读数据段
	.align	2
.LC0:
	.word	1065353216                        

