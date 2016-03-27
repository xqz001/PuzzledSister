//
//  UIBarButtonItem+XQZExtension.m
//  PuzzledSister
//
//  Created by liwei on 16/2/23.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "UIBarButtonItem+XQZExtension.h"

@implementation UIBarButtonItem (XQZExtension)

+(instancetype)itemWithImage:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted ];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
