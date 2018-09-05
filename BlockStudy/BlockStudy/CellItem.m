//
//  CellItem.m
//  BlockStudy
//
//  Created by emily on 2018/9/5.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "CellItem.h"

@implementation CellItem
+(instancetype)itemWithTitle:(NSString *)title{
    CellItem *item = [[self alloc] init];
    item.title = title;
    return item;
}
@end
