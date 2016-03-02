//
//  LockFreeQueue.hpp
//  LockFreeStack
//
//  Created by rannger on 15/12/28.
//  Copyright © 2015年 wasai. All rights reserved.
//

#ifndef LockFreeQueue_hpp
#define LockFreeQueue_hpp

#import <stdio.h>
#import <atomic>
#import <Foundation/Foundation.h>

class QueueNode {
public:
    QueueNode(NSObject* obj)
    :m_value(obj)
    ,m_pointer(NULL)
    { return; }
   
    QueueNode()
    :m_value(nil)
    ,m_pointer(NULL)
    { return; }
    
    ~QueueNode() { return; }
    
    NSObject* getValue() { return m_value;}
    void setValue(NSObject* val) { m_value = val; }
    
    std::atomic<QueueNode*>* getNext() { return &m_pointer; }
    
private:
    std::atomic<QueueNode*> m_pointer;
    NSObject* m_value;
};

class LockFreeQueue {
    LockFreeQueue();
    ~LockFreeQueue();
    
    QueueNode* getHead() { return m_head; }
    void setHead(QueueNode* head) { m_head = head; }
    
    QueueNode* getTail() { return m_tail; }
    void setTail(QueueNode* tail) { m_tail = tail; }
    
    void enq(NSObject* obj);
    NSObject* deq();
    
public:
    QueueNode* m_head;
    QueueNode* m_tail;
};

#endif /* LockFreeQueue_hpp */
