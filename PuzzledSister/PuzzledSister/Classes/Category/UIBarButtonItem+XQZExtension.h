//
//  UIBarButtonItem+XQZExtension.h
//  PuzzledSister
//
//  Created by liwei on 16/2/23.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XQZExtension)
+(instancetype)itemWithImage:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action;
@end
