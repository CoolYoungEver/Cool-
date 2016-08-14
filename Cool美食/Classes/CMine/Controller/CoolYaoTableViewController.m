//
//  CoolYaoTableViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolYaoTableViewController.h"
#import "AFNetWorking.h"
#import "CoolMoreHealthMassage.h"
#import "MoreHealthTableViewCell.h"
#import "CoolMoreHViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "CoolSecHeadModel.h"
#import "CoolMenHeadTableViewCell.h"
#import "CoolHealthWebViewController.h"

#define URLHealth @"http://115.231.110.203/appapi/searchBytag.asp"

@interface CoolYaoTableViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *arrTitle;
@property (nonatomic, copy) NSDictionary *dicPublc;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray <NSMutableArray *> *arrSections;
@end

@implementation CoolYaoTableViewController

- (void)loadDict {
    _page = arc4random_uniform(5);
    
    [self setDicPublc:@"5D91612C8F4F54B17557CA2E0153B49F" timeStamp:@"1471140450121" materialid:@"1264" page:_page];
    [self setDicPublc:@"99EF7D6E06ED7395D63E7BC68A82F427" timeStamp:@"1471140761126" materialid:@"1273" page:_page];
    [self setDicPublc:@"45341263FBDBD92EF782191258227F70" timeStamp:@"1471140909857" materialid:@"1206" page:_page];
    [self setDicPublc:@"F91F0DD8E2354F1CDAD4AAE21CE1B23C" timeStamp:@"1471141037905" materialid:@"1209" page:_page];
    [self setDicPublc:@"9504BFB7F0FBD0594C4D6B62A21AAC33" timeStamp:@"1471141105780" materialid:@"1207" page:_page];

}

- (void)setDicPublc:(NSString *)keyCode timeStamp:(NSString *)timeStamp materialid:(NSString *)materialid page:(NSInteger)page
{
    _dicPublc = @{@"appName":@"味他",
                  @"keyCode":keyCode,
                  @"timeStamp":timeStamp,
                  @"materialid":materialid,
                  @"page":@(page),
                  @"pageSize":@"10",
                  @"insideCode":@"10013",
                  @"appType":@"1",
                  @"ipAddress":@"115.231.110.203",
                  @"version":@"2.1.1"};
    [self loadDatas];
}


- (void)loadDatas {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager POST:URLHealth parameters:self.dicPublc progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"data"];
        NSDictionary *dicTitle = responseObject[@"materialName"];
        NSString *strTitle = [NSString stringWithFormat:@"%@",dicTitle];
        NSInteger count = data.count;
        NSMutableArray *arrMData = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index ++) {
            NSDictionary *dicData = data[index];
            CoolSecHeadModel *model = [CoolSecHeadModel initWithDictionary:dicData];
            [arrMData addObject:model];
        }
        if (self.arrSections.count == 5 && self.arrTitle.count == 5) {
            [self.arrSections removeAllObjects];
            [self.arrTitle removeAllObjects];
        }
        [self.arrSections addObject:arrMData];
        [self.arrTitle addObject:strTitle];
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


- (NSMutableArray *)arrSections
{
    if (!_arrSections) {
        _arrSections = [NSMutableArray arrayWithCapacity:5];
    }
    return _arrSections;
}

- (NSMutableArray *)arrTitle {
    if (!_arrTitle) {
        _arrTitle = [NSMutableArray arrayWithCapacity:5];
    }
    return _arrTitle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDict];
    [self loadDefaultSetting];
}


- (void)loadDefaultSetting {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoolMenHeadTableViewCell *cell = [CoolMenHeadTableViewCell initWithDictionary:tableView];
    CoolSecHeadModel *model = self.arrSections[indexPath.section][indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellStyleDefault;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CoolMoreHViewController *moreHVC = [CoolMoreHViewController new];
    CoolSecHeadModel *model = self.arrSections[indexPath.section][indexPath.row];
    moreHVC.strId = model.strZaoMenuId;
    [self.navigationController pushViewController:moreHVC animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.arrTitle[0];
            break;
        case 1:
            return self.arrTitle[1];
            break;
        case 2:
            return self.arrTitle[2];
            break;
        case 3:
            return self.arrTitle[3];
            break;
        case 4:
            return self.arrTitle[4];
            break;
            
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
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
    }
}

@end
