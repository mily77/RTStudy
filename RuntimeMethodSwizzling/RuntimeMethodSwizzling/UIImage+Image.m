//
//  UIImage+Image.m
//  RuntimeMethodSwizzling
//
//  Created by emily on 2018/8/31.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>

@implementation UIImage (Image)

// 把类加载进内存的时候调用，只会调用一次
+(void)load {
    // 获取imageNamed
    // 获取哪个类的方法
    // SEL:获取哪个方法
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    // 获取hsx_imageNamed
    Method hsx_imageNamedMethod = class_getClassMethod(self, @selector(hsx_imageNamed:));
    // 交换方法：runtime
    method_exchangeImplementations(imageNamedMethod, hsx_imageNamedMethod);
    // 调用imageNamed => hsx_imageNamed
    // 调用hsx_imageNamed => imageNamed
}
// 会调用多次
//+(void)initialize {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//    }); //保证调用一次
//}
// 在分类中，最好不要定系统方法，一旦重写，把系统方法实现给干掉
//+(UIImage *)imageNamed:(NSString *)name {
//    super - >父类 NSObject
//}

// 1.加载图片
// 2.判断是否加载成功
+(UIImage *)hsx_imageNamed:(NSString *)name {
    UIImage *image = [UIImage hsx_imageNamed:name];
    if (image) {
        NSLog(@"加载成功");
    }else{
        NSLog(@"加载失败");
    }
    return image;
}

@end
