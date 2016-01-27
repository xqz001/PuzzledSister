//
//  XQZTabBarController.m
//  PuzzledSister
//
//  Created by liwei on 16/1/28.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZTabBarController.h"
#import "XQZBestViewController.h"
#import "XQZAttentionViewController.h"
#import "XQZNewViewController.h"
#import "XQZMeViewController.h"

@interface XQZTabBarController ()

@end

@implementation XQZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置控制器的子控制器
    XQZBestViewController *best = [[XQZBestViewController alloc] init];
    [self setupChildVC:best title:@"精华"];
    
    XQZNewViewController *new = [[XQZNewViewController alloc] init];
    [self setupChildVC:new title:@"最新"];
    
    XQZAttentionViewController *attention = [[XQZAttentionViewController alloc] init];
    [self setupChildVC:attention title:@"关注"];
    
    XQZMeViewController *me = [[XQZMeViewController alloc] init];
    [self setupChildVC:me title:@"我"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title {
    vc.title = title;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
