//
//  ViewController.m
//  01-Runtime(消息机制)
//
//  Created by emily on 2018/8/30.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"

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
    
    // 解决消息机制方法提示步骤
    // 查找build setting -> 搜索msg
    // 最终生成消息机制，编译器做的事情
    // 最终代码，需要把当前代码重新编译，用Xcode编译，clang
    // clang -rewrite-objc main.m 查看最终生成代码
    
    /*
     内容5大区
     1.栈 2.堆 3.静态区 4.常量区 5.方法区
     1.栈：不需要手动管理内存，自动管理
     2.堆：需要手动p管理内存，自己去释放
     */
    
    /*
     需要用到runtime，消息机制
     不得不用runtime消息机制，可以调用私有方法
     */
    
    
//    Person *p = [[Person alloc] init];
    Person *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    
    p = [p init];
    objc_msgSend(p, sel_registerName("init"));
    
    // 调用eat
    objc_msgSend(p, @selector(eat));
    objc_msgSend(p, @selector(run:),18);
    
    // 方法调用流程
    // 怎么去调用eat方法，对象方法：类对象的方法列表 ，类方法：元类中方法列表
    // 1.通过isa去对应的类中查找
    // 2.注册方法编号
    // 3.根据方法编号去查找对应方法
    // 4.找到只是最终函数实现地址，根据地址去方法区调用对应函数
    
}

-(void)test {
    //    id obj = [NSObject alloc];
    id objc = objc_msgSend([NSObject class],@selector(alloc));
    
    //    objc = [obj init];
    objc = objc_msgSend(objc,@selector(init));
}

@end
