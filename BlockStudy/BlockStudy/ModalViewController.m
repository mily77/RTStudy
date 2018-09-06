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

-(void)dealloc {
    NSLog(@"modalVC销毁");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // block造成循环引用：block会对里面所有强指针变量都强引用一次
    __weak typeof(self) weakSelf = self;
    _block1 = ^{
//        NSLog(@"%@",self);
        NSLog(@"%@",weakSelf);
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@",strongSelf);
        });
    };
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 传值给ViewController
//    if ([_delegate respondsToSelector:@selector(modalViewController:sendValue:)]) {
//        [_delegate modalViewController:self sendValue:@"123"];
//    }
    
    if (_block) {
        _block(@"123");
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
