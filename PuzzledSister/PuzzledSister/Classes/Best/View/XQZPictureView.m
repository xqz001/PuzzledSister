//
//  XQZPictureView.m
//  PuzzledSister
//
//  Created by liwei on 2016/11/23.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZPictureView.h"

#import <UIImageView+WebCache.h>

@interface XQZPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIImageView *gitPicture;
@property (weak, nonatomic) IBOutlet UIButton *seeBigPicture;

@end

@implementation XQZPictureView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopic:(XQZTopic *)topic {
    _topic = topic;
    
    BOOL isGifImage = [[topic.imageUrl.pathExtension lowercaseString] isEqualToString:@"gif"] ? YES : NO;
    if (isGifImage) {
        self.gitPicture.hidden = NO;
    } else {
        self.gitPicture.hidden = YES;
    }
    
    [self.picture sd_setImageWithURL:[NSURL URLWithString:topic.imageUrl]];
}


@end
