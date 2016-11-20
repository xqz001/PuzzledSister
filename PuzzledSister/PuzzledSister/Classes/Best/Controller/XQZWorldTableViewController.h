//
//  XQZWorldTableViewController.h
//  PuzzledSister
//
//  Created by liwei on 16/10/29.
//  Copyright © 2016年 liwei. All rights reserved.
//

// 定义一个枚举用来区别类型
typedef enum {
    XQZTopicTypeAll = 1,
    XQZTopicTypeWorld = 29,
    XQZTopicTypeVideo = 41,
    XQZTopicTypeAudio = 31,
    XQZTopicTypePicture = 10,
} XQZTopicType;

#import <UIKit/UIKit.h>

@interface XQZWorldTableViewController : UITableViewController

@property (nonatomic, assign) XQZTopicType topciType; /**< 帖子类型 */

@end
