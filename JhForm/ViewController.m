//
//  ViewController.m
//  JhForm
//
//  Created by Jh on 2019/1/9.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "ViewController.h"

#import "TestVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(100 , 200, 200, 200);
    btn.backgroundColor = [UIColor orangeColor];
    [btn.layer setCornerRadius:5.0];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
}

#pragma mark - clickBtn
-(void)clickBtn{
    

    TestVC *jumpVC= [[TestVC alloc]init];
    [self.navigationController pushViewController:jumpVC animated:YES];
    
    
}


@end
