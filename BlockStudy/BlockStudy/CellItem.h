//
//  CellItem.h
//  BlockStudy
//
//  Created by emily on 2018/9/5.
//  Copyright © 2018年 emily. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellItem : NSObject

// 设计模型控件需要展示什么内容，就定义什么属性
/** 注释 */
@property (nonatomic, strong) NSString *title;
//保存每个cell做的事情
@property (nonatomic, strong) void(^block)(void);

+(instancetype)itemWithTitle:(NSString *)title;
@end
