//
//  AttentionViewController.m
//  PuzzledSister
//
//  Created by liwei on 16/1/28.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZAttentionViewController.h"
#import "UIBarButtonItem+XQZExtension.h"
#import "XQZFriendThrendsViewController.h"
#import "XQZLoginViewController.h"

@interface XQZAttentionViewController ()

@end

@implementation XQZAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GlobalBgColor;
    
    
    UIBarButtonItem *item = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" selectedImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsRecomment)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)friendsRecomment {
//    MYLogFunc
    XQZFriendThrendsViewController *friendThrends = [[XQZFriendThrendsViewController alloc] init];
    [self.navigationController pushViewController:friendThrends animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  登录按钮的点击事件
 */
- (IBAction)LoginBtnClick:(UIButton *)sender {
    XQZLoginViewController *loginVc = [[XQZLoginViewController alloc] init];
    
    [self presentViewController:loginVc animated:YES completion:nil];
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
