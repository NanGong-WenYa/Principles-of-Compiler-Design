#include <stdio.h>
#define MAX 10000
void main(){

    int i,n,f;            //定义初始变量
    i=2;
    f=1;
    scanf("%d",&n);      //函数调用
    if(n>MAX){           //条件分支           
        printf("your should input a lower word\n");
    }else {
        printf("wait for result\n");
    }
    while(i<=n){         //循环
        f=f*i;
        i=i+i;
    }
    printf("%d\n",f);
}
