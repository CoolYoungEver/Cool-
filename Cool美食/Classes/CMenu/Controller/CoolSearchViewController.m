//
//  CoolSearchViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolSearchViewController.h"

@interface CoolSearchViewController () <UISearchBarDelegate>

@end

@implementation CoolSearchViewController

- (void)viewWillAppear:(BOOL)animated {
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne.frame = CGRectMake(0, 0, 10, 20);
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTwo.frame = CGRectMake(0, 0, 50, 20);
    [btnTwo setTitle:@"取消" forState:UIControlStateNormal];
    [btnTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithCustomView:btnOne];
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithCustomView:btnTwo];
    [btnTwo addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self seachesBar];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)seachesBar {
    UISearchBar *seach = [[UISearchBar alloc] initWithFrame:CGRectMake(30, 0, self.view.frame.size.width - 100, 40)];
    [self.view addSubview:seach];
    seach.placeholder = @"搜索菜谱、食材";
    seach.barStyle = UIBarStyleDefault;
    seach.searchBarStyle = UISearchBarStyleMinimal;
    seach.delegate = self;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    return YES;
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
