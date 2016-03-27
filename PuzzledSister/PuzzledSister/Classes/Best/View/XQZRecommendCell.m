//
//  XQZRecommendCell.m
//  PuzzledSister
//
//  Created by liwei on 16/3/9.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZRecommendCell.h"

@interface XQZRecommendCell ()

@end

@implementation XQZRecommendCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


// 从写set方法改变cell的位置和尺寸
- (void)setFrame:(CGRect)frame {
    
    CGFloat x = frame.origin.x + 10;
    CGFloat y = frame.origin.y;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGRect customFrame = CGRectMake(x, y, width - 2 * 10, 59);
    
//    MYLog(@"-------%p",self);

    MYLog(@"%@",self.nameLabel.text);
    MYLog(@"=======%@",NSStringFromCGRect(frame));
    MYLog(@"\n");
    
    [super setFrame:customFrame];
}

@end
