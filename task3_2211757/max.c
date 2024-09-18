#include <stdio.h>

// 函数定义：返回两个数中的最大值
int max(int a, int b) {
    if (a > b)
        return a;
    else
        return b;
}

int main() {
    int num1, num2;
    
    printf("请输入两个整数: ");
    scanf("%d %d", &num1, &num2);
    
    printf("最大值是: %d\n", max(num1, num2));
    
    return 0;
}
