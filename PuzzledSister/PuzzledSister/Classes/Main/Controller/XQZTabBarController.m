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
#import "XQZTabBar.h"
#import "XQZNavigationViewController.h"

@interface XQZTabBarController ()

@end

@implementation XQZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tabbar文字的颜色
    UITabBarItem *tabbar = [UITabBarItem appearance];
    [tabbar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    [tabbar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateSelected];
    
    // 设置控制器的子控制器
    XQZBestViewController *best = [[XQZBestViewController alloc] init];
    [self setupChildVC:best title:@"精华" image:[UIImage imageNamed:@"tabBar_essence_icon"] selectedImage:[UIImage imageNamed:@"tabBar_essence_click_icon"]];
    
    XQZNewViewController *new = [[XQZNewViewController alloc] init];
    [self setupChildVC:new title:@"最新" image:[UIImage imageNamed:@"tabBar_new_icon"] selectedImage:[UIImage imageNamed:@"tabBar_new_click_icon"]];
    
    XQZAttentionViewController *attention = [[XQZAttentionViewController alloc] init];
    [self setupChildVC:attention title:@"关注" image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"]];
    
    XQZMeViewController *me = [[XQZMeViewController alloc] init];
    [self setupChildVC:me title:@"我" image:[UIImage imageNamed:@"tabBar_me_icon"] selectedImage:[UIImage imageNamed:@"tabBar_me_click_icon"]];
    
    XQZTabBar *tabBar = [[XQZTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    vc.title = title;
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    XQZNavigationViewController *nav = [[XQZNavigationViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}



@end
