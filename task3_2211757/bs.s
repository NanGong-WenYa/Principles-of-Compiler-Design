.text
.align 1
.globl bubbleSort
.type bubbleSort, @function
bubbleSort:
    addi sp, sp, -48             # 为栈帧分配空间
    sd s0, 40(sp)                # 保存 s0 寄存器
    addi s0, sp, 48              # 设置 s0 指向栈帧顶部
    sd a0, -40(s0)               # 保存数组指针
    mv a5, a1                    # 将数组长度存入 a5
    sw a5, -44(s0)               # 保存长度
    sw zero, -20(s0)             # 初始化外层循环计数器为 0
    j .L2                        # 跳转到外层循环判断

.L7:
    sw zero, -24(s0)             # 初始化内层循环计数器为 0
    j .L3                        # 跳转到内层循环判断

.L6:
    lw a5, -24(s0)               # 读取内层循环计数器
    slli a5, a5, 2               # 乘以 4 以获得字节偏移
    ld a4, -40(s0)               # 加载数组指针
    add a5, a4, a5               # 计算 arr[i]
    flw fa4, 0(a5)               # 加载 arr[i] 到 fa4
    lw a5, -24(s0)               # 读取内层循环计数器
    addi a5, a5, 1                # i + 1
    slli a5, a5, 2               # 乘以 4 以获得字节偏移
    ld a4, -40(s0)               # 加载数组指针
    add a5, a4, a5               # 计算 arr[i + 1]
    flw fa5, 0(a5)               # 加载 arr[i + 1] 到 fa5
    fgt.s a5, fa4, fa5           # 比较 arr[i] 和 arr[i + 1]
    beq a5, zero, .L4            # 如果 arr[i] <= arr[i + 1]，跳转

    lw a5, -24(s0)               # 读取内层循环计数器
    slli a5, a5, 2               # 乘以 4 以获得字节偏移
    ld a4, -40(s0)               # 加载数组指针
    add a5, a4, a5               # 计算 arr[i]
    flw fa5, 0(a5)               # 加载 arr[i] 到 fa5
    fsw fa5, -28(s0)             # 保存 arr[i] 到临时存储

    lw a5, -24(s0)               # 读取内层循环计数器
    addi a5, a5, 1                # i + 1
    slli a5, a5, 2               # 乘以 4 以获得字节偏移
    ld a4, -40(s0)               # 加载数组指针
    add a4, a4, a5               # 计算 arr[i + 1]
    lw a5, -24(s0)               # 读取内层循环计数器
    slli a5, a5, 2               # 乘以 4 以获得字节偏移
    ld a3, -40(s0)               # 加载数组指针
    add a5, a3, a5               # 计算 arr[i]
    flw fa5, 0(a4)               # 加载 arr[i + 1] 到 fa5
    fsw fa5, 0(a5)               # 交换 arr[i] 和 arr[i + 1]

.L4:
    lw a5, -24(s0)               # 读取内层循环计数器
    addiw a5, a5, 1              # 计数器 +1
    sw a5, -24(s0)               # 存储内层循环计数器

.L3:
    lw a5, -44(s0)               # 加载数组长度
    mv a4, a5                    # 存储长度
    lw a5, -20(s0)               # 读取外层循环计数器
    subw a5, a4, a5               # 计算 n - i
    sext.w a5, a5                # 符号扩展
    addiw a5, a5, -1             # n - i - 1
    sext.w a4, a5                # 符号扩展
    lw a5, -24(s0)               # 读取内层循环计数器
    sext.w a5, a5                # 符号扩展
    blt a5, a4, .L6              # 如果 j < n - i，继续内层循环

    lw a5, -20(s0)               # 读取外层循环计数器
    addiw a5, a5, 1              # 外层循环计数器 +1
    sw a5, -20(s0)               # 存储外层循环计数器

.L2:
    lw a5, -44(s0)               # 加载数组长度
    addiw a5, a5, -1             # n - 1
    sext.w a4, a5                # 符号扩展
    lw a5, -20(s0)               # 读取外层循环计数器
    sext.w a5, a5                # 符号扩展
    blt a5, a4, .L7              # 如果 i < n - 1，继续外层循环

    nop
    nop
    ld s0, 40(sp)                # 恢复 s0 寄存器
    addi sp, sp, 48              # 释放栈空间
    jr ra                        # 返回

.size bubbleSort, .-bubbleSort
.section .rodata
.align 3
.LC0:
    .string "Enter the number of elements: "
.align 3
.LC1:
    .string "%d"
.align 3
.LC2:
    .string "Please enter %d floating-point numbers:\n"
.align 3
.LC3:
    .string "%f"
.align 3
.LC4:
    .string "Sorted array:"
.align 3
.LC5:
    .string "%.2f "
.text
.align 1
.globl main
.type main, @function
main:
    addi sp, sp, -128            # 为栈帧分配空间
    sd ra, 120(sp)               # 保存返回地址
    sd s0, 112(sp)               # 保存 s0
    sd s1, 104(sp)               # 保存 s1
    sd s2, 96(sp)                # 保存 s2
    sd s3, 88(sp)                # 保存 s3
    sd s4, 80(sp)                # 保存 s4
    sd s5, 72(sp)                # 保存 s5
    sd s6, 64(sp)                # 保存 s6
    sd s7, 56(sp)                # 保存 s7
    sd s8, 48(sp)                # 保存 s8
    sd s9, 40(sp)                # 保存 s9

    addi s0, sp, 128             # 设置 s0 指向栈帧顶部
    mv a5, sp                    # 获取当前栈指针
    mv s1, a5                    # 保存栈指针

    lui a5, %hi(.LC0)            # 加载字符串地址
    addi a0, a5, %lo(.LC0)      # 设置 printf 的参数
    call printf                  # 打印提示信息

    addi a5, s0, -124            # 设置存储输入长度的地址
    mv a1, a5                    # 保存数组长度的地址
    lui a5, %hi(.LC1)            # 加载格式字符串地址
    addi a0, a5, %lo(.LC1)      # 设置 scanf 的参数
    call __isoc99_scanf          # 读取用户输入的数组长度

    lw a5, -124(s0)              # 获取输入的数组长度
    mv a4, a5                    # 存储数组长度
    addi a4, a4, -1              # 减去 1，准备存储
    sd a4, -112(s0)              # 保存数组长度
    mv a4, a5                    # 继续使用数组长度
    mv s8, a4                    # 将长度存入 s8
    li s9, 0                     # 初始化索引

    srli a4, s8, 59              # 计算所需栈空间
    slli s5, s9, 5               # 计算空间偏移
    or s5, a4, s5                # 合并空间
    slli a4, s8, 5               # 计算总空间
    mv a4, a5                    # 继续使用数组长度
    mv s6, a4                    # 将长度存入 s6

    li s7, 0                     # 初始化索引
    srli a4, s6, 59              # 计算所需栈空间
    slli s3, s7, 5               # 计算空间偏移
    or s3, a4, s3                # 合并空间
    slli s2, s6, 5               # 计算总空间
    slli a5, a5, 2               # 转换为字节
    addi a5, a5, 15               # 调整空间
    srli a5, a5, 4               # 计算空间
    slli a5, a5, 4               # 转换为字节
    sub sp, sp, a5               # 更新栈指针
    mv a5, sp                    # 更新栈指针

    addi a5, a5, 3               # 对齐
    srli a5, a5, 2               # 转换为字节
    slli a5, a5, 2               # 转换为字节
    sd a5, -120(s0)              # 保存数组指针

    lw a5, -124(s0)              # 获取数组长度
    mv a1, a5                    # 将长度存储
    lui a5, %hi(.LC2)            # 加载提示信息地址
    addi a0, a5, %lo(.LC2)      # 设置 printf 的参数
    call printf                  # 打印提示信息

    sw zero, -100(s0)            # 初始化输入计数器
    j .L10                       # 跳转到输入循环

.L11:
    lw a5, -100(s0)              # 获取输入计数器
    slli a5, a5, 2               # 乘以 4 以获得字节偏移
    ld a4, -120(s0)              # 加载数组指针
    add a5, a4, a5               # 计算 arr[i]
    mv a1, a5                    # 设置 scanf 的参数
    lui a5, %hi(.LC3)            # 加载格式字符串地址
    addi a0, a5, %lo(.LC3)      # 设置 scanf 的参数
    call __isoc99_scanf          # 读取用户输入的浮点数

    lw a5, -100(s0)              # 获取输入计数器
    addiw a5, a5, 1              # 计数器 +1
    sw a5, -100(s0)              # 存储输入计数器

.L10:
    lw a4, -124(s0)              # 获取数组长度
    lw a5, -100(s0)              # 获取输入计数器
    sext.w a5, a5                # 符号扩展
    blt a5, a4, .L11             # 如果输入计数 < 数组长度，继续输入

    lw a5, -124(s0)              # 获取数组长度
    mv a1, a5                    # 存储数组长度
    ld a0, -120(s0)              # 加载数组指针
    call bubbleSort              # 调用冒泡排序

    lui a5, %hi(.LC4)            # 加载提示信息地址
    addi a0, a5, %lo(.LC4)      # 设置 printf 的参数
    call puts                    # 打印排序完成提示

    sw zero, -104(s0)            # 初始化输出计数器
    j .L12                       # 跳转到输出循环

.L13:
    ld a4, -120(s0)              # 加载数组指针
    lw a5, -104(s0)              # 获取输出计数器
    slli a5, a5, 2               # 乘以 4 以获得字节偏移
    add a5, a4, a5               # 计算 arr[i]
    flw fa5, 0(a5)               # 加载 arr[i] 到 fa5
    fcvt.d.s fa5, fa5            # 转换为双精度浮点数
    fmv.x.d a1, fa5              # 将双精度浮点数存入 a1

    lui a5, %hi(.LC5)            # 加载格式字符串地址
    addi a0, a5, %lo(.LC5)      # 设置 printf 的参数
    call printf                  # 打印浮点数

    lw a5, -104(s0)              # 获取输出计数器
    addiw a5, a5, 1              # 计数器 +1
    sw a5, -104(s0)              # 存储输出计数器

.L12:
    lw a4, -124(s0)              # 获取数组长度
    lw a5, -104(s0)              # 获取输出计数器
    sext.w a5, a5                # 符号扩展
    blt a5, a4, .L13             # 如果输出计数 < 数组长度，继续输出

    li a0, 10                    # 输出换行
    call putchar

    li a5, 0                     # 返回值 0
    mv sp, s1                    # 恢复栈指针
    mv a0, a5                    # 设置返回值
    addi sp, s0, -128            # 释放栈空间

    ld ra, 120(sp)               # 恢复返回地址
    ld s0, 112(sp)               # 恢复 s0
    ld s1, 104(sp)               # 恢复 s1
    ld s2, 96(sp)                # 恢复 s2
    ld s3, 88(sp)                # 恢复 s3
    ld s4, 80(sp)                # 恢复 s4
    ld s5, 72(sp)                # 恢复 s5
    ld s6, 64(sp)                # 恢复 s6
    ld s7, 56(sp)                # 恢复 s7
    ld s8, 48(sp)                # 恢复 s8
    ld s9, 40(sp)                # 恢复 s9
    addi sp, sp, 128             # 恢复栈空间
    jr ra                        # 返回
