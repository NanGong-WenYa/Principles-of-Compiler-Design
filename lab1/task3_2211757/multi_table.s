.text
.section	.rodata
.align	3
.LC0:                                       # 格式化字符串
	.string	"%.1f * %.1f = %.1f\t"        # 乘法表输出格式
.text
.align	1
.globl	printMultiplicationTable            # 导出 printMultiplicationTable 函数
.type	printMultiplicationTable, @function
printMultiplicationTable:                    # 乘法表函数
	addi	sp, sp, -368                    # 为栈帧分配 368 字节空间
	sd	ra, 360(sp)                        # 保存返回地址 ra
	sd	s0, 352(sp)                        # 保存 s0 寄存器
	addi	s0, sp, 368                      # 设置 s0 指向栈帧顶部
	sw	zero, -20(s0)                     # 初始化外层循环计数器为 0
	j	.L2                                 # 跳转到外层循环

.L5:                                         # 外层循环标签
	sw	zero, -24(s0)                     # 初始化内层循环计数器为 0
	j	.L3                                 # 跳转到内层循环

.L4:                                         # 内层循环标签
	lw	a5, -20(s0)                        # 加载外层循环计数器 i
	addiw	a5, a5, 1                        # i + 1
	sext.w	a5, a5                          # 符号扩展
	fcvt.s.w	fa4, a5                        # 将 i 转换为浮点数
	lw	a5, -24(s0)                        # 加载内层循环计数器 j
	addiw	a5, a5, 1                        # j + 1
	sext.w	a5, a5                          # 符号扩展
	fcvt.s.w	fa5, a5                        # 将 j 转换为浮点数
	fmul.s	fa5, fa4, fa5                   # 计算 i * j

	lw	a3, -24(s0)                        # 加载内层循环计数器 j
	lw	a4, -20(s0)                        # 加载外层循环计数器 i
	mv	a5, a4                            # 计算地址偏移
	slli	a5, a5, 3                        # i * 8（每个浮点数 8 字节）
	add	a5, a5, a4                        # 地址偏移
	add	a5, a5, a3                        # j * 8（每个浮点数 8 字节）
	slli	a5, a5, 2                        # 乘以 4 转换为字节
	addi	a5, a5, -16                       # 调整地址
	add	a5, a5, s0                        # 计算最终存储地址
	fsw	fa5, -344(a5)                     # 存储结果到数组中

	lw	a5, -24(s0)                        # 更新内层循环计数器
	addiw	a5, a5, 1                        # j + 1
	sw	a5, -24(s0)                        # 存储更新后的内层计数器

.L3:                                         # 内层循环判断
	lw	a5, -24(s0)                        # 加载内层循环计数器 j
	mv	a4, a5                            # 将 j 赋值给 a4
	lw	a5, -20(s0)                        # 加载外层循环计数器 i
	sext.w	a4, a4                          # 符号扩展 j
	sext.w	a5, a5                          # 符号扩展 i
	ble	a4, a5, .L4                       # 如果 j <= i，继续内层循环

	lw	a5, -20(s0)                        # 更新外层循环计数器
	addiw	a5, a5, 1                        # i + 1
	sw	a5, -20(s0)                        # 存储更新后的外层计数器

.L2:                                         # 外层循环判断
	lw	a5, -20(s0)                        # 加载外层循环计数器 i
	sext.w	a4, a5                          # 符号扩展 i
	li	a5, 8                              # 乘法表的最大值
	ble	a4, a5, .L5                       # 如果 i <= 8，继续外层循环

	sw	zero, -28(s0)                     # 初始化内层循环输出计数器为 0
	j	.L6                                 # 跳转到输出循环

.L9:                                         # 输出循环标签
	sw	zero, -32(s0)                     # 初始化输出计数器为 0
	j	.L7                                 # 跳转到输出处理

.L8:                                         # 输出处理标签
	lw	a5, -32(s0)                        # 加载输出计数器
	addiw	a5, a5, 1                        # 输出计数器 +1
	sext.w	a5, a5                          # 符号扩展
	fcvt.s.w	fa5, a5                        # 将输出计数器转换为浮点数
	fcvt.d.s	fa4, fa5                       # 转换为双精度浮点数
	lw	a5, -28(s0)                        # 加载内层循环计数器
	addiw	a5, a5, 1                        # 内层循环计数器 +1
	sext.w	a5, a5                          # 符号扩展
	fcvt.s.w	fa5, a5                        # 将内层循环计数器转换为浮点数
	fcvt.d.s	fa3, fa5                       # 转换为双精度浮点数
	lw	a3, -32(s0)                        # 加载输出计数器
	lw	a4, -28(s0)                        # 加载内层循环计数器
	mv	a5, a4                            # 计算存储位置
	slli	a5, a5, 3                        # 内层循环计数器 * 8
	add	a5, a5, a4                        # 计算地址偏移
	add	a5, a5, a3                        # 加上输出计数器
	slli	a5, a5, 2                        # 转换为字节
	addi	a5, a5, -16                       # 调整地址
	add	a5, a5, s0                        # 计算最终存储地址
	flw	fa5, -344(a5)                     # 加载计算结果
	fcvt.d.s	fa5, fa5                      # 转换为双精度浮点数
	fmv.x.d	a3, fa5                        # 将结果存入 a3
	fmv.x.d	a2, fa3                        # 将 a3 存入 a2
	fmv.x.d	a1, fa4                        # 将 a4 存入 a1
	lui	a5, %hi(.LC0)                     # 加载格式字符串地址
	addi	a0, a5, %lo(.LC0)                # 设置 printf 的参数
	call	printf                            # 打印结果

	lw	a5, -32(s0)                        # 更新输出计数器
	addiw	a5, a5, 1                        # 输出计数器 +1
	sw	a5, -32(s0)                        # 存储更新后的输出计数器

.L7:                                         # 输出判断
	lw	a5, -32(s0)                        # 加载输出计数器
	mv	a4, a5                            # 将输出计数器赋值给 a4
	lw	a5, -28(s0)                        # 加载内层循环计数器
	sext.w	a4, a4                          # 符号扩展输出计数器
	sext.w	a5, a5                          # 符号扩展内层循环计数器
	ble	a4, a5, .L8                       # 如果输出计数 <= 内层循环计数，继续输出

	li	a0, 10                             # 输出换行符
	call	putchar                           # 输出换行

	lw	a5, -28(s0)                        # 加载内层循环计数器
	addiw	a5, a5, 1                        # 内层循环计数器 +1
	sw	a5, -28(s0)                        # 存储更新后的内层计数器

.L6:                                         # 输出判断
	lw	a5, -28(s0)                        # 加载内层循环计数器
	sext.w	a4, a5                          # 符号扩展内层循环计数器
	li	a5, 8                              # 最大输出计数
	ble	a4, a5, .L9                       # 如果内层循环计数 <= 8，继续输出

	nop                                     # 空操作，保持流水线
	nop                                     # 空操作，保持流水线

	ld	ra, 360(sp)                        # 恢复返回地址 ra
	ld	s0, 352(sp)                        # 恢复 s0 寄存器
	addi	sp, sp, 368                      # 释放栈空间
	jr	ra                                 # 返回

	.size	printMultiplicationTable, .-printMultiplicationTable
	.align	1
	.globl	main                              # 导出 main 函数
	.type	main, @function
main:                                        # 主函数
	addi	sp, sp, -16                       # 为主函数分配栈空间
	sd	ra, 8(sp)                          # 保存返回地址 ra
	sd	s0, 0(sp)                          # 保存 s0 寄存器
	addi	s0, sp, 16                        # 设置 s0 指向栈帧顶部
	call	printMultiplicationTable          # 调用乘法表函数
	li	a5, 0                              # 设置返回值 0
	mv	a0, a5                             # 将返回值赋给 a0
	ld	ra, 8(sp)                          # 恢复返回地址 ra
	ld	s0, 0(sp)                          # 恢复 s0 寄存器
	addi	sp, sp, 16                        # 释放栈空间
	jr	ra                                 # 返回

