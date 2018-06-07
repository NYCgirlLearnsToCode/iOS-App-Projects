//
//  main.m
//  Pointers
//
//  Created by Lisa J on 5/8/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>

//C function
void changeAge(int *age) {
    *age = 39;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    NSString *name;
    NSLog(@"name address is %p", name);
    //nil more for objects
    //null is more of a C type construct
    if (name == NULL) {
        NSLog(@"name is nil");
    } else {
        NSLog(@"name is NOT nil");
    }
    
    int age = 19;
    //assigns the mem address to addressOfAge variable
    int *addressOfAge = &age;
    
    printf("value of age %d \n", age);
    printf("address of age is %p \n", addressOfAge);
    
    //dereferencing a pointer - get value at address
    printf("value at address age is %p \n", addressOfAge);
    
    //pass by reference
    changeAge(&age);
    
    printf("");
    
    return 0;
}
