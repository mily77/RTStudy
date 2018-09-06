//
//  ViewController.m
//  BlockStudy
//
//  Created by emily on 2018/9/5.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

/*
 block作用：保存一段代码
 
 1.block声明
 2.block定义
 3.block类型
 4.block调用
 */
// BlockType:类型别名
typedef void(^BlockType)();


@interface ViewController ()/*<ModalViewControllerDelegate>*/
// block怎么声明，就如何定义成属性
@property (nonatomic, strong) void(^block)();
//@property (nonatomic, strong) BlockType block6;
@end

@implementation ViewController
/*
 block使用场景
  1.在一个方法中定义，在另一个方法调用
  2.在一个类中定义，在另外一个类中调用
 
 
 需求：
  1.tableView展示3个cell 打电话，发短信，发邮件
 
 传值：1.只要能拿到对方就能传值
 顺传：给需要传值的对象，直接定义属性就能传值
 逆传：用代理，block，就是利用block去代替代理
 
 block是不是一个对象？？是一个对象，苹果说的
 如何判断当前文件是MRC,还是ARC
 1.dealloc 能否调用super，只有MRC才能调用super
 2.能否使用retain，release，如果能用就是MRC
 
 ARC管理原则：只要一个对象没有强指针修饰就会被销毁，默认局部变量对象都是强指针，存放到堆里面
 MRC了解开发常识：1.MRC没有strong,weak,局部变量对象就是相当于基本数据类型
                2.MRC给成员属性赋值，一定要使用set方法，不能直接访问下划线成员属性赋值
 
 MRC:管理block
 总结：只要block没有引用外部局部变量，block放在全局区
 只要block引用外部局变量，block放在栈里面
 block只能使用copy,不能使用retain 使用retain block还是在栈里面
 
 
 ARC:管理block
     只要block引用外部局部变量，block放在堆里面
     block使用strong，最好不要使用copy
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // block声明：返回值(^block变量名)(参数)
    void(^block)();
    
    // block定义：三种方式 = ^(参数){};
    // 第一种
    void(^block1)() = ^{
        NSLog(@"调用了block1");
    };
    // 第二种 如果没有参数，参数可以隐藏,如果有参娄，定义的时候，必须要写参数，而且必须有参数变量名
    void(^block2)(int) = ^(int a){
        
    };
    // 第三种 block返回可以流程图，不管有没有返回值，都可以省略
    int(^block3)() = ^int{
        return 3;
    };
    
    // block类型 : int(^)(NSString *)
    int(^block4)(NSString *) =^(NSString *name){
        return 2;
    };
    
    // blocck调用
    block1();
    
    // block快捷方式 inline
//    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
//        <#statements#>
//    };
    
    
    void(^block5)() = ^{
        NSLog(@"");
    };
    _block = block5;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // block调用：就去寻找保存代码，直接调用
    _block(); // 场景一
    
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    modalVC.view.backgroundColor = [UIColor brownColor];
//    modalVC.delegate = self;
    modalVC.block = ^(NSString *value) {
        NSLog(@"value = %@",value);
    };
    // 跳转
    [self presentViewController:modalVC animated:YES completion:nil];
}
//-(void)modalViewController:(ModalViewController *)modalVC sendValue:(NSString *)vlaue{
//    NSLog(@"value = %@",vlaue);
//}

@end
