//
//  ViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolTabBarViewController.h"
#import "Masonry.h"
#import "CoolMenuViewController.h"
#import "CoolnavigationViewController.h"
#import "CoolHealthViewController.h"
#import "CoolGroundViewController.h"
#import "CoolMineViewController.h"

@interface CoolTabBarViewController ()

@end

@implementation CoolTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    CoolMenuViewController *menuVC = [[CoolMenuViewController alloc] init];
    [self setViewWithViewController:menuVC imageName:@"CoolMenu" withTitle:@"美食推荐"];
    
    CoolHealthViewController *health = [[CoolHealthViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self setViewWithViewController:health imageName:@"health" withTitle:@"养生食谱"];
    
    CoolGroundViewController *groundVC = [[CoolGroundViewController alloc] init];
    [self setViewWithViewController:groundVC imageName:@"CoolGround" withTitle:@"健身饮食"];
    
    CoolMineViewController *mineVC = [[CoolMineViewController alloc] init];
    [self setViewWithViewController:mineVC imageName:@"CoolDian" withTitle:@"更多"];
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
}

- (void)setViewWithViewController:(UIViewController *)viewControll imageName:(NSString *)imageName withTitle:(NSString *)title {
    [viewControll setTitle:title];
    viewControll.tabBarItem.image = [UIImage imageNamed:imageName];
    viewControll.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:viewControll];
    
    [self addChildViewController:navigationVC];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
