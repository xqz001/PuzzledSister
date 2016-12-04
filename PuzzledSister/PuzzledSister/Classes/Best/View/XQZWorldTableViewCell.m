//
//  XQZWorldTableViewCell.m
//  PuzzledSister
//
//  Created by liwei on 16/10/31.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZWorldTableViewCell.h"

#import <UIImageView+WebCache.h>

#import "XQZTopic.h"
#import "XQZPictureView.h"

@interface XQZWorldTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (nonatomic, weak) XQZPictureView *pictureView; /*< 中间的图片 */
@end

@implementation XQZWorldTableViewCell

- (XQZPictureView *)pictureView {
    if (_pictureView == nil) {
        
        XQZPictureView *pictureView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XQZPictureView class]) owner:nil options:nil] lastObject];
        self.pictureView = pictureView;
        
        [self.contentView addSubview:pictureView];
    }
    
    return _pictureView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setTopic:(XQZTopic *)topic {
    _topic = topic;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image]];
    self.nameLabel.text = topic.name;
    self.timeLabel.text = topic.create_time;
    self.contentLabel.text = topic.text;
    [self.dingBtn setTitle:topic.ding forState:UIControlStateNormal];
    [self.caiBtn setTitle:topic.cai forState:UIControlStateNormal];
    [self.repostBtn setTitle:topic.repost forState:UIControlStateNormal];
    [self.commentBtn setTitle:topic.comment forState:UIControlStateNormal];
    
    if ([topic.type integerValue] != 29) {

        self.pictureView.frame = CGRectMake(10, topic.contentLabelMaxH, [UIScreen mainScreen].bounds.size.width - 20, [topic.height floatValue]);
        
        self.pictureView.topic = topic;
        
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    NSLog(@"layoutSubViews-----%@----%@",NSStringFromCGRect(self.contentLabel.frame),NSStringFromCGRect(self.frame));
}


@end
