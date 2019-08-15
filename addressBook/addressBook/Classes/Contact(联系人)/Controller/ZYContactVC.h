//
//  ZYContactVC.h
//  addressBook
//
//  Created by 罂粟 on 2017/9/7.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYContactItem;
@interface ZYContactVC : UITableViewController

/** 接收登录界面传来的用户名 */
@property (nonatomic, copy) NSString *name;

/** 接收数据的模型 */
@property (nonatomic, strong) ZYContactItem *contactItem;

@end
