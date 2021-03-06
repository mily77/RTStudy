//
//  ViewController.m
//  BlockStudy
//
//  Created by emily on 2018/9/5.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"
#import "CacultorManage.h"
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

 循环引用：我引用你，你也引用，就会造成循环引用，双方都不会被销毁，导致内存泄漏问题


 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // block声明：返回值(^block变量名)(参数)
    void(^block)();
    
    int a = 3;
//    static int a = 3;
//    __block int a = 3
    // 如果是局部变量，Block是值传递
    // 如果是静态变量，全局变量，__block修饰的变量，block都是指针传递
    
    // block定义：三种方式 = ^(参数){};
    // 第一种
    void(^block1)() = ^{
        NSLog(@"%d",a);
    };
    a = 5;
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
    
    
    // 怎么区分参数是block，就看有没有^,把block当做参数
    // 把block当做参数，并不是马上就调用block，什么时候调用，由方法内部决定
    // 什么时候需要把block当做参数去使用:做的事情由外界决定，但是什么时候做由内部决定
    /*
     
     需求：封装一个计算器，提供一个计算方法，怎么计算由外界决定，什么时候计算由内部决定
     
     */
    CacultorManage *mgr = [[CacultorManage alloc] init];
    [mgr cacultor:^NSInteger(NSInteger result) {
        result += 5;
        result += 6;
        result *= 5;
        return result;
    }];
    /*
     链式编程思想：把所有的语句.号连接起来，好处:可读性非常好
     */
    //+5
    mgr.add(5).add(5).add(5).add(5);
//    [[[[[mgr add:5] add:5] add:5] add:5] add:7];
    NSLog(@"%ld",(long)mgr.result);
    
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
