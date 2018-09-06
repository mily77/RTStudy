//
//  CacultorManage.h
//  BlockStudy
//
//  Created by emily on 2018/9/6.
//  Copyright © 2018年 emily. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacultorManage : NSObject
@property (nonatomic, assign) NSInteger result;

// 计算
-(void)cacultor:(NSInteger(^)(NSInteger result))cacultorBlock;


-(CacultorManage *(^)(int))add;

-(CacultorManage *)add:(int)value;

@end
