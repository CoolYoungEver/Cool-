//
//  CoolHealthViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolHealthViewController.h"
#import "CoolHealthScrollView.h"
#import "Masonry.h"
#import "CoolHealthPageViewController.h"


@interface CoolHealthViewController () <UIPageViewControllerDataSource,UIPageViewControllerDelegate>
@property (nonatomic, copy) NSArray *arrTitles;
@property (nonatomic,copy) NSArray *arrControllers;
@property (nonatomic, assign) NSInteger indexController;
@property (nonatomic,weak) CoolHealthScrollView *healthSVC;
@property (nonatomic, assign) NSInteger btnIndex;


@end

@implementation CoolHealthViewController

- (NSArray *)arrTitles {
    if (!_arrTitles) {
        _arrTitles = @[@"滋阴养颜",@"补肾壮阳",@"减肥瘦身",@"婴儿辅食",@"养胃",@"养肝降噪",@"止咳润肺",@"产后调理"];
    }
    return _arrTitles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    self.navigationController.navigationBar.translucent = NO;
    NSInteger count = self.arrTitles.count;
    NSMutableArray *arrMTemp = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger index = 0; index < count; index ++) {
        CoolHealthPageViewController *firstVC = [CoolHealthPageViewController new];
        firstVC.title = self.arrTitles[index];
        firstVC.indexBtn = index;
        [arrMTemp addObject:firstVC];
    }
    _arrControllers = [arrMTemp copy];
    
    
    self.dataSource = self;
    self.delegate = self;
    
    CoolHealthScrollView *firstSCV = [CoolHealthScrollView new];
    firstSCV.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40);
    firstSCV.arrTitles = self.arrTitles;
    [self.view addSubview:firstSCV];
    _healthSVC = firstSCV;
    __weak typeof(self) selfWeak = self;
    [firstSCV setBlkChooseAction:^(NSInteger index) {
        [selfWeak chooseViewControllerAtIndex:index];
    }];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIPageViewControllerNavigationDirection direction;
    CoolHealthPageViewController *firstPVC = self.arrControllers[0];
    [self setViewControllers:@[firstPVC] direction:direction animated:YES completion:nil];
}

- (void)chooseViewControllerAtIndex:(NSInteger)index {
    UIPageViewControllerNavigationDirection direction;
    if (index > self.indexController) {
        direction = UIPageViewControllerNavigationDirectionForward;
    }else {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    CoolHealthPageViewController *firstPVC = self.arrControllers[index];
    [self setViewControllers:@[firstPVC] direction:direction animated:YES completion:nil];
    self.indexController = index;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    for (NSInteger index = 0; index < self.arrControllers.count; index ++) {
        CoolHealthPageViewController *firstVC = self.arrControllers[index];
        if (firstVC == viewController) {
            NSInteger indexCurrent = index - 1;
            if (indexCurrent >= 0) {
                return self.arrControllers[indexCurrent];
            }
        }
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    for (NSInteger index = 0; index < self.arrControllers.count; index ++) {
        CoolHealthPageViewController *firstVC = self.arrControllers[index];
        if (firstVC == viewController) {
            NSInteger indexCurrent = index + 1;
            if (indexCurrent < self.arrControllers.count) {
                return self.arrControllers[indexCurrent];
            }
        }
    }
    return nil;
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    CoolHealthPageViewController *firstVCurrent = self.viewControllers.firstObject;
    NSInteger count = self.arrControllers.count;
    for (NSInteger index = 0; index < count; index ++) {
        CoolHealthPageViewController *firstVC = self.arrControllers[index];
        if (firstVC == firstVCurrent) {
            self.healthSVC.countIndex = index;
            break;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
