//
//  Person.m
//  SuperClass
//
//  Created by emily on 2018/9/4.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)test {
    
    // self -> SubPerson
    
    // SubPerson Person SubPerson Person
    NSLog(@"%@,%@,%@,%@",[self class], [self superclass], [super class],[super superclass]);
}
@end
