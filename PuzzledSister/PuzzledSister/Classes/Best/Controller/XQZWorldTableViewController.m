//
//  XQZWorldTableViewController.m
//  PuzzledSister
//
//  Created by liwei on 16/10/29.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZWorldTableViewController.h"

#import <MJRefresh.h>
#import <AFNetworking.h>

#import "XQZTopic.h"
#import "XQZWorldModel.h"
#import "XQZWorldTableViewCell.h"

@interface XQZWorldTableViewController ()

@property (nonatomic, strong) XQZWorldModel *worldModel; /**< 帖子数据 */
@property (nonatomic, strong) NSMutableArray *topicesArray; /**< 帖子数据 */

@end

@implementation XQZWorldTableViewController

#pragma mark - 懒加载方法
- (NSMutableArray *)topicesArray {
    if (_topicesArray == nil) {
        _topicesArray = [NSMutableArray array];
    }
    
    return _topicesArray;
}

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = [@"发现一个奇怪的现象，家里有熊孩子的家庭更热衷生二胎。看到好多已经有熊孩子的父母选择生二胎，就好像打游戏大号练废了，再练个小号。#糗事##内涵##搞笑#" boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    
    
    NSLog(@"=================%@=============",NSStringFromCGSize(size));
    
    // 下拉刷新
    MJRefreshStateHeader *header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDatas)];
    self.tableView.mj_header = header;
    [header beginRefreshing];
    
    // 上拉加载数据
    MJRefreshBackStateFooter *footer = [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDatas)];
    self.tableView.mj_footer = footer;
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XQZWorldTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"worldCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 上拉和下拉加载数据

/**
 *  下拉加载最新数据
 */
- (void)loadNewDatas {
    
    NSLog(@"======下拉刷新=======");
    
    // 创建请求管理者
    AFHTTPSessionManager *sessionMgr = [AFHTTPSessionManager manager];
    
    // 设置参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    param[@"a"] = @"newlist";
    param[@"c"] = @"data";
    param[@"type"] = @(self.topciType);
    
    // 发送请求
    [sessionMgr GET:BASEURL parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        
        // 请求成功
//        NSLog(@"dict = %@",responseObject);
        
        // 先移除数据
        [self.topicesArray removeAllObjects];
        
        // JSON -->  Model
        XQZWorldModel *worldModel = [XQZWorldModel mj_objectWithKeyValues:responseObject];
        self.worldModel = worldModel; // 记录每次请求的数据
        [self.topicesArray addObjectsFromArray:worldModel.list];
        
        // 刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 请求失败
        NSLog(@"error = %@",error);
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
    }];
    
}

/**
 上拉加载更多数据
 */
- (void)loadMoreDatas {
    NSLog(@"======上拉加载更多数据=======");
    
    // 创建请求管理者
    AFHTTPSessionManager *sessionMgr = [AFHTTPSessionManager manager];
    
    // 设置参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    param[@"a"] = @"newlist";
    param[@"c"] = @"data";
    param[@"type"] = @(self.topciType);
    param[@"maxtime"] = self.worldModel.info.maxtime;
    
    // 发送请求
    [sessionMgr GET:BASEURL parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        
        // 请求成功
//        NSLog(@"dict = %@",responseObject);
        
        // JSON -->  Model
        XQZWorldModel *worldModel = [XQZWorldModel mj_objectWithKeyValues:responseObject];
        self.worldModel = worldModel; // 记录每次请求的数据
        [self.topicesArray addObjectsFromArray:worldModel.list];
        
        // 刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 请求失败
        NSLog(@"error = %@",error);
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicesArray.count;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; {
    
    XQZTopic *topic = self.topicesArray[indexPath.row];
    return topic.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"worldCell";
    XQZWorldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    XQZTopic *topic = self.topicesArray[indexPath.row];
    
    cell.topic = topic;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
