//
//  main.c
//  CPractice
//
//  Created by Lisa J on 5/16/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#include <stdio.h>

float sizeFl() {
    float fl = 8.0;
    printf("%lu\n", sizeof(fl));return sizeof(fl);
    
}
int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    sizeFl();
    return 0;
}
