//
//  TableViewController.m
//  BlockStudy
//
//  Created by emily on 2018/9/5.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "TableViewController.h"
#import "CellItem.h"

@interface TableViewController ()
@property (nonatomic, strong) NSArray *items;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建模型
    CellItem *item1 =[CellItem itemWithTitle:@"打电话"];
    item1.block = ^{
        NSLog(@"打电话");
    };
    CellItem *item2 =[CellItem itemWithTitle:@"发短信"];
    item2.block = ^{
        NSLog(@"发短信");
    };
    CellItem *item3 =[CellItem itemWithTitle:@"打邮件"];
    item3.block = ^{
        NSLog(@"打邮件");
    };
    _items = @[item1,item2,item3];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    // 从缓存池取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    CellItem *item = self.items[indexPath.row];
    
    cell.textLabel.text = item.title;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 把要做的事情（代码）保存到模型
    CellItem *item = self.items[indexPath.row];
    if (item.block) {
        item.block();
    }
}


@end
