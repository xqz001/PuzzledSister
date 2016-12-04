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

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"imageUrl":@"image0"};
}

/** 
 计算cell的高度
 */
- (CGFloat)cellHeight {
    if (_cellHeight == 0) { // 计算段子文字的高度
        
//        NSLog(@"\n begin  \n %@ \n %@ \n %@ \n end \n",self.image0,self.image1,self.image2);
        
        // 文字的尺寸
        CGSize textSize = [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        
        NSLog(@"imageW == %@,  imageH == %@",self.width,self.height);
        
        CGFloat imageW = (textSize.width * [self.height floatValue]) / [self.height floatValue];
        CGFloat imageH = textSize.width * [self.height floatValue] / [self.width floatValue];
        self.imageH = imageH;
        
        // 文字的高度
        _cellHeight = 50 + textSize.height + 50 + [self.height floatValue] + 10;
        
        _contentLabelMaxH = 50 + textSize.height + 20;
    }
    return _cellHeight;
}


@end
