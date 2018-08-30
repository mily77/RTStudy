//
//  Person.m
//  01-Runtime(消息机制)
//
//  Created by emily on 2018/8/30.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)eat{
    NSLog(@"eat");
}

-(void)run:(NSInteger)metre {
    NSLog(@"跑了%ld米",metre);
}
@end
