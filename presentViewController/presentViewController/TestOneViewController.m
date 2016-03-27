//
//  TestOneViewController.m
//  presentViewController
//
//  Created by liwei on 16/2/26.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "TestOneViewController.h"
#import "XXOOViewController.h"

@interface TestOneViewController ()

@end

@implementation TestOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}
- (IBAction)xxxx:(id)sender {
    XXOOViewController *xxx = [[XXOOViewController alloc] init];
    UINavigationController *navv = [[UINavigationController alloc] initWithRootViewController:xxx];
    
    [self.navigationController presentViewController:navv animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
