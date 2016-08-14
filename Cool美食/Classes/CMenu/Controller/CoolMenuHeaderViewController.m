//
//  CoolMenuHeaderViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuHeaderViewController.h"
#import "AFNetWorking.h"
#import "CoolSecHeadModel.h"
#import "CoolMenHeadTableViewCell.h"
#import "CoolZaoCanViewController.h"

#define URLMorning @"http://115.231.110.203/appapi/searchBytag.asp"

static NSInteger page = 1;

@interface CoolMenuHeaderViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *arrDatas;
@property (nonatomic, copy) NSString *URLPublc;
@property (nonatomic, strong) NSDictionary *dicPublc;

@end

@implementation CoolMenuHeaderViewController

- (void)loadDatas {
    NSDictionary *dic = @{@"appName":@"味他",@"keyCode":@"12D5514C996EF5108F440C814A5BDB2D",@"timeStamp":@"1470393508019",@"materialid":@"1223",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    NSDictionary *dicTwo = @{@"appName":@"味他",@"keyCode":@"8449849B2C153A23AE5D521FCD2661C9",@"timeStamp":@"1470401164861",@"materialid":@"1224",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    NSDictionary *dicThird = @{@"appName":@"味他",@"keyCode":@"F4A243EBB64E83D47343CF7791C90547",@"timeStamp":@"1470401386521",@"materialid":@"1225",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};

    switch (_indexBack) {
        case 1:
            _URLPublc = URLMorning;
            _dicPublc = dic;
            break;
        case 2:
            _URLPublc = URLMorning;
            _dicPublc = dicTwo;
            break;
        case 3:
            _URLPublc = URLMorning;
            _dicPublc = dicThird;
            break;
        default:
            break;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager GET:_URLPublc parameters:_dicPublc progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"data"];
        NSInteger count = data.count;
        NSMutableArray *arrMData = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index ++) {
            NSDictionary *dicData = data[index];
            CoolSecHeadModel *model = [CoolSecHeadModel initWithDictionary:dicData];
            [arrMData addObject:model];
        }
        _arrDatas = [NSMutableArray arrayWithArray:arrMData];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请下拉刷新重试！" preferredStyle:UIAlertControllerStyleAlert];
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
    return self.arrDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoolMenHeadTableViewCell *cell = [CoolMenHeadTableViewCell initWithDictionary:tableView];
    CoolSecHeadModel *model = self.arrDatas[indexPath.section];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CoolZaoCanViewController *zaoCanVC = [CoolZaoCanViewController new];
    CoolSecHeadModel *model = self.arrDatas[indexPath.section];
    zaoCanVC.ID = model.strZaoMenuId;
    [self.navigationController pushViewController:zaoCanVC animated:YES];
}

- (void)reloadMore {
    page +=1;
    
    NSDictionary *dic = @{@"appName":@"味他",@"keyCode":@"12D5514C996EF5108F440C814A5BDB2D",@"timeStamp":@"1470393508019",@"materialid":@"1223",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    NSDictionary *dicTwo = @{@"appName":@"味他",@"keyCode":@"8449849B2C153A23AE5D521FCD2661C9",@"timeStamp":@"1470401164861",@"materialid":@"1224",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    NSDictionary *dicThird = @{@"appName":@"味他",@"keyCode":@"F4A243EBB64E83D47343CF7791C90547",@"timeStamp":@"1470401386521",@"materialid":@"1225",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    switch (_indexBack) {
        case 1:
            _URLPublc = URLMorning;
            _dicPublc = dic;
            break;
        case 2:
            _URLPublc = URLMorning;
            _dicPublc = dicTwo;
            break;
        case 3:
            _URLPublc = URLMorning;
            _dicPublc = dicThird;
            break;
        default:
            break;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager GET:_URLPublc parameters:_dicPublc progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"data"];
        NSInteger count = data.count;
        NSMutableArray *arrMData = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index ++) {
            NSDictionary *dicData = data[index];
            CoolSecHeadModel *model = [CoolSecHeadModel initWithDictionary:dicData];
            [arrMData addObject:model];
        }
        [_arrDatas addObjectsFromArray:arrMData];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请刷新重试！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height && scrollView.contentOffset.y > 0) {
        [self reloadMore];
    }else if (scrollView.contentOffset.y < 0) {
        [self reloadMore];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
