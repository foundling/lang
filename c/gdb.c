#include <stdio.h>
#include <stdlib.h>

int main() {

    char * words[] = {
        "Every", 
        "Good", 
        "Boy",
        "Does",
        "Fine"
    };    

    for (int i = 0; i < 10; ++i) {
        printf("%s\n", words[i]);
    } 

}
