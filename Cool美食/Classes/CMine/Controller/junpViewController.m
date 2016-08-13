//
//  junpViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "junpViewController.h"

@interface junpViewController ()

@end

@implementation junpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    self.title = @"更多应用";
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 44)];
    [btn1 setTitle:@"诉说" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(sushuo) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sushuo {
    NSURL *url = [NSURL URLWithString:@"sushuo://"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
