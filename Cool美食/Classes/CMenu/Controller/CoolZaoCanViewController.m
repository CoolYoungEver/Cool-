//
//  CoolZaoCanViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolZaoCanViewController.h"

@interface CoolZaoCanViewController ()

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation CoolZaoCanViewController

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] init];

    self.view = webView;
    self.webView = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
     NSString *str = [NSString stringWithFormat:@"http://www.chufang001.com/menu/show/%@.html",_ID];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.webView removeFromSuperview];
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
