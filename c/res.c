#include <stdio.h>

int main() {
    int * restrict p;
    int * restrict q;

    int a = 4;

    p = &a;
    q = &a;
    printf("%p\n", p);
    printf("%p\n", q);
}
