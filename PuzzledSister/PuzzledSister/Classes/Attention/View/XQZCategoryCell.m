//
//  XQZCategoryCell.m
//  PuzzledSister
//
//  Created by liwei on 16/2/28.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZCategoryCell.h"
#import "XQZCategory.h"


@interface XQZCategoryCell ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation XQZCategoryCell

- (void)awakeFromNib {
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setCategory:(XQZCategory *)category {
    _category = category;
    
    self.categoryLabel.text = category.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        self.leftView.backgroundColor = [UIColor redColor];
        self.categoryLabel.textColor = [UIColor redColor];
//        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.leftView.backgroundColor = [UIColor clearColor];
        self.categoryLabel.textColor = [UIColor grayColor];
//        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    
    // Configure the view for the selected state
}

@end
