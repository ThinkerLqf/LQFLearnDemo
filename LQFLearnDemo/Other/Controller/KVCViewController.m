//
//  KVCViewController.m
//  LQFLearnDemo
//
//  Created by liqunfei on 2017/7/13.
//  Copyright © 2017年 LQF. All rights reserved.
//

#import "KVCViewController.h"
#import <WebKit/WebKit.h>
#import "Dog.h"
#import "Person.h"

@interface KVCViewController ()

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navTitle = @"KVC";
    
    self.quoteUrl = @"http://www.jianshu.com/p/45cbd324ea65";
    
    [self testKVC];
    [self KVCTips];
}

- (void)testKVC {
    Person *p = [[Person alloc] init];
    //1.property
    p.name = @"rose";
    p.age = 20;
    p.dog = [[Dog alloc] init];
    p.dog.name = @"旺财";
    
    //2.forkey
    [p setValue:@"jack" forKey:@"name"];
    [p setValue:@30 forKey:@"age"];
    [p.dog setValue:@"旺福" forKey:@"name"];
    
    //Person对象的私有变量_height，对两个key:height、_height,任意一个key都可以修改其属性。
    //对于height，KVC先从内存中寻找对应名为height的属性，如果找不到就会自动寻找_height，然后进行相应的修改
    [p setValue:@1.80 forKey:@"height"];
    [p setValue:@1.85 forKey:@"_height"];
    
    //3.forKeyPath
    //forKeyPath包含了forKey的功能,以后使用forKeyPath就可以了。
    //orKeyPath可以利用‘ . ’运算符一层一层往下查找对象的属性
    [p setValue:@"tom" forKeyPath:@"name"];
    [p setValue:@27 forKeyPath:@"age"];
    
    [p.dog setValue:@"hashiqi" forKey:@"name"];
    NSLog(@"%@",p.dog.name);
    [p setValue:@"keji" forKeyPath:@"dog.name"];
    NSLog(@"%@",p.dog.name);
}

- (void)KVCTips {
    Person *p = [[Person alloc] init];
    Dog *dog1 = [[Dog alloc] init];
    dog1.name = @"中华田园犬";
    dog1.number = 3;
    Dog *dog2 = [[Dog alloc] init];
    dog2.name = @"哈士奇";
    dog2.number = 1;
    Dog *dog3 = [[Dog alloc] init];
    dog3.name = @"柴犬";
    dog3.number = 4;
    Dog *dog4 = [[Dog alloc] init];
    dog3.name = @"萨摩耶";
    dog3.number = 3;
    Dog *dog5 = [[Dog alloc] init];
    dog5.name = @"黑背";
    dog5.number = 3;
    p.dogs = @[dog1, dog2, dog3, dog4, dog5];
    
    NSArray *dogNames = [p valueForKeyPath:@"dogs.name"];
    NSLog(@"%@",dogNames);
    
    NSNumber *dogsNumber = [p valueForKeyPath:@"dogs.@sum.number"];
    NSLog(@"%@",dogsNumber);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
