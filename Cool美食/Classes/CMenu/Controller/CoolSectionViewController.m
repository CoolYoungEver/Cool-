//
//  CoolSectionViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolSectionViewController.h"
#import "AFNetWorking.h"
#import "YSMenuDataModel.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import "PageOneTableViewCell.h"
#import "YSMenuStepModel.h"
#import "YSMenuMaterialModel.h"
#import "SectioniiTableViewCell.h"

@interface CoolSectionViewController () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *arrDatas;
/**  存放材料的数组*/
@property (nonatomic,copy) NSArray *arrMaterail;
/**  存放操作步骤的数组 */
@property (nonatomic,copy) NSArray *arrSteps;

/** intro 介绍*/
@property (nonatomic,copy) NSString *strMenuState;
/** cover 图片*/
@property (nonatomic,copy) NSString *strMenuPic;
/** title 食物名字*/
@property (nonatomic,copy) NSString *strMenuName;

@property (nonatomic, strong) UIImageView *imvHeader;
@property (nonatomic, strong) YSMenuDataModel *model;

@end

@implementation CoolSectionViewController

- (void)requestInformation{
    NSString *strURL = @"http://115.231.110.203/appapi/getMenuDetails.asp";
    NSString *strID = self.ID;
    NSDictionary *dicPrograme = @{@"appName":@"味他",@"keyCode":@"4F8F092F7F6D0DB304341DE43AE9F92E",@"timeStamp":@"1470713633495",@"menuId":strID,@"insideCode":@"10013",@"appType":@"1",@"ipAddress":@"115.231.110.203",@"version":@"2.1.1"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];

    [manager GET:strURL parameters:dicPrograme progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dictData = responseObject[@"data"];
        YSMenuDataModel *model = [YSMenuDataModel menuDataModelWithDictionary:dictData];
        self.model = model;
        __weak typeof(self) weakSelf = self;
         NSURL *headerImvURL = [NSURL URLWithString:model.menuPic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.imvHeader sd_setImageWithURL:headerImvURL];
            weakSelf.title = model.menuName;
            weakSelf.arrMaterail = model.menuMaterial;
            weakSelf.arrSteps = model.menuStep;
            [weakSelf.tableView reloadData];
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        __weak typeof(self) weakSelf = self;
        UIAlertController *alertContorller = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"网络不好，请耐心等待" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction *alertDengLuAction = [UIAlertAction actionWithTitle:@"刷新试试" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf requestInformation];
        }];
        [alertContorller addAction:alertDengLuAction];
        [alertContorller addAction:alertAction];
        [self presentViewController:alertContorller animated:YES completion:nil];
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestInformation];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 250)];
    self.tableView.tableHeaderView = image;
    self.imvHeader = image;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return self.arrMaterail.count;
    }
    if (section == 2) {
        return self.arrSteps.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SectioniiTableViewCell *cell = [SectioniiTableViewCell initWithTableView:tableView];
        cell.model = self.model;
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString *strID = @"MaterialCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:strID];
        }
        YSMenuMaterialModel *materialModel = self.arrMaterail[indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.text = [NSString stringWithFormat:@"%@",materialModel.materialName];
        cell.detailTextLabel.text = materialModel.materialWeight;
        return cell;
    }
    if (indexPath.section == 2) {
        PageOneTableViewCell *cell = [PageOneTableViewCell initWithTableView:tableView];
        YSMenuStepModel *model = self.arrSteps[indexPath.row];
        cell.model = model;
        cell.index = indexPath.row;
        return cell;

    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CGSize maxSize = CGSizeMake(self.view.frame.size.width - 16, MAXFLOAT);
        NSDictionary *att = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGRect rect = [self.model.menuState boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:att context:nil];
        return rect.size.height;
    }
    if (indexPath.section == 1) {
        return 44;
    }
    if (indexPath.section == 2) {
        return 100;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        
        NSString *strTitle = self.title;
        return strTitle;
    }
    if (section == 1) {
        return @"用料";
    }
    if (section == 2) {
        return @"步骤";
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
