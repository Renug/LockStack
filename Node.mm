//
//  Node.m
//  LockFreeStack
//
//  Created by rannger on 15/12/15.
//  Copyright © 2015年 wasai. All rights reserved.
//

#import "Node.h"
#include <pthread.h>

Node::Node()
:m_data(nil)
,m_next(NULL)
{
    
}

Node::Node(NSObject* data)
:m_data(data)
,m_next(NULL)
{
    
}



