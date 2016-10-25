//
//  XQZTabBar.m
//  PuzzledSister
//
//  Created by liwei on 16/2/20.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZTabBar.h"

@interface XQZTabBar ()

@property (nonatomic, weak) UIButton *button; /*< 中间按钮 */

@end

@implementation XQZTabBar

- (instancetype)init {
    if (self = [super init]) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button = button;
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        
        [self addSubview:button];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.button.frame = CGRectMake(0, 0, self.button.currentBackgroundImage.size.width, self.button.currentBackgroundImage.size.height);
    self.button.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5 + 2);
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.frame.size.width / 5;
    CGFloat height = self.frame.size.height;
    NSInteger count = 0;
    
    for (UIView *view in self.subviews) {
//        MYLog(@"===%@",view);
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            x = width *count;
            if (count >= 2) {
                x = width * (count + 1);
            }
            view.frame = CGRectMake(x, y, width, height);
            count++;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
