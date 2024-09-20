#include <stdio.h>

#define MAX_SIZE 20 


float factorial(int n) {
    float result = 1.0f;
    float results[MAX_SIZE];

  
    for (int i = 1; i <= n; i++) {
        result *= i; 
        results[i] = result; 
    }

    return result; 
}

int main() {
    int number;

    printf("Please enter a non-negative integer: ");
    scanf("%d", &number);

    if (number < 0) {
        printf("Factorial is only defined for non-negative integers.\n");
    } else if (number >= MAX_SIZE) {
        printf("Please enter an integer less than %d.\n", MAX_SIZE);
    } else {
        printf("The factorial of %d is %.1f\n", number, factorial(number));
    }

    return 0;
}
