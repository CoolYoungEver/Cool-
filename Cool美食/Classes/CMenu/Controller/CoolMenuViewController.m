//
//  CoolMenuViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuViewController.h"
#import "CoolMenuTableViewCell.h"
#import "AFNetWorking.h"
#import "CellItemsModel.h"
#import "CoolMenuSecTableViewCell.h"
#import "CoolMenuThirdTableViewCell.h"
#import "CoolfourTableViewCell.h"
#import "CoolMenuHeaderView.h"
#import "Masonry.h"
#import "CoolSectionViewController.h"
#import "CoolMenuHeaderEvens.h"
#import "CoolMenuHeaderViewController.h"
#import "CoolSearchViewController.h"



#define URLTC @"http://115.231.110.203/appapi/homePage.asp"
#define URLSCR @"http://api.xiachufang.com/v2/init_page_v5.json?origin=android&api_sign=c3d6e7c5f932b0a8a6f4b816c6488f2d&timezone=Asia%2FShanghai&nonce=9A2503CA-0F6E-48D6-9EE1-F46785F82B3B&api_key=09844205d1de8adc26110817477a2b70&_ts=1470214425&version=178&"

@interface CoolMenuViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *arrTableCells;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *arrScroll;
@property (nonatomic, strong) CoolMenuHeaderView *menuHeader;
@property (nonatomic, weak) UIView *viewD;
@property (nonatomic, weak) UIView *viewC;

@end

@implementation CoolMenuViewController

- (void)loadDatas {
    if (!_arrTableCells) {
        NSDictionary *dicD = @{@"appName":@"味他",@"keyCode":@"EE623281BB8F9B6708CEB5DBD93A4339",@"timeStamp":@"1470472679264",@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
        [manager GET:URLTC parameters:dicD progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSArray *data = responseObject[@"data"][@"list"];
            NSInteger count = data.count;
            NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:count];
            for (NSInteger index = 0; index < count; index ++) {
                NSDictionary *dicData = data[index];
                CellItemsModel *model = [CellItemsModel initWithDictionary:dicData];
                [arrM addObject:model];
            }
            _arrTableCells = [arrM copy];
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
}

- (void) loadDataFromServer{
    __weak CoolMenuViewController *temp=self;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager GET:URLSCR parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *arrData = responseObject[@"content"][@"pop_events"][@"events"];
        NSInteger count = arrData.count;
        NSMutableArray *arrMData = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index ++) {
            NSDictionary *dicData = arrData[index];
            CoolMenuHeaderEvens *model = [CoolMenuHeaderEvens initWithDictionary:dicData];
            [arrMData addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [temp.menuHeader updateScrollView:arrMData];
            [temp.tableView reloadData];
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请点击重试！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        tableView.backgroundColor = [UIColor whiteColor];
        _tableView = tableView;
        
        CoolMenuHeaderView *menuHeader = [[CoolMenuHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 90)];
        self.menuHeader = menuHeader;
        [menuHeader setBlaTag:^(NSInteger indexTag) {
            CoolMenuHeaderViewController *headerVC = [CoolMenuHeaderViewController new];
            headerVC.indexBack = indexTag;
            NSArray *arr = @[@"早餐",@"午餐",@"晚餐"];
            headerVC.title = arr[indexTag - 1];
            [self.navigationController pushViewController:headerVC animated:YES];
        }];
        tableView.tableHeaderView = menuHeader;  
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDatas];
    [self tableView];
    [self loadDataFromServer];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrTableCells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellItemsModel *model = self.arrTableCells[indexPath.row];
    
    if ([model.strType  isEqualToString:@"0"]) {
        CoolMenuTableViewCell *cell = [[CoolMenuTableViewCell alloc] initWithTableView:tableView];
        cell.model = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if ([model.strType isEqualToString:@"1"]) {
        CoolMenuSecTableViewCell *secCell = [[CoolMenuSecTableViewCell alloc] initWithTableView:tableView];
        secCell.model = model;
        secCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return secCell;
    }else if([model.strType isEqualToString:@"2"]) {
        CoolMenuThirdTableViewCell *thirdCell = [[CoolMenuThirdTableViewCell alloc] initWithTableView:tableView];
        thirdCell.model = model;
        thirdCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return thirdCell;
    }else if([model.strType isEqualToString:@"3"]) {
        CoolfourTableViewCell *fourCell = [[CoolfourTableViewCell alloc] initWithTableView:tableView];
        fourCell.model = model;
        fourCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return fourCell;
    }else {
        return nil;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.tableView]) {
        if (self.tableView.contentOffset.y > self.tableView.contentSize.height - self.tableView.frame.size.height && self.tableView.contentOffset.y > 0) {
            UILabel *labFoot = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
            labFoot.textAlignment = NSTextAlignmentCenter;
            labFoot.text = @"没有更多了";
            self.tableView.tableFooterView = labFoot;
        }else if (self.tableView.contentOffset.y < 0) {
            [self loadDatas];
            [self loadDataFromServer];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CoolSectionViewController *secondVC = [CoolSectionViewController new];
    CellItemsModel *model = self.arrTableCells[indexPath.row];
    secondVC.ID = model.strID;
    secondVC.title = model.strTitle;
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
