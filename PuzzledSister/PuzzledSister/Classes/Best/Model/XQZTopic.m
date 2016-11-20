//
//  XQZTopic.m
//  PuzzledSister
//
//  Created by liwei on 16/10/29.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZTopic.h"

@implementation XQZTopic {
    CGFloat _cellHeight;
}

/** 
 计算cell的高度
 */
- (CGFloat)cellHeight {
    if (_cellHeight == 0) { // 计算段子文字的高度
        
        // 文字的尺寸
        CGSize textSize = [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        
        // 文字的高度
        _cellHeight = 50 + textSize.height + 50 + [self.height floatValue];
    }
    
    return _cellHeight;
}


@end
