//
//  ViewController.m
//  RuntimeMethodSwizzling
//
//  Created by emily on 2018/8/31.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+Property.h"

/*
 Runtime(交换方法)：只要想修改系统的方法实现
 
 需求：
 比如有一个项目，已经开发了2年，忽然项目负责人添加一个功能，每次UIImage加载图片，告诉我是我是加载成功
 
 给系统的imageName添加功能，只能用runtime（交换方法）
 1.给系统的方法添加分类
 2.自己实现一个带有扩展功能的方法
 3.交换方法，只需要交换一次，
 
 1.自定义UIImage
 
 2.UIImage添加分类
 
 */

/*
 runtime(动态添加方法)：OC都是懒加载机制，只要一个方法实现了，就会马上添加到方法列表中，
 app:免费版，收费版
 
 美团有个面试题？有没有使用过performSelector,什么时候使用？动态添加方法时候使用过？怎么动态添加方法？用runtime？为什么要动态添加方法？
 
 */

/*
 动态添加属性：什么时候需要动态添加属性
 
 开发场景
 给系统的类添加属性的时候，可以使用runtime动态添加属性方法
 
 本质：动态添加属性，就是让某个属性与对象产生关联
 
 需求：让一个NSObject类 保存一个字符串
 
 runtime 一般都是针对系统的类
 
 
 */


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 调用imageNamed => hsx_imageNamed 交换这两个方法实现
    UIImage *image = [UIImage imageNamed:@"1.png"];
    
    
    Person *p = [[Person alloc] init];
    [p performSelector:@selector(eat)];
    
    
    
    NSObject *obj = [[NSObject alloc] init];
    
    obj.name = @"123";
    
    NSLog(@"%@",obj.name);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
