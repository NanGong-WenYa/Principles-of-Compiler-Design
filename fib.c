#include <stdio.h>
#include <stdlib.h>

#define FIB_TYPE double  // 定义 Fibonacci 数列的类型为 double
#define PRINT_FORMAT "%lf\n"  // 定义打印格式
#define ERR_MSG "Memory allocation failed\n"  // 内存分配失败的错误信息

int main() {
    int n;

    // 输入 Fibonacci 数列的长度
    scanf("%d", &n);

    // 创建一个浮点型数组来存储 Fibonacci 数列
    FIB_TYPE* fib = (FIB_TYPE*)malloc(n * sizeof(FIB_TYPE));
    if (fib == NULL) {
        fprintf(stderr, ERR_MSG);
        return 1;
    }

    // 初始值
    fib[0] = 0.0;
    if (n > 1) {
        fib[1] = 1.0;
    }

    // 计算 Fibonacci 数列
    for (int i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }

    // 输出 Fibonacci 数列
    for (int i = 0; i < n; i++) {
        printf(PRINT_FORMAT, fib[i]);
    }

    // 释放分配的内存
    free(fib);

    return 0;
}
