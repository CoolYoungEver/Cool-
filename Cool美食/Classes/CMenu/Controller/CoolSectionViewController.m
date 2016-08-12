//
//  CoolSectionViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolSectionViewController.h"

@interface CoolSectionViewController ()

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation CoolSectionViewController

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


@end
