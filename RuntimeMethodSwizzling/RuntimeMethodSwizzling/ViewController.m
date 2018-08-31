//
//  ViewController.m
//  RuntimeMethodSwizzling
//
//  Created by emily on 2018/8/31.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"
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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 调用imageNamed => hsx_imageNamed 交换这两个方法实现
    UIImage *image = [UIImage imageNamed:@"1.png"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
