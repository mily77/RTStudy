//
//  SubPerson.m
//  SuperClass
//
//  Created by emily on 2018/9/4.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "SubPerson.h"

@implementation SubPerson
-(void)test {
    // class：获取当前方法调用者
    // superclass:获取当前方法调用者的父类
    
    // super：仅仅是一个编译指示器，就是给编译器看的，不是一个指针
    // 本质：只要编译器看到super这个标志，就会让当前对象去调用父类方法,本质还是当前对象在调用
    
    [super test];
    
    // SubPerson Person SubPerson Person
    
}
@end
