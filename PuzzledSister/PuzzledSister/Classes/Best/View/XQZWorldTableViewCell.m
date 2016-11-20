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
@end

@implementation XQZWorldTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    
//    if (1) {
//        
//    }
}


@end
