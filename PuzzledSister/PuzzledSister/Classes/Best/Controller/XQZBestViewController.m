//
//  BestViewController.m
//  PuzzledSister
//
//  Created by liwei on 16/1/28.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZBestViewController.h"
#import "UIBarButtonItem+XQZExtension.h"
#import "XQZTestViewController.h"
#import "XQZRecommendViewController.h"

@interface XQZBestViewController ()

@end

@implementation XQZBestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100) / 100.0 green:arc4random_uniform(100) / 100.0 blue:arc4random_uniform(100) / 100.0 alpha:1.0];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIBarButtonItem *item = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" selectedImage:@"MainTagSubIconClick" target:self action:@selector(MainTagClick)];
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    XQZTestViewController *test = [[XQZTestViewController alloc] init];
    test.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:test animated:YES];
}

-(void)MainTagClick {
    MYLogFunc
    
    XQZRecommendViewController *recommendVc = [[XQZRecommendViewController alloc] init];
    recommendVc.view.backgroundColor = GlobalBgColor;
    [self.navigationController pushViewController:recommendVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
