//
//  ModalViewController.m
//  BlockStudy
//
//  Created by emily on 2018/9/5.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 传值给ViewController
//    if ([_delegate respondsToSelector:@selector(modalViewController:sendValue:)]) {
//        [_delegate modalViewController:self sendValue:@"123"];
//    }
    
    if (_block) {
        _block(@"123");
    }
}


@end
