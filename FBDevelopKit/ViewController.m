//
//  ViewController.m
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import "ViewController.h"
#import "FBDevelopKit/FBDevelopKit.h"
#import "LZHTTPSession.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *testBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn addTarget:self action:@selector(testBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        btn;
    });
    
    [self.view addSubview:testBtn];
    
    testBtn.frame = CGRectMake(100, 100, 100, 100);
    
    UIButton *testBtn1 = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn addTarget:self action:@selector(testBtnClick1) forControlEvents:UIControlEventTouchUpInside];
        
        btn;
    });
    
    [self.view addSubview:testBtn1];
    
    testBtn1.frame = CGRectMake(200, 200, 100, 100);
}

- (void)testBtnClick{
    NSString *baseStr = @"https://m.zuzuche.com/";
    
    [[LZHTTPSession shareInstance] changeBaseString:baseStr];
}

- (void)testBtnClick1{
    NSLog(@"%@\n%@",[LZHTTPSession shareInstance].allBaseStringArr,[LZHTTPSession shareInstance].baseStr);
}

@end
