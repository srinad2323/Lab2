#include <stdio.h>

extern int hamming_distance(void);
int main(){
    int result = hamming_distance();
    printf("this is test\n");
    printf("of the emergency broadcast\n");
    printf("Hamming distance: %d\n", result);
    return 0;
}