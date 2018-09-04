//
//  ViewController.m
//  SuperClass
//
//  Created by emily on 2018/9/4.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    Person *p = [[Person alloc] init];
    [p test];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
