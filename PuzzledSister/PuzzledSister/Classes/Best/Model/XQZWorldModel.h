//
//  XQZWorldModel.h
//  PuzzledSister
//
//  Created by liwei on 16/10/29.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MJExtension.h>

#import "XQZWorldInfo.h"

@interface XQZWorldModel : NSObject

@property (nonatomic, strong) XQZWorldInfo *info; /**< 帖子信息 */
@property (nonatomic, strong) NSArray *list; /**< 帖子数据 */

@end
