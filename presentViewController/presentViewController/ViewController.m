//
//  ViewController.m
//  presentViewController
//
//  Created by liwei on 16/2/24.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClick:(id)sender {
    
    TestViewController *test = [[TestViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
    [self.navigationController pushViewController:test animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
