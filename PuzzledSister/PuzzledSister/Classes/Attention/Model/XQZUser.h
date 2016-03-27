//
//  XQZUser.h
//  PuzzledSister
//
//  Created by liwei on 16/2/28.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQZUser : NSObject

//"fans_count" = 108400;
//gender = 2;
//header = "http://wimg.spriteapp.cn/profile/large/2015/05/05/554883fcaaaa7_mini.jpg";
//introduction = "";
//"is_follow" = 0;
//"is_vip" = 0;
//"screen_name" = "\U9648\U7fd4\U516d\U70b9\U534a";
//"tiezi_count" = 353;
//uid = 13219299;

@property (nonatomic, copy) NSString *fans_count; /**< 粉丝数量 */
@property (nonatomic, copy) NSString *header; /**< 头像URL */
@property (nonatomic, copy) NSString *screen_name; /**< 昵称 */
@property (nonatomic, copy) NSString *tiezi_count; /**< 用户发的贴子数 */
@property (nonatomic, assign) BOOL is_vip; /**< 是否为会员 */
@property (nonatomic, assign) NSInteger gender; /**< 性别 */

@end
