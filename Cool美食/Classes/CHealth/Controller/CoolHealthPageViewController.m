//
//  CoolHealthPageViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolHealthPageViewController.h"
#import "AFNetWorking.h"
#import "Masonry.h"
#import "CoolSecHeadModel.h"
#import "CoolMenHeadTableViewCell.h"
#import "CoolHealthWebViewController.h"

#define URLTC @"http://115.231.110.203/appapi/searchBytag.asp"
static NSInteger page = 1;
@interface CoolHealthPageViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSArray *arrTableCells;
@property (nonatomic, strong) NSMutableArray *arrDatas;
@property (nonatomic, copy) NSString *URLPublc;
@property (nonatomic, strong) NSDictionary *dicPublc;

@end

@implementation CoolHealthPageViewController


- (void)loadDict {
    NSDictionary *dicOne = @{@"appName":@"味他",@"keyCode":@"27904A73B9B04CBB60146463B880CC91",@"timeStamp":@"1470403328838",@"materialid":@"1248",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    NSDictionary *dicTwo = @{@"appName":@"味他",@"keyCode":@"DEFC4BDF62AAAB9DEB180E133EA9880D",@"timeStamp":@"1470404135647",@"materialid":@"1251",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    NSDictionary *dicThird = @{@"appName":@"味他",@"keyCode":@"CE05176101A83C3F14A8231FED21F951",@"timeStamp":@"1470404190264",@"materialid":@"1247",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicFour = @{@"appName":@"味他",@"keyCode":@"EBC8E015C7D06CE7F5098B4309E1E51A",@"timeStamp":@"1470404375646",@"materialid":@"1253",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicFive = @{@"appName":@"味他",@"keyCode":@"B065AED947390C1411BE831791FED1F9",@"timeStamp":@"1470404448056",@"materialid":@"1256",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicSix = @{@"appName":@"味他",@"keyCode":@"E80D2AF8CEAAEE523756AC678AE841CA",@"timeStamp":@"1470404513261",@"materialid":@"1257",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicSeven = @{@"appName":@"味他",@"keyCode":@"EE37D40856C505F049D10B0F6FDC3FDB",@"timeStamp":@"1470404587109",@"materialid":@"1268",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicEight = @{@"appName":@"味他",@"keyCode":@"BA7501A8B5D5DAD1D92EE519E72E648E",@"timeStamp":@"1470404639293",@"materialid":@"1255",@"page":@"1",@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    switch (_indexBtn) {
        case 0:
            _dicPublc = dicOne;
            
            break;
        case 1:
    
            _dicPublc = dicTwo;
            
            break;
        case 2:
            _dicPublc = dicThird;
        
            break;
        case 3:
            _dicPublc = dicFour;
        
            break;
        case 4:
            _dicPublc = dicFive;
            
            break;
        case 5:
            _dicPublc = dicSix;
            
            break;
        case 6:
            _dicPublc = dicSeven;
            
            break;
        case 7:
            _dicPublc = dicEight;
            
            break;
        default:
            break;
    }

}

- (void)loadDatas {
    [self loadDict];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager GET:URLTC parameters:_dicPublc progress:^(NSProgress * _Nonnull uploadProgress) {
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoolMenHeadTableViewCell *cell = [CoolMenHeadTableViewCell initWithDictionary:tableView];
    CoolSecHeadModel *model = self.arrDatas[indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellStyleDefault;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CoolHealthWebViewController *healthWebVC = [CoolHealthWebViewController new];
    CoolSecHeadModel *model = self.arrDatas[indexPath.row];
    healthWebVC.ID = model.strZaoMenuId;
    [self.navigationController pushViewController:healthWebVC animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 42;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 42;
}

- (void)reloadMore {
    page +=1;
    
    NSDictionary *dicOne = @{@"appName":@"味他",@"keyCode":@"27904A73B9B04CBB60146463B880CC91",@"timeStamp":@"1470403328838",@"materialid":@"1248",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    NSDictionary *dicTwo = @{@"appName":@"味他",@"keyCode":@"DEFC4BDF62AAAB9DEB180E133EA9880D",@"timeStamp":@"1470404135647",@"materialid":@"1251",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    
    NSDictionary *dicThird = @{@"appName":@"味他",@"keyCode":@"CE05176101A83C3F14A8231FED21F951",@"timeStamp":@"1470404190264",@"materialid":@"1247",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicFour = @{@"appName":@"味他",@"keyCode":@"EBC8E015C7D06CE7F5098B4309E1E51A",@"timeStamp":@"1470404375646",@"materialid":@"1253",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicFive = @{@"appName":@"味他",@"keyCode":@"B065AED947390C1411BE831791FED1F9",@"timeStamp":@"1470404448056",@"materialid":@"1256",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicSix = @{@"appName":@"味他",@"keyCode":@"E80D2AF8CEAAEE523756AC678AE841CA",@"timeStamp":@"1470404513261",@"materialid":@"1257",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicSeven = @{@"appName":@"味他",@"keyCode":@"EE37D40856C505F049D10B0F6FDC3FDB",@"timeStamp":@"1470404587109",@"materialid":@"1268",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    NSDictionary *dicEight = @{@"appName":@"味他",@"keyCode":@"BA7501A8B5D5DAD1D92EE519E72E648E",@"timeStamp":@"1470404639293",@"materialid":@"1255",@"page":@(page),@"pageSize":@"10",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    switch (_indexBtn) {
        case 0:
            _dicPublc = dicOne;
            
            break;
        case 1:
            
            _dicPublc = dicTwo;
            
            break;
        case 2:
            _dicPublc = dicThird;
            
            break;
        case 3:
            _dicPublc = dicFour;
            
            break;
        case 4:
            _dicPublc = dicFive;
            
            break;
        case 5:
            _dicPublc = dicSix;
            
            break;
        case 6:
            _dicPublc = dicSeven;
            
            break;
        case 7:
            _dicPublc = dicEight;
            
            break;
        default:
            break;
    }

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager GET:URLTC parameters:_dicPublc progress:^(NSProgress * _Nonnull uploadProgress) {
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
            NSLog(@"%@",error);
        }
    }];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height && scrollView.contentOffset.y > 0) {
        [self reloadMore];
    }else if (scrollView.contentOffset.y < 0) {
        [self loadDatas];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
