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
@property (nonatomic, weak) UIButton *selectedButton; /**< 选中的按钮 */
@property (nonatomic, weak) UIView *indiretorView; /**< 选中的按钮 */
@property (nonatomic, strong) NSMutableArray *titleButtonsArray; /**< 选中的按钮 */


@end

@implementation XQZBestViewController

#pragma mark - 懒加载
- (NSMutableArray *)titleButtonsArray {
    if (_titleButtonsArray == nil) {
        _titleButtonsArray = [NSMutableArray array];
    }
    
    return _titleButtonsArray;
}

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    XQZTestViewController *vc1 = [[XQZTestViewController alloc] init];
    vc1.title = @"头条";
    vc1.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:vc1];
    
    XQZTestViewController *vc2 = [[XQZTestViewController alloc] init];
    vc2.title = @"娱乐";
    vc2.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:vc2];

    XQZTestViewController *vc3 = [[XQZTestViewController alloc] init];
    vc3.title = @"段子";
    vc3.view.backgroundColor = [UIColor lightGrayColor];
    [self addChildViewController:vc3];
    
    XQZTestViewController *vc4 = [[XQZTestViewController alloc] init];
    vc4.title = @"视频";
    vc4.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:vc4];
    
    XQZTestViewController *vc5 = [[XQZTestViewController alloc] init];
    vc5.title = @"图片";
    vc5.view.backgroundColor = [UIColor brownColor];
    [self addChildViewController:vc5];
    
}

/**
 *  添加标题滚动视图
 */
- (void)setupTitlesContent {
    
    // 标题视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.titlesScrollView = scrollView;
    CGFloat scrollViewHeigth = 44;
    scrollView.frame = CGRectMake(0, 64, self.view.frame.size.width, scrollViewHeigth);
//    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    NSInteger count = self.childViewControllers.count;
    CGFloat btnWidth = self.view.frame.size.width / count;
    
    for (int i = 0; i < count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(btnWidth * i, 0, btnWidth, 44);
        
        NSString *title = self.childViewControllers[i].title;
        
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [button addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
        }
        
        [self.titleButtonsArray addObject:button];
        
        [scrollView addSubview:button];
    }
    
    // 标题底部指示器
    UIView *titleIndiretorView = [[UIView alloc] init];
    titleIndiretorView.backgroundColor = [UIColor redColor];
    self.indiretorView = titleIndiretorView;
    
    // 设置标题底部指示器的frame
    CGFloat titleIndiretorViewHeigth = 2;
    CGFloat titleIndiretorViewWidth = [self.childViewControllers[0].title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}].width;
    titleIndiretorView.frame = CGRectMake(0, scrollViewHeigth - titleIndiretorViewHeigth, titleIndiretorViewWidth, titleIndiretorViewHeigth);
    CGPoint btnCenter = self.selectedButton.center;
    btnCenter.y = titleIndiretorView.center.y;
    titleIndiretorView.center = btnCenter;
    
    [scrollView addSubview:titleIndiretorView];
    
    // 内容视图
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    self.contentScrollView = contentScrollView;
    contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.frame.size.width, 0);
    contentScrollView.delegate = self;
    contentScrollView.frame = CGRectMake(0, CGRectGetMaxY(scrollView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(scrollView.frame));
    contentScrollView.backgroundColor = [UIColor yellowColor];
    contentScrollView.pagingEnabled = YES;
//    contentScrollView.showsHorizontalScrollIndicator = NO;
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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    // 获取按钮的索引，即子控制器的索引
    NSInteger index = [self.titleButtonsArray indexOfObject:self.selectedButton];
    
    UITableViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.view.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    vc.tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    
    if (![scrollView.subviews containsObject:vc.view]) {
        
        [scrollView addSubview:vc.view];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"================");
    
    NSInteger index = scrollView.contentOffset.x / self.view.frame.size.width;
    UIButton *button = self.titleButtonsArray[index];
    
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // 执行动画
    [UIView animateWithDuration:0.25 animations:^{
        
        CGPoint btnCenter = self.selectedButton.center;
        btnCenter.y = self.indiretorView.center.y;
        self.indiretorView.center = btnCenter;
    }];
    
    UITableViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.view.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    vc.tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    
    if (![scrollView.subviews containsObject:vc.view]) {
        
        [scrollView addSubview:vc.view];
    }
}

#pragma mark - 标题按钮的点击事件
- (void)titleBtnClick:(UIButton *)button {
    
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // 执行动画
    [UIView animateWithDuration:0.25 animations:^{
        
        CGPoint btnCenter = self.selectedButton.center;
        btnCenter.y = self.indiretorView.center.y;
        self.indiretorView.center = btnCenter;
    }];
    
    NSInteger buttonIndex = [self.titleButtonsArray indexOfObject:button];
    CGPoint offset = CGPointMake(buttonIndex * self.view.frame.size.width, 0);
    
    // 设置contentScrollView的偏移量
    [self.contentScrollView setContentOffset:offset animated:YES];
}

@end


























