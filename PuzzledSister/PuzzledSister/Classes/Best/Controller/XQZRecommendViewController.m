//
//  XQZRecommendViewController.m
//  PuzzledSister
//
//  Created by liwei on 16/3/9.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZRecommendViewController.h"
#import "XQZRecommendCell.h"

@interface XQZRecommendViewController ()
@property (nonatomic, strong) NSMutableArray *dates; /**<  */
@end

@implementation XQZRecommendViewController

- (NSMutableArray *)dates {
    if (_dates == nil) {
        _dates = [NSMutableArray array];
    }
    
    return _dates;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // 设置行高
    self.tableView.rowHeight = 60;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XQZRecommendCell class]) bundle:nil] forCellReuseIdentifier:@"recommendCell"];
    
    for (int i = 0; i < 10; i++) {
        NSString *str = [NSString stringWithFormat:@"第%d行",i];
        [self.dates addObject:str];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XQZRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommendCell"];
    
    NSString *str = self.dates[indexPath.row];
    
    cell.nameLabel.text = str;
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.dates removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


@end
