//
//  ZYAddContactVC.m
//  addressBook
//
//  Created by 罂粟 on 2017/9/7.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYAddContactVC.h"
#import "ZYContactItem.h"

@interface ZYAddContactVC ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextF;

@property (weak, nonatomic) IBOutlet UITextField *phoneNum;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation ZYAddContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置phoneNum的弹出键盘为数字键盘
    [self.phoneNum setKeyboardType:UIKeyboardTypeNumberPad];
    
    // 监听nameTextF,phoneNumTextF事件
    [self.nameTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneNum addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    // 当控制器view加载完后判断文本框中是否有内容
    [self textChange];
}

- (void)textChange
{
    self.addBtn.enabled = self.nameTextF.text.length && self.phoneNum.text.length;
}

// 添加按钮的点击事件
- (IBAction)addBtnClick:(UIButton *)sender
{
//     当点击添加按钮后,跳转到上一个界面(逆向传值)
//     把输入的姓名和电话传递到上一个控制器
    ZYContactItem *contactItem = [ZYContactItem itemWithName:self.nameTextF.text andPhoneNumber:self.phoneNum.text];
    
    if ([self.delegate respondsToSelector:@selector(addContactVC:andItem:)]) {
        // 此时的delegate 为ZYContactVC
        [self.delegate addContactVC:self andItem:contactItem];
        
    }
    
    // 跳转控制器
    [self.navigationController popViewControllerAnimated:YES];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
