//
//  LockFreeStack.cpp
//  LockFreeStack
//
//  Created by rannger on 15/12/15.
//  Copyright © 2015年 wasai. All rights reserved.
//

#import "LockFreeStack.h"
#include <libkern/OSAtomic.h>
#include <string>
#include <pthread.h>
#import "Node.h"
#include <assert.h>

LockFreeStack::LockFreeStack()
:m_tail(NULL)
{
    
}

LockFreeStack::~LockFreeStack()
{
    
}



void LockFreeStack::push(NSObject *data)
{
    Node* node = new Node(data);
    while (true) {
        node->setNext(m_tail);
        if (OSAtomicCompareAndSwapPtrBarrier(node->getNext(), node, (void**)&m_tail)) {
            break;
        }
    }
}

NSObject* LockFreeStack::pop()
{
    while (true) {
        Node* result = m_tail;
        if (result == NULL)
            return nil;
        
        if (m_tail && OSAtomicCompareAndSwapPtrBarrier(result,result->getNext(),(void**)&m_tail)) {
            NSObject* retval = result->getData();
            delete result;
            return retval;
        }
    }
}
