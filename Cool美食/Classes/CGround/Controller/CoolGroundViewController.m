//
//  CoolGroundViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolGroundViewController.h"
#import "AFNetWorking.h"
#import "CoolJianFitness.h"
#import "CoolFitNessTableViewCell.h"
#import "CoolWebViewController.h"

#define URLTC @"http://mp.weixin.qq.com/mp/homepage?__biz=MzI2NjE4NzAxMw==&hid=1&sn=85e16a89c1c1c910bfebad96710e9d90&uin=NzExODM1OTIx&key=8dcebf9e179c9f3ab3bfbe635e5a981a56c1ee6534c33073a041d709cce2e17d0c6d3f22b0b38321168b2aa75b7dcfec&devicetype=android-19&version=2603163b&lang=zh_CN&nettype=WIFI&pass_ticket=VUN69TFzDtM9o3ZP9cex6qidqUocqt1hiE401Bk2zLMzXKNqpT9QK9mRqF%2F6IqKP&cid=1&begin=0&count=25&action=appmsg_list&f=json&r=0.7607023785822093"

@interface CoolGroundViewController ()
@property (nonatomic, strong) NSMutableArray *arrTWOTableCells;
@end

@implementation CoolGroundViewController

- (void)loadDatas {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager POST:URLTC parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"appmsg_list"];
        NSInteger count = data.count;
        NSMutableArray *arrMData = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index ++) {
            NSDictionary *dicData = data[index];
            CoolJianFitness *model = [CoolJianFitness initWithDIctionary:dicData];
            [arrMData addObject:model];
        }
        _arrTWOTableCells = [NSMutableArray arrayWithArray:arrMData];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请点击重试！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDatas];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrTWOTableCells.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoolFitNessTableViewCell *cell = [CoolFitNessTableViewCell initWithTableView:tableView];
    CoolJianFitness *model = self.arrTWOTableCells[indexPath.section];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CoolWebViewController *webViewC = [CoolWebViewController new];
    CoolJianFitness *model = self.arrTWOTableCells[indexPath.section];
    webViewC.webURL = model.strFitLink;
    [self.navigationController pushViewController:webViewC animated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height && scrollView.contentOffset.y > 0) {
        UILabel *labFoot = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        labFoot.textAlignment = NSTextAlignmentCenter;
        labFoot.text = @"没有更多了";
        self.tableView.tableFooterView = labFoot;
    }else if (scrollView.contentOffset.y < 0) {
        [self loadDatas];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
