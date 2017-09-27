//
//  ZYContactItem.h
//  addressList
//
//  Created by 罂粟 on 2017/9/5.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYContactItem : NSObject

/** 姓名 */
@property(nonatomic,strong)NSString *name;

/** 手机号 */
@property(nonatomic,strong)NSString *phoneNumber;

// 快速创建数据模型
+ (instancetype)itemWithName:(NSString *)name andPhoneNumber:(NSString *)phoneNumber;

@end
