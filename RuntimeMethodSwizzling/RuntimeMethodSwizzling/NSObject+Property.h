//
//  NSObject+Property.h
//  RuntimeMethodSwizzling
//
//  Created by emily on 2018/9/3.
//  Copyright © 2018年 emily. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Property)
//@property分类：只会生成get set方法声明，不会生成实现，也不会下划线成员属性
@property NSString *name;

@end

NS_ASSUME_NONNULL_END
