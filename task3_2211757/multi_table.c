#include <stdio.h>

// 函数定义：打印九九乘法表
void printMultiplicationTable() {
    for (int i = 1; i <= 9; i++) {
        for (int j = 1; j <= i; j++) {
            printf("%d * %d = %d\t", j, i, i * j);
        }
        printf("\n");
    }
}

int main() {
    printMultiplicationTable();
    return 0;
}
