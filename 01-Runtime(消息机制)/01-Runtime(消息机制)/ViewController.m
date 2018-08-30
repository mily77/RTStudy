//
//  ViewController.m
//  01-Runtime(消息机制)
//
//  Created by emily on 2018/8/30.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
/*
     runtime:必须要导入头文件 <objc/message.h>
     任何方法调用本质：发送一个消息，用runtime发送消息，OC底层实现通过runtime实现
     
     验证：方法调用，是否真的是转换为消息机制
 
     runtime都有一个前缀，谁的事情使用谁
 */


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 类方法本质：类对象调用[NSObject class]
    // id:谁发送消息
    // SEL:发送什么消息
    // (NSObject *(*)(id,SEL))(void *)objc_msgSend([NSObject class],@selector(alloc));
    // Xcode6之前，苹果运行使用objc_msgSend e而且有参数提示
    
    // Xcode6苹果不推荐我们使用runtime
    
    
//    id obj = [NSObject alloc];
    id objc = objc_msgSend([NSObject class],@selector(alloc));

//    objc = [obj init];
    objc = objc_msgSend(objc,@selector(init));
    
    // 最终生成消息机制，编译器做的事情
    // 最终代码，需要把当前代码重新编译，用Xcode编译，clang
    // clang -rewrite-objc main.m 查看最终生成代码
}


@end
