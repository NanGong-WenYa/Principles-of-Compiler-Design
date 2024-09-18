#include <stdio.h>

// 函数定义：计算n的阶乘
int factorial(int n) {
    int result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int number;
    
    printf("请输入一个整数: ");
    scanf("%d", &number);
    
    if (number < 0) {
        printf("阶乘只适用于非负整数。\n");
    } else {
        printf("%d 的阶乘是 %d\n", number, factorial(number));
    }
    
    return 0;
}
