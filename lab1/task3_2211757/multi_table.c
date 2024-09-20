#include <stdio.h>

#define SIZE 9

// 函数定义：打印九九乘法表
void printMultiplicationTable() {
    float table[SIZE][SIZE]; // 使用二维数组存储乘法结果

    // 计算乘法表并存储结果
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j <= i; j++) {
            table[i][j] = (float)(i + 1) * (j + 1); // 使用浮点数计算
        }
    }

    // 打印乘法表
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j <= i; j++) {
            printf("%.1f * %.1f = %.1f\t", (float)(j + 1), (float)(i + 1), table[i][j]);
        }
        printf("\n");
    }
}

int main() {
    printMultiplicationTable();
    return 0;
}
