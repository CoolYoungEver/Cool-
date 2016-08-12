//
//  CoolMineViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMineViewController.h"
#import "AFNetWorking.h"
#import "CoolMoreHealthMassage.h"
#import "MoreHealthTableViewCell.h"
#import "CoolMoreHViewController.h"

#define URLHealth @"http://mp.weixin.qq.com/mp/homepage?__biz=MzA4ODM3OTAyOQ==&hid=4&sn=d8805afd3ffe76ef59cae2d414ace335&uin=NzExODM1OTIx&key=8dcebf9e179c9f3a1afa8bc56d8a41e086615ed4e5712e8ddd9f60f15d9564c9181ad7e24081088f3d9845c3b2375c1e&devicetype=android-19&version=2603163b&lang=zh_CN&nettype=WIFI&pass_ticket=eGWykw09LTP%2BsCUG%2F5M%2FL%2BHK%2Fh75mhVzmeTibfjYzhcDCHqdCb4%2FfeH7r72aRyjy&begin=0&count=25&action=appmsg_list&f=json&r=0.17033187253400683"

@interface CoolMineViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *arrDatas;

@end

@implementation CoolMineViewController

- (void)loadDatas {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager POST:URLHealth parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"appmsg_list"];
        NSInteger count = data.count;
        NSMutableArray *arrMData = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index ++) {
            NSDictionary *dicData = data[index];
            CoolMoreHealthMassage *model = [CoolMoreHealthMassage initWithDictionary:dicData];
            [arrMData addObject:model];
        }
        _arrDatas = [NSMutableArray arrayWithArray:arrMData];
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
    self.title = @"健康资讯";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoreHealthTableViewCell *cell = [MoreHealthTableViewCell initWithTableView:tableView];
    CoolMoreHealthMassage *model = self.arrDatas[indexPath.section];
    cell.model = model;
    cell.selectionStyle = UITableViewCellStyleDefault;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CoolMoreHViewController *moreHVC = [CoolMoreHViewController new];
    CoolMoreHealthMassage *model = self.arrDatas[indexPath.section];
    moreHVC.strURL = model.strLink;
    [self.navigationController pushViewController:moreHVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
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
    
}



@end
