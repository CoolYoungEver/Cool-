//
//  CoolMineViewController.m
//  Cool美食
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMineViewController.h"
#import "CoolYaoTableViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface CoolMineViewController ()

@property (nonatomic, copy) NSArray *arrDatas;

@end

@implementation CoolMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}


- (void)loadDefaultSetting {
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
    
    UIImageView *imageYao = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageYao.image = [UIImage imageNamed:@"yaoyiyao"];
    [self.view addSubview:imageYao];
}

//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
//    
//}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    CoolYaoTableViewController *yaoVC = [CoolYaoTableViewController new];
    [self.navigationController pushViewController:yaoVC animated:YES];

    [self shakeshake];
}

- (void)shakeshake {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
