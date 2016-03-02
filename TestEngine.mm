//
//  TestEngine.m
//  LockFreeStack
//
//  Created by rannger on 15/12/15.
//  Copyright © 2015年 wasai. All rights reserved.
//

#import "TestEngine.h"
#import "LockFreeStack.h"
#include <exception>


@interface TestEngine ()
@property (nonatomic,assign) LockFreeStack* stack;
@property (nonatomic,strong) NSMutableArray* thread;
@end

@implementation TestEngine

- (id)init
{
    self = [super init];
    if (self) {
        self.stack = new LockFreeStack();
        self.thread = [[NSMutableArray alloc] initWithCapacity:2];
    }
    
    return self;
}

- (void)runTest
{
    for (int i = 0; i < 200; i++) {
        [NSThread detachNewThreadSelector:@selector(testAction) toTarget:self withObject:nil];
    }
    
}

- (void)dealloc
{
    delete _stack;
}

- (void)testAction
{
    for (int i = 0 ; i < 200; i++) {
        NSString* elem = [NSString stringWithFormat:@"%d from %@",i,[NSThread currentThread]];
        _stack->push(elem);
    }
   
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:200];
    NSObject* obj = nil;
    do {
        obj = _stack->pop();
        if (obj) {
            [array addObject:obj];
        }
    } while (obj!=nil);
    
    NSLog(@"%@ over",[NSThread currentThread]);
}

@end
