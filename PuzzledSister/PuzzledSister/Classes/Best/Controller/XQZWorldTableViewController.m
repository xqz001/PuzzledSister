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
 *  下拉加载数据
 */
- (void)loadNewDatas {
    
    NSLog(@"======下拉刷新=======");
    
    // 创建请求管理者
    AFHTTPSessionManager *sessionMgr = [AFHTTPSessionManager manager];
    
    // 设置参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    param[@"a"] = @"newlist";
    param[@"c"] = @"data";
    param[@"type"] = @(29);
    
    // 发送请求
    [sessionMgr GET:BASEURL parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        
        // 请求成功
        NSLog(@"dict = %@",responseObject);
        
        // 先移除数据
        [self.topicesArray removeAllObjects];
        
        // JSON -->  Model
        XQZWorldModel *worldModel = [XQZWorldModel mj_objectWithKeyValues:responseObject];
        [self.topicesArray addObjectsFromArray:worldModel.list];
        
        NSLog(@"+++++------- %@",worldModel);
        // 刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 请求失败
        NSLog(@"error = %@",error);
        
    }];
    
}

/**
 上拉加载数据
 */
- (void)loadMoreDatas {
    NSLog(@"======上拉加载更多数据=======");
    
    // 延迟2s 结束刷新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
        
        NSLog(@"======加载结束=======");
    });
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicesArray.count;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; {
    return 180;
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
