//
//  BestViewController.m
//  PuzzledSister
//
//  Created by liwei on 16/1/28.
//  Copyright © 2016年 liwei. All rights reserved.
//  精华控制器

#import "XQZBestViewController.h"
#import "UIBarButtonItem+XQZExtension.h"
#import "XQZTestViewController.h"
#import "XQZRecommendViewController.h"

@interface XQZBestViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *titles; /**< 标题数组 */
@property (nonatomic, weak) UIScrollView *titlesScrollView; /**< 标题滚动试图 */
@property (nonatomic, weak) UIScrollView *contentScrollView; /**< 内容滚动视图 */

@end

@implementation XQZBestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = GlobalBgColor;
    
    // 初始化标题数组
    self.titles = @[@"头条",@"娱乐",@"段子",@"视频",@"图片"];
    
    // 设置导航栏
    [self setNavigationBar];
    
    // 初始化子控制器
    [self setupChildViewController];
    
    // 添加标题滚动视图
    [self setupTitlesContent];
    
}

/**
 *  初始化子控制器
 */
- (void)setupChildViewController {
    /**
     添加子控制器的View到scrollview上有两种思路：
     1.先将子控制器直接添加到当前的控制器中，并将子控制器的view添加到内容视图的scorllview中，此时要用到内容视图的scrollview，
       可以通过懒加载的方式来创建内容视图的scrollview
     2.在这个方法中直接将子控制器添加到当前的控制器中，然后在scrollview的代理方法中取出对应的子控制器，将子控制器添加到scrollview中
     
     这里采用第一种方法
     */
    UITableViewController *vc1 = [[UITableViewController alloc] init];
    vc1.title = @"头条";
    vc1.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:vc1];
    
    UITableViewController *vc2 = [[UITableViewController alloc] init];
    vc2.title = @"娱乐";
    vc2.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:vc2];

    UITableViewController *vc3 = [[UITableViewController alloc] init];
    vc3.title = @"段子";
    vc3.view.backgroundColor = [UIColor lightGrayColor];
    [self addChildViewController:vc3];
    
}

/**
 *  添加标题滚动视图
 */
- (void)setupTitlesContent {
    
    // 标题视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.titlesScrollView = scrollView;
    scrollView.frame = CGRectMake(0, 64, self.view.frame.size.width, 44);
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    // 内容视图
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    self.contentScrollView = contentScrollView;
    contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.frame.size.width, 0);
    contentScrollView.delegate = self;
    contentScrollView.frame = CGRectMake(0, CGRectGetMaxY(scrollView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(scrollView.frame));
    contentScrollView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:contentScrollView];
    
    // 将第一个子控制器的View加上去
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

/**
 *  设置导航条
 */
- (void)setNavigationBar {
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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
//    NSInteger i = scrollView.contentSize.width / self.view.frame.size.width - 1;
//    
//    UIViewController *vc = self.childViewControllers[i];
//    vc.view.frame = CGRectMake(i * self.view.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
//    
//    [scrollView addSubview:vc.view];
}


@end
