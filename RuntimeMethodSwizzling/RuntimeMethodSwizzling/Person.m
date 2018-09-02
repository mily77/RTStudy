//
//  Person.m
//  RuntimeMethodSwizzling
//
//  Created by emily on 2018/8/31.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person
// 没有返回值，也没有参数
void aaa() {
    
}

// 什么时候调用：只要一个对象调用了一个未实现的方法就会调用这个方法，进行处理
// 作用：动态添加方法，处理未实现
+(BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSLog(@"%@",NSStringFromSelector(sel));
    
//    [NSStringFromSelector(sel) isEqualToString:@"eat"];
    if (sel == NSSelectorFromString(@"eat")) {
        // eat
        // class:给哪个类添加方法
        // SEL:添加哪个方法
        // IMP:方法现 => 函数 => 函数入口 => 函数名
        // type: 方法类型
        class_addMethod(self, sel, aaa, "");
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
