//
//  CacultorManage.m
//  BlockStudy
//
//  Created by emily on 2018/9/6.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "CacultorManage.h"

@implementation CacultorManage
-(void)cacultor:(NSInteger (^)(NSInteger))cacultorBlock{
    if (cacultorBlock) {
        _result = cacultorBlock(_result);
    }
}


-(CacultorManage *(^)(int))add{
    return ^(int value){
        self.result += value;
        return self;
    };
}

-(CacultorManage *)add:(int)value{
    _result += value;
    return self;
}

@end
