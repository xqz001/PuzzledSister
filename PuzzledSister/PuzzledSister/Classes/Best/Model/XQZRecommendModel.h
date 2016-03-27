//
//  XQZRecommendModel.h
//  PuzzledSister
//
//  Created by liwei on 16/3/9.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQZRecommendModel : NSObject
@property (nonatomic, copy) NSString *name; /**< 昵称 */
@property (nonatomic, copy) NSString *followCount; /**< 订阅数 */
@property (nonatomic, copy) NSString *iconUrl; /**< 头像URL */
@end
