//
//  XQZTopic.h
//  PuzzledSister
//
//  Created by liwei on 16/10/29.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XQZTopic : NSObject

@property (nonatomic, copy) NSString *name; /**< 昵称 */
@property (nonatomic, copy) NSString *profile_image; /**< 头像 */
@property (nonatomic, copy) NSString *ding; /**< 顶 */
@property (nonatomic, copy) NSString *repost; /**< 转发 */
@property (nonatomic, copy) NSString *cai; /**< 踩 */
@property (nonatomic, copy) NSString *comment; /**< 评论 */
@property (nonatomic, copy) NSString *passtime; /**< 发帖时间 */
@property (nonatomic, copy) NSString *created_at; /**< 创建帖子时间 */
@property (nonatomic, copy) NSString *create_time; /**< 时间 */
@property (nonatomic, copy) NSString *text; /**< 帖子内容 */
@property (nonatomic, copy) NSString *width; /**< 图片宽度 */
@property (nonatomic, copy) NSString *height; /**< 图片高度 */



@property (nonatomic, assign, readonly) CGFloat cellHeight; /**< 帖子内容的高度 */

@end
