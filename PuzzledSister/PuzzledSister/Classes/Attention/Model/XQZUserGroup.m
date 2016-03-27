//
//  XQZUserGroup.m
//  PuzzledSister
//
//  Created by liwei on 16/3/3.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "XQZUserGroup.h"
#import <MJExtension.h>

@implementation XQZUserGroup

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"list" : @"XQZUser"
             
             };
}

@end
