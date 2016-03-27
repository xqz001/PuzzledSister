//
//  XQZFriendThrendsViewController.m
//  PuzzledSister
//
//  Created by liwei on 16/2/27.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZFriendThrendsViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import "XQZCategoryCell.h"
#import "XQZUserCell.h"
#import "XQZCategory.h"
#import "XQZUser.h"
#import "XQZUserGroup.h"

@interface XQZFriendThrendsViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (nonatomic, strong) NSArray *leftTableViewDatas; /*< 左边表格的数据 */
@property (nonatomic, strong) NSMutableArray *rigthTableViewDatas; /*< 右边表格的数据 */

@property (nonatomic, strong) NSMutableDictionary *parameter; /**< 请求参数 */

@end

@implementation XQZFriendThrendsViewController


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = GlobalBgColor;
    
    self.navigationItem.title = @"推荐关注";
    
    self.leftTableView.tableFooterView = [[UIView alloc] init];
    self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rightTableView.tableFooterView = [[UIView alloc] init];
    self.rightTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    // 添加下拉刷新的控件
    self.rightTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    // 添加上拉刷新控件
    self.rightTableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(moreDate)];
    
    // 注册cell
    [self.leftTableView registerNib:[UINib nibWithNibName:@"XQZCategoryCell" bundle:nil] forCellReuseIdentifier:@"LeftCellIdentify"];
    [self.rightTableView registerNib:[UINib nibWithNibName:@"XQZUserCell" bundle:nil] forCellReuseIdentifier:@"rightCellIdentify"];
    
    // 加载左边表格的数据
    [self loadCategoriesDates];
    
}

/**
 * 加载左边的数据
 */
- (void)loadCategoriesDates {
    [SVProgressHUD show];
    
    // 请求数据
    // 请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        // 将请求的数据转换为模型
        MYLog(@"%@",downloadProgress);
        [SVProgressHUD dismiss];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        self.leftTableViewDatas = [XQZCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.leftTableView reloadData];
        
        // 默认选中第一行
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionBottom];
        // 刷新第二个表格
//        [self tableView:self.leftTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        [self.rightTableView.mj_header beginRefreshing];
        
        MYLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        MYLog(@"%@",error);
        [SVProgressHUD dismiss];
    }];
}

/**
 * 下拉刷新获取更多数据
 */
- (void)moreDate {
    
    MYLog(@"---------------");
    // 获取当前选中某行的categoryID
    NSIndexPath *indexPath = self.leftTableView.indexPathForSelectedRow;
    NSInteger selectedRow = indexPath.row;
    XQZCategory *category = self.leftTableViewDatas[selectedRow];
    XQZUserGroup *userGroup = category.userGroup;
    
    if (userGroup.total > userGroup.list.count) {
        // 发送请求获取更多的数据
        AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
        // 请求参数
        NSMutableDictionary *parametrs = [NSMutableDictionary dictionary];
        parametrs[@"a"] = @"list";
        parametrs[@"c"] = @"subscribe";
        parametrs[@"category_id"] = category.id;
        parametrs[@"page"] = @(userGroup.next_page);
        
        [SVProgressHUD show];
        [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parametrs progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [SVProgressHUD dismiss];
            
            XQZCategory *category = self.leftTableViewDatas[indexPath.row];
            XQZUserGroup *userGroup = [XQZUserGroup mj_objectWithKeyValues:responseObject];
            [category.userGroup.list addObjectsFromArray:userGroup.list];
            category.userGroup.next_page = userGroup.next_page;
            [self.rightTableView reloadData];
            MYLog(@"%@",responseObject);
            
            // 结束刷新
            [self.rightTableView.mj_footer endRefreshing];
            
            if (category.userGroup.list.count < userGroup.total) {
                [self.rightTableView.mj_footer resetNoMoreData];
            } else {
                [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    } else {
        [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
    }
}

/**
 * 下拉获取更多最新的数据
 */
- (void)loadNewDate {
    MYLog(@"获取最新数据");
    
    // 获取左边表格选中的category模型
    XQZCategory *category = self.leftTableViewDatas[[self.leftTableView indexPathForSelectedRow].row];
    
    // 发送请求，获取右边表格的数据
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 请求参数
    NSMutableDictionary *parametrs = [NSMutableDictionary dictionary];
    parametrs[@"a"] = @"list";
    parametrs[@"c"] = @"subscribe";
    parametrs[@"category_id"] = category.id;
    parametrs[@"page"] = @"1";
    self.parameter = parametrs;
    
    [SVProgressHUD show];
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parametrs progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
    
        XQZUserGroup *userGroup = [XQZUserGroup mj_objectWithKeyValues:responseObject];
        category.userGroup = userGroup;
        
        // 当返回的数据不是最后一次请求的数据的话不刷新表格
        if (self.parameter != parametrs)  return ;
        
        [self.rightTableView reloadData];
        
        // 结束下拉刷新
        [self.rightTableView.mj_header endRefreshing];
        
        if (category.userGroup.list.count< userGroup.total) {
            [self.rightTableView.mj_footer resetNoMoreData];
        } else {
            [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
        }
        MYLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.leftTableView == tableView) {
        
        return self.leftTableViewDatas.count;
        
    } else {
        NSIndexPath *indexPath = self.leftTableView.indexPathForSelectedRow;
        NSInteger selectedRow = indexPath.row;
        XQZCategory *category = self.leftTableViewDatas[selectedRow];
        
        return category.userGroup.list.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        
        XQZCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftCellIdentify"];
        XQZCategory *category = self.leftTableViewDatas[indexPath.row];
        cell.category = category;
        
        return cell;
        
    } else {
        
        XQZUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightCellIdentify"];
        
        // 获取左边表格选中的行号
        NSIndexPath *selectedIndexPath = self.leftTableView.indexPathForSelectedRow;
        NSInteger selectedRow = selectedIndexPath.row;
        
        // 取出模型
        XQZCategory *category = self.leftTableViewDatas[selectedRow];
        XQZUser *user = category.userGroup.list[indexPath.row];
        cell.user = user;
        
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.leftTableView == tableView) { // 选中左边的表格
        
        XQZCategory *category = self.leftTableViewDatas[indexPath.row];
        
        if (category.userGroup.list.count) { // 右边表格已经有数据了，不需要再次从网络获取请求了
            [self.rightTableView reloadData];
        } else {
            
            [self.rightTableView.mj_footer resetNoMoreData];
            
            // 开始下拉刷新
            [self.rightTableView.mj_header beginRefreshing];
        }
        
    } else { // 选中右边表格
        
    }
}


- (void)dealloc {
    MYLogFunc
    
    [SVProgressHUD dismiss];
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
