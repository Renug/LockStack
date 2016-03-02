//
//  main.m
//  LockFreeStack
//
//  Created by rannger on 15/12/15.
//  Copyright © 2015年 wasai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestEngine.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TestEngine* engine = [[TestEngine alloc] init];
        [engine runTest];
        
//        NSLog(@"----------------------------------");
        sleep(2);
    }
    return 0;
}
