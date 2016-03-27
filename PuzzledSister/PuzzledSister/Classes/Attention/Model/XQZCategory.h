//
//  XQZCategory.h
//  PuzzledSister
//
//  Created by liwei on 16/2/27.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XQZUserGroup;

@interface XQZCategory : NSObject

@property (nonatomic, copy) NSString * name; /**< 类别名称 */ 
@property (nonatomic, copy) NSString *count; /**< 个数 */
@property (nonatomic, copy) NSString *id; /**< 类别ID */
@property (nonatomic, strong) XQZUserGroup *userGroup; /**< 存放当前分类下面的用户 */



@end
