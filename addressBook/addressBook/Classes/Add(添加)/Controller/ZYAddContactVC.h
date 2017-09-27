//
//  ZYAddContactVC.h
//  addressBook
//
//  Created by 罂粟 on 2017/9/7.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYAddContactVC,ZYContactItem;
@protocol ZYAddContactVCDelegate <NSObject>

// 协议方法
- (void)addContactVC:(ZYAddContactVC *)addContactVC andItem:(ZYContactItem *)contactItem;

@end

@interface ZYAddContactVC : UIViewController

/** 代理属性 */
@property (nonatomic, weak) id<ZYAddContactVCDelegate> delegate;

@end
