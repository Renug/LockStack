//
//  LockFreeStack.hpp
//  LockFreeStack
//
//  Created by rannger on 15/12/15.
//  Copyright © 2015年 wasai. All rights reserved.
//



#import <Foundation/Foundation.h>

class Node;
class LockFreeStack {
public:
    LockFreeStack();
    ~LockFreeStack();
    void push(NSObject* data);
    NSObject* pop();
private:
    Node* m_tail;
};



