//
//  XQZTestViewController.m
//  PuzzledSister
//
//  Created by liwei on 16/2/25.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZTestViewController.h"

@interface XQZTestViewController ()

@end

@implementation XQZTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)nnn {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellIdentifier"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@--%ld",self.title,indexPath.row];
    
    return cell;
}

@end
