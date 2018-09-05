//
//  ViewController.m
//  BlockStudy
//
//  Created by emily on 2018/9/5.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"

/*
 block作用：保存一段代码
 
 1.block声明
 2.block定义
 3.block类型
 4.block调用
 
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // block声明：返回值(^block变量名)(参数)
    void(^block)();
    
    // block定义：三种方式 = ^(参数){};
    // 第一种
    void(^block1)() = ^{
        NSLog(@"调用了block1");
    };
    // 第二种 如果没有参数，参数可以隐藏,如果有参娄，定义的时候，必须要写参数，而且必须有参数变量名
    void(^block2)(int) = ^(int a){
        
    };
    // 第三种 block返回可以流程图，不管有没有返回值，都可以省略
    int(^block3)() = ^int{
        return 3;
    };
    
    // block类型 : int(^)(NSString *)
    int(^block4)(NSString *) =^(NSString *name){
        return 2;
    };
    
    // blocck调用
    block1();
    
    // block快捷方式 inline
//    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
//        <#statements#>
//    };
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
