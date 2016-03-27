//
//  XQZUserCell.m
//  PuzzledSister
//
//  Created by liwei on 16/2/28.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZUserCell.h"
#import "XQZUser.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface XQZUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *screen_name;
@property (weak, nonatomic) IBOutlet UILabel *fans_count;

@end

@implementation XQZUserCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setUser:(XQZUser *)user {
    _user = user;
    
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.screen_name.text = user.screen_name;
    self.fans_count.text = [NSString stringWithFormat:@"%@人关注",user.fans_count];
    
    if (user.is_vip) {
        self.screen_name.textColor = [UIColor redColor];
    } else {
        self.screen_name.textColor = [UIColor blackColor];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
