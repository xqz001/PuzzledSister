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
    
//    if (1) {
//        
//    }
}

@end
