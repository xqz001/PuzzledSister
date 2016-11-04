//
//  XQZWorldInfo.h
//  PuzzledSister
//
//  Created by liwei on 16/10/29.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQZWorldInfo : NSObject

@property (nonatomic, copy) NSString *vendor; /**< 提供商 */
@property (nonatomic, assign) NSInteger count; /**< 数量 */
@property (nonatomic, assign) NSInteger page; /**< 当前所加载的页码数 */
@property (nonatomic, copy) NSString *maxid; /**< 最大ID */
@property (nonatomic, copy) NSString *maxtime; /**< 加载下一页的时候用 */

@end
