//
//  XQZUserGroup.h
//  PuzzledSister
//
//  Created by liwei on 16/3/3.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQZUserGroup : NSObject
//"next_page" = 2;
//total = 7;
//"total_page" = 1;

@property (nonatomic, assign) NSInteger next_page; /**< 下一页的页码 */
@property (nonatomic, assign) NSInteger total; /**< 一共有多少条数据 */
@property (nonatomic, assign) NSInteger total_page; /**< 总页数 */
@property (nonatomic, strong) NSMutableArray *list; /**< 存发用户模型 */
@end
