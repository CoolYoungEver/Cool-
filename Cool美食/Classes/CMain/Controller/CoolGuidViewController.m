//
//  CoolGuidViewController.m
//  Cool美食1.0
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolGuidViewController.h"
#import "Masonry.h"
#import "AppDelegate.h"

@interface CoolGuidViewController () <UIScrollViewDelegate>

@property (nonatomic, copy) NSArray *arrImages;
@property (nonatomic, weak) UIScrollView *guidScrollView;
@property (nonatomic, weak) UIPageControl * pageContro;
@end

@implementation CoolGuidViewController

- (NSArray *)arrImages {
    NSArray *arrTemp = @[@"guid_1",@"guid_2",@"guid_3"];
    NSInteger count = arrTemp.count;
    NSMutableArray *arrMTe = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger index = 0; index < count; index ++) {
        NSString *strName = [NSString stringWithFormat:@"%@.png",arrTemp[index]];
        [arrMTe addObject:strName];
    }
    _arrImages = [arrMTe copy];
    return _arrImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    UIScrollView *guidScrollView = [UIScrollView new];
    [self.view addSubview:guidScrollView];
    guidScrollView.delegate = self;
    guidScrollView.pagingEnabled = YES;
    guidScrollView.showsHorizontalScrollIndicator = NO;
    self.guidScrollView = guidScrollView;
    
    [guidScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.top.and.bottom.and.trailing.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(self.view);
        
    }];
    
    NSInteger count = self.arrImages.count;
    UIView *beforView = nil;
    for (NSInteger index = 0; index < count; index ++) {
        UIImageView *imageView = [UIImageView new];
        [imageView setImage:[UIImage imageNamed:self.arrImages[index]]];
        [guidScrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.mas_equalTo(guidScrollView);
            make.width.mas_equalTo(guidScrollView);
            make.height.mas_equalTo(guidScrollView);
            if (index == 0) {
                make.leading.mas_equalTo(guidScrollView);
            }else {
                make.leading.mas_equalTo(beforView.mas_trailing);
            }
            if (index == count - 1) {
                make.trailing.mas_equalTo(guidScrollView);
                [self chooseButtonWithImageView:imageView];
            }
        }];
        beforView = imageView;
        
        UIPageControl * pageContro = [[UIPageControl alloc] init];
        [self.view addSubview:pageContro];
        self.pageContro = pageContro;
        pageContro.numberOfPages = 3;
        pageContro.currentPageIndicatorTintColor = [UIColor blackColor];
        pageContro.pageIndicatorTintColor = [UIColor whiteColor];
        [pageContro mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view).offset(-30);
            make.height.mas_equalTo(37);
        }];
    }
}

- (void)chooseButtonWithImageView:(UIImageView *)imageView {
    UIButton *btnIn = [UIButton new];
    [_guidScrollView addSubview:btnIn];
    [btnIn setTitle:@"开始进入美食之旅" forState:UIControlStateNormal];
    [btnIn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnIn.titleLabel.font = [UIFont italicSystemFontOfSize:30];
    [btnIn.layer setCornerRadius:8.0];
    [btnIn.layer setBorderColor:[UIColor blackColor].CGColor];
//    [btnIn.layer setBorderWidth:1.0];
    [btnIn.layer setMasksToBounds:YES];
    
    [btnIn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(imageView).offset(-100);
        make.centerX.mas_equalTo(imageView);
    }];
    [btnIn addTarget:self action:@selector(pushIn) forControlEvents:UIControlEventTouchUpInside];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageContro.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}



- (void)pushIn {
    NSString *strVerson = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:strVerson forKey:@"oldVerson"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate ;
    [appDelegate loadController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
