//
//  Node.h
//  LockFreeStack
//
//  Created by rannger on 15/12/15.
//  Copyright © 2015年 wasai. All rights reserved.
//

#import <Foundation/Foundation.h>


class Node {
    
public:
    Node();
    Node(NSObject* data);
    ~Node() {}
    
    void setData(NSObject* data) { m_data = data; }
    NSObject* getData(void) { return m_data; };
    
    void setNext(Node* next) { m_next = next; };
    Node* getNext(void) { return m_next; }
    
private:
    NSObject* m_data;
    Node* m_next;
};
