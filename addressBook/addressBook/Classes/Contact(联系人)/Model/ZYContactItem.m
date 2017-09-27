//
//  ZYContactItem.m
//  addressList
//
//  Created by 罂粟 on 2017/9/5.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYContactItem.h"

@implementation ZYContactItem

+ (instancetype)itemWithName:(NSString *)name andPhoneNumber:(NSString *)phoneNumber
{
    // 创建模型
    ZYContactItem *item = [[ZYContactItem alloc] init];
    item.name = name;
    item.phoneNumber = phoneNumber;
    
    return item;
}

@end
