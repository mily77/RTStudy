//
//  ModalViewController.h
//  BlockStudy
//
//  Created by emily on 2018/9/5.
//  Copyright © 2018年 emily. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class ModalViewController;
//@protocol ModalViewControllerDelegate <NSObject>
//@optional
//// 设计方法：想要代理做什么事情
//-(void)modalViewController:(ModalViewController *)modalVC sendValue:(NSString *)value;
//@end

@interface ModalViewController : UIViewController

@property (nonatomic, strong) void(^block)(NSString *value);

//@property (nonatomic, weak) id<ModalViewControllerDelegate> delegate;
@end
